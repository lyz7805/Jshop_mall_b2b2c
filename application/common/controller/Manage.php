<?php

/**
 * 总后台的控制器基类，用于权限判断和一些统一的后台操作
 *
 * @author sin
 *
 */

namespace app\common\controller;

use app\common\model\ManageRoleOperationRel;
use think\Container;
use app\common\model\Operation;
use think\facade\Cache;
use think\facade\Request;


class Manage extends Base
{
    /**
     * 商家店铺ID
     * @var string
     */
    public static $shop_id;

    protected function initialize()
    {
        cache_shop_list();

        parent::initialize();
        //没有登录，请先登录
        if (!session('?manage')) {
            cookie('redirect_url', Container::get('request')->url(), 3600);
            $this->redirect('manage/common/login');
        }

        $this->initConstants();

        $cont_name = request()->controller();
        $act_name  = request()->action();

        $operationModel = new Operation();

        //判断当前是否有权限操作
        $mrorModel = new ManageRoleOperationRel();
        $permRe    = $mrorModel->checkPerm(session('manage.id'), $operationModel::MENU_MANAGE, $cont_name, $act_name);
        if (!$permRe['status']) {
            if (Request::isAjax()) {
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

        static::$shop_id = get_shop_id();

        $jshopHost = Container::get('request')->domain();
        $this->assign('jshopHost', $jshopHost);

        $shopList = Cache::get(SHOP_LIST_WITH_ID_CACHE_KEY);
        $shop = $shopList[static::$shop_id];
        $this->assign('shop', $shop);
        $this->assign('shop_domain', url('/', '', false, $shop['subdomain'] . '.' . config('b2b2c.mall_subdomain') . '.' . request()->rootDomain()));

        //店铺名称
//        $shop_name = getSetting('shop_name');
        $this->assign('shop_name', $shop['name']);
        $this->view->engine->layout('layout');

    }

    /**
     * 初始化常量
     */
    final private function initConstants()
    {
        $manageInfo = session('manage');
        defined('MANAGE_ID') or define('MANAGE_ID', $manageInfo['id']);
        defined('IS_SHOP_ADMIN') or define('IS_SHOP_ADMIN', $manageInfo['is_shop_admin']);

        defined('SHOP_ID') or define('SHOP_ID', get_shop_id());
    }
}
