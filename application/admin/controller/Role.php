<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\AdminRole;
use app\common\model\AdminRoleOperationRel;
use think\Config;

/**
 * 角色管理
 * Class Role
 * @package app\admin\controller
 */
class Role extends Admin
{
    /**
     * @return mixed
     */
    public function index()
    {
        if (IS_AJAX) {
            $adminRoleModel = new AdminRole();
            $data = input('param.');
            return $adminRoleModel->tableData($data);
        }
        return $this->fetch('index');
    }

    /**
     * 添加
     * @return array|mixed
     */
    public function add()
    {
        $this->view->engine->layout(false);
        $adminRoleModel = new AdminRole();
        if (IS_POST) {
            if (!input('?param.name')) {
                return error_code(11070);
            }

            $data['name'] = input('param.name');
            $adminRoleModel->save($data);
            $result['status'] = true;
            $result['msg'] = '添加成功';
            return $result;
        }
        $result['status'] = true;
        $result['msg'] = '成功';
        $result['data'] = $this->fetch('edit')->getContent();
        return $result;
    }

    /**
     * 删除
     * @return array|mixed
     */
    public function del()
    {
        if (!input('?param.id')) {
            return error_code(10000);
        }
        $AdminRoleModel = new AdminRole();
        return $AdminRoleModel->toDel(input('param.id'));
    }

    /**
     * @return array|mixed|Config
     */
    public function getOperation()
    {
        $return_data = [
            'code' => 0,
            'msg' => '获取成功',
            'data' => [],
        ];

        if (!input('?param.id')) {
            return error_code(10000);
        }
        $adminRoleModel = new AdminRole();
        $re = $adminRoleModel->getRoleOperation(input('param.id/d'), session('admin')['id']);
        if (!$re['status']) {
            return $re;
        }
        $return_data['data'] = $re['data'];
        return $return_data;
    }

    /**
     * 配置权限
     * @return array|mixed
     */
    public function savePerm()
    {
        $post = input('param.');
        if (!isset($post['id'])) {
            return error_code(10000);
        }
        if (!isset($post['data'])) {
            return error_code(11072);
        }
        //保存角色信息
        $adminRoleModel = new AdminRole();
        $adminRoleInfo = $adminRoleModel->where(['id' => $post['id']])->find();
        if (!$adminRoleInfo) {
            return error_code(11071);
        }
        $arorModel = new AdminRoleOperationRel();
        $arorModel->savePerm($post['id'], $post['data']);
        return [
            'status' => true,
            'data' => '',
            'msg' => '设置成功'
        ];
    }
}
