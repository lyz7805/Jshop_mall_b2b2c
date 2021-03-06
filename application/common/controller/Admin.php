<?php

namespace app\common\controller;

use app\common\model\AdminRoleOperationRel;
use think\Container;
use app\common\model\AdminOperation;

/**
 * B2B2C平台管理后台控制器基类
 */
class Admin extends Base
{
    protected function initialize()
    {
        parent::initialize();

        // 没有登录，请先登录
        if (!session('?admin')) {
            cookie('redirect_url', Container::get('request')->url(), 3600);
            $this->redirect('admin/common/login');
        }

        $cont_name = request()->controller();
        $act_name  = request()->action();

        $operationModel = new AdminOperation();

        // 判断是否有权限操作
        $arorModel = new AdminRoleOperationRel();
        $permRe    = $arorModel->checkPerm(session('admin.id'), $operationModel::MENU_ADMIN, $cont_name, $act_name);
        if (!$permRe['status']) {
            if (IS_AJAX) {
                $err = [
                    'status' => false,
                    'data'   => '',
                    'msg'    => $permRe['msg']
                ];
                echo json_encode($err);
                die();
                //return $permRe;
            } else {
                $this->error($permRe['msg']);
            }
        }

        $jshopHost = Container::get('request')->domain();
        $this->assign('jshopHost', $jshopHost);
        // 店铺名称
        $mall_name = getSetting('mall_name');
        $this->assign('mall_name', $mall_name);
        if ($name = getSetting('shop_name')) {
            $shop_name = $name;
        } else {
            $shop_name = $mall_name;
        }
        $this->assign('shop_name', $shop_name);
        $this->view->engine->layout('layout');
    }
}
