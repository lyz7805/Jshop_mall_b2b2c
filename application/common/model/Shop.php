<?php

namespace app\common\model;

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

    public function getStatusTextAttr($value)
    {
        $statuss = [
            self::STATUS_NORMAL => '启用',
            self::STATUS_DISABLE => '禁用'
        ];
        return $statuss[$value];
    }

    protected function setSecretIdAttr()
    {
        return create_guid();
    }

    /**
     * @param $post
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function tableData($post)
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
     * 添加
     * @param array $data
     * @return array
     */
    public function addData($data = [])
    {
        $result = ['status' => true, 'msg' => '保存成功', 'data' => ''];

        if (!$this->allowField(true)->save($data)) {
            return error_code(10004);
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
     * @throws \think\exception\DbException
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
