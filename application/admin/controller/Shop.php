<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\BillAftersales;
use app\common\model\Notice;
use app\common\model\Operation;
use app\common\model\Order;
use app\common\model\PintuanGoods;
use app\common\model\Promotion;
use app\common\model\Shop as ShopModel;
use app\common\model\User;
use app\common\model\UserGrade;
use think\Console;
use think\facade\Cache;
use app\common\model\WeixinAuthor;
use app\common\model\Goods;
use app\common\model\Brand;
use app\common\model\Products;
use think\facade\Request;

class Shop extends Admin
{
    public function initialize()
    {
        parent::initialize();

        $this->view->engine->layout('layout/shop');
    }

    public function index()
    {
        if (Request::isAjax()) {
            $shopModel = new ShopModel();
            return $shopModel->tableData(input('param.'));
        }
        return $this->fetch();
    }

    public function select(ShopModel $shop)
    {
        session('shop_id', null);
        if (input('?param.to')) {
            $shop_info = ShopModel::getBySecretId(input('param.to'));
            if ($shop_info) {
                session('shop_id', $shop_info->id);

                // TODO 跳转时候还需要设置session
                $this->redirect(redirect_url('manage/index/index'));
            }
        }

        $this->assign('shop_list', $shop->all());
        $this->assign('is_super_admin', is_super_admin());
        return $this->fetch();
    }

    /**
     * 新增
     * @return array|mixed
     */
    public function add(ShopModel $shop)
    {
        if (Request::isAjax()) {
            return $shop->addShop(input('param.'));
        }

        return $this->fetch();
    }

    /**
     * 编辑
     * @return array|mixed
     */
    public function edit(ShopModel $shop)
    {
        if (Request::isAjax()) {
            return $shop->editData(input('param.'));
        }

        $info = $shop->where(['id' => input('param.id/d')])->find();
        if (!$info) {
            return error_code(10000);
        }
        $this->assign('info', $info);
        return $this->fetch();
    }

    /**
     * 删除
     * @return array|mixed
     */
    public function del(ShopModel $shop)
    {
        if (!input('?param.id')) {
            return error_code(10000);
        }
        return $shop->delData(input('param.id'));
    }
}
