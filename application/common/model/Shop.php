<?php

namespace app\common\model;

use think\exception\DbException;
use think\exception\PDOException;
use think\model\concern\SoftDelete;

class Shop extends Common
{
    protected $pk = 'id';
    protected $readonly = ['id', 'secret_id', 'ctime'];

    protected $auto = ['secret_id'];
    protected $insert = ['status' => 1];

    protected $autoWriteTimestamp = true;
    protected $createTime = 'ctime';
    protected $updateTime = 'utime';
    use SoftDelete;
    //软删除位
    protected $deleteTime = 'isdel';

    public const STATUS_NORMAL = 1;
    public const STATUS_DISABLE = 2;

    public function getStatusTextAttr($value): string
    {
        $statuses = [
            self::STATUS_NORMAL => '启用',
            self::STATUS_DISABLE => '禁用'
        ];
        return $statuses[$value];
    }

    protected function setSecretIdAttr(): string
    {
        return create_guid();
    }

    /**
     * @param $post
     * @return array
     * @throws DbException
     */
    public function tableData($post): array
    {
        if (isset($post['limit'])) {
            $limit = $post['limit'];
        } else {
            $limit = config('paginate.list_rows');
        }

        $tableWhere = $this->tableWhere($post);
        $list = $this->field($tableWhere['field'])
            ->where($tableWhere['where'])
            ->order($tableWhere['order'])
            ->paginate($limit);
        $data = $this->tableFormat($list->getCollection());
        $re['code'] = 0;
        $re['msg'] = '';
        $re['count'] = $list->total();
        $re['data'] = $data;
        return $re;
    }

    /**
     * 添加新店铺
     * @param array $data
     * @return array
     * @throws PDOException
     */
    public function addShop(array $data = []): array
    {
        $result = ['status' => true, 'msg' => '保存成功', 'data' => []];

        $checkRes = $this->checkData($data, 'add');
        if (!$checkRes['status']) {
            $result['status'] = false;
            $result['msg'] = $checkRes['msg'];
            return $result;
        }

        $shop = $data['shop'];
        $manage = $data['manage'];
        $this->startTrans();

        if (!$this->allowField(['name', 'subdomain', 'status'])->save($shop)) {
            $this->rollback();
            return error_code(10004);
        } else {
            $shop_id = $this->id;
            $manageModel = new Manage();
            $manage['shop_id'] = $shop_id;
            $manage['ctime'] = time();
            $manage['password'] = $manageModel->enPassword($manage['password'], time());
            $manage['is_shop_admin'] = $manageModel::IS_SHOP_ADMIN_YES;
            if (!$manageModel->allowField(true)->save($manage)) {
                $this->rollback();
                return error_code(10004);
            }
            $result['data']['shop'] = $this;
            $result['data']['manage'] = $manageModel;
        }

        $this->commit();

        cache_shop_list(true);

        return $result;
    }

    /**
     * 在新增或编辑时验证数据有效性
     * @param array $data 要验证的数据
     * @param string $scene 验证场景，支持add和edit
     * @return array ['status' => bool, 'msg' => string, 'data' => array]
     */
    public function checkData(array $data, string $scene = 'add'): array
    {
        $result = ['status' => false, 'msg' => '验证失败', 'data' => []];
        $validate = new \app\common\validate\Shop();
        switch ($scene) {
            case 'edit':
                if (!$validate->scene('edit')->check($data)) {
                    $result['msg'] = $validate->getError();
                } else {
                    $result['status'] = true;
                    $result['msg']    = '验证成功';
                }
                break;
            case 'add':
            default:
                $scene = 'add';
                if (!$validate->scene('add_base')->check($data)) {
                    $result['msg'] = $validate->getError();
                } else {
                    if (!$validate->scene('add')->check($data['shop'])) {
                        $result['msg'] = $validate->getError();
                    } else {
                        $manageValidate = new \app\common\validate\Manage();
                        if (!$manageValidate->scene('shop_add')->check($data['manage'])) {
                            $result['msg'] = $manageValidate->getError();
                        } else {
                            $result['status'] = true;
                            $result['msg']    = '验证成功';
                        }
                    }
                }
        }
        return $result;
    }

    /**
     * 修改
     * @param array $data
     * @return array
     */
    public function editData($data = [])
    {
        $result = [
            'status' => true,
            'msg' => '保存成功',
            'data' => ''
        ];

        $where['id'] = $data['id'];
        if (!$this->allowField(['name', 'subdomain', 'status'])->save($data, $where)) {
            return error_code(10004);
        }
        return $result;
    }

    /**
     * 删除
     * @param array $data
     * @return array
     */
    public function delData($id)
    {
        if (empty($id)) {
            return error_code(10023);
        }

        $where['id'] = $id;
        $where2['store_id'] = $id;

        $this->startTrans();

        $res = $this->destroy($id);
        if (!$res) {
            $this->rollback();
            return error_code(10023);
        }

        $this->commit();
        $result['status'] = true;
        $result['msg']    = '删除成功';
        return $result;
    }

    public function getAllShops()
    {
        return $this->where('status', static::STATUS_NORMAL)->select();
    }

    /**
     * 根据查询结果，格式化数据
     * @param $list
     * @return mixed
     */
    protected function tableFormat($list)
    {
        foreach ($list as $val) {
            $val['ctime'] = getTime($val['ctime']);
            $val['utime'] = getTime($val['utime']);
        }
        return $list;
    }

    /**
     * 获取列表
     * @param int $status 状态，默认所有
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws DbException
     */
    public function storeList(int $status = 0)
    {
        in_array($status, [self::STATUS_NORMAL, self::STATUS_DISABLE]) && $this->where('status', $status);
        $data = $this->field('*')->select();

        $result = [
            'status' => true,
            'msg'   => '获取成功',
            'data'  => [
                'list' => $data,
                'count' => count($data)
            ]
        ];
        return $result;
    }
}
