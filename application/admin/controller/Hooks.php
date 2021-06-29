<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\Hooks as hooksModel;

/**
 * 钩子列表
 * Class Addons
 * @package app\admin\controller
 */
class Hooks extends Admin
{
    /**
     * 插件列表
     * @return mixed
     */
    public function index()
    {
        if (IS_AJAX) {
            $hooksModel = new hooksModel();
            return $hooksModel->tableData(input('param.'));
        }
        return $this->fetch('index');
    }

    /**
     * 钩子添加
     * @return array
     */
    public function add(): array
    {
        $this->view->engine->layout(false);
        if (IS_POST) {
            $hooksModel = new hooksModel();
            return $hooksModel->addData(input('param.'));
        }
        return [
            'status' => true,
            'msg' => '获取成功',
            'data' => $this->fetch()->getContent()
        ];
    }

    /**
     * 钩子修改
     * @return array|mixed
     */
    public function edit()
    {
        $this->view->engine->layout(false);
        $hooksModel = new hooksModel();
        if (IS_POST) {
            return $hooksModel->saveData(input('param.'));
        }
        $data = $hooksModel->where('id', input('param.id/d'))->find();
        if (!$data) {
            return error_code(10002);
        }
        return [
            'status' => true,
            'msg' => '获取成功',
            'data' => $this->fetch('edit', ['data' => $data])->getContent()
        ];
    }

    /**
     * 钩子软删除
     * @return array
     */
    public function del(): array
    {
        $result = error_code(10023);
        $hooksModel = new hooksModel();
        if ($hooksModel::destroy(input('param.id/d'))) {
            $result['status'] = true;
            $result['msg'] = '删除成功';
        }
        return $result;
    }
}
