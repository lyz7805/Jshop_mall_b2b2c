<?php

namespace app\common\model;

use Exception;
use think\Db;

class AdminRole extends BaseAdmin
{

    protected $autoWriteTimestamp = true;
    protected $updateTime = 'utime';


    protected function tableWhere($post)
    {
        $where = [];

        if (isset($post['name']) && $post['name'] != "") {
            $where[] = ['name', 'like', '%' . $post['name'] . '%'];
        }
        $result['where'] = $where;
        $result['field'] = "*";
        $result['order'] = 'utime desc';
        return $result;
    }

    /**
     * 根据查询结果，格式化数据
     * @author sin
     * @param $list  array格式的collection
     * @return mixed
     */
    protected function tableFormat($list)
    {
        foreach ($list as $k => $v) {
            if ($v['utime']) {
                $list[$k]['utime'] = getTime($v['utime']);
            }
        }
        return $list;
    }

    public function toDel($id)
    {
        $result = [
            'status' => false,
            'data' => [],
            'msg' => ''
        ];

        $where['id'] = $id;

        $mrorModel = new AdminRoleOperationRel();

        Db::startTrans();
        try {
            $this->where($where)->delete();
            $mrorModel->where(['admin_role_id' => $id])->delete();
            Db::commit();
            $result['status'] = true;
            $result['msg'] = '删除成功';
        } catch (Exception $e) {
            Db::rollback();
            $result['msg'] = $e->getMessage();
        }
        return $result;
    }

    /**
     * 取角色的操作权限数组
     * @param $id
     * @return array|\think\Config
     */
    public function getRoleOperation($role_id, $admin_id)
    {
        $result = [
            'status' => true,
            'data'   => [],
            'msg'    => ''
        ];

        $where['id']    = $role_id;
        $info = $this->where($where)->find();
        if (!$info) {
            return error_code(11071);
        }
        $mrorModel = new AdminRoleOperationRel();
        $permList  = $mrorModel->where(['admin_role_id' => $role_id])->select();
        if (!$permList->isEmpty()) {
            $nodeList = array_column($permList->toArray(), 'operation_id');
        } else {
            $nodeList = [];
        }
        //把插件权限也合进来
        $mrarModel = new AdminRoleAddonsRel();
        $list = $mrarModel->where(['admin_role_id' => $role_id])->select();
        if (!$list->isEmpty()) {
            $list = array_column($list->toArray(), 'menu_id');
            $nodeList = array_merge($nodeList, $list);
        }

        $operationModel = new AdminOperation();
        $adminMenu = $operationModel->adminMenu($admin_id, $operationModel::PERM_TYPE_HALFSUB);           //当前登陆者的后台菜单树
        $result['data'] = $operationModel->setRoleAdminMenu($adminMenu, $nodeList);

        return $result;
    }
}
