<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\Operation as OperationModel;

/**
 * 商户菜单管理
 * Class Operation
 * @package app\admin\controller
 */
class Operation extends Admin
{
    /**
     * 列表
     * @return mixed
     */
    public function index()
    {
        if (IS_AJAX) {
            $operationModel = new OperationModel();
            $data = input('param.');
            if (!(isset($data['parent_id']) && $data['parent_id'] != "")) {
                $data['parent_id'] = OperationModel::MENU_MANAGE;
            }
            return $operationModel->tableData($data);
        }
        return $this->fetch('index');
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
        $operationModel = new OperationModel();
        return $operationModel->toDel(input('param.id'));
    }

    /**
     * 新增和编辑
     * @return array|mixed
     */
    public function add()
    {
        $return = error_code(10037);
        $this->view->engine->layout(false);
        $operationModel = new OperationModel();
        if (IS_POST) {
            return $operationModel->toAdd(input('param.'));
        } else {
            //如果是编辑，取数据
            if (input("?param.id")) {
                $info = $operationModel->where(['id' => input('param.id')])->find();
                if (!$info) {
                    return error_code(10000);
                }
                $this->assign('info', $info);
            }

            //取全树
            $list = $operationModel->where('type', 'neq', 'a')->order('sort asc')->select()->toArray();
            $tree = $operationModel->createTree($list, $operationModel::MENU_START, 'parent_id');
            $this->assign('tree', $tree);

            //取菜单树
            $menuList = $operationModel->where('perm_type', 'lt', 3)->order('sort asc')->select()->toArray();
            $menuTree = $operationModel->createTree($menuList, $operationModel::MENU_START, 'parent_menu_id');
            $this->assign('menuTree', $menuTree);

            $return['status'] = true;
            $return['msg'] = '成功';
            $return['data'] = $this->fetch('add')->getContent();
            return $return;
        }
    }
}
