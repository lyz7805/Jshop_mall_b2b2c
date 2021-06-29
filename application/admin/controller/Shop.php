<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\Shop as ShopModel;

/**
 * 店铺管理
 * Class Shop
 * @package app\admin\controller
 */
class Shop extends Admin
{
    public function index()
    {
        if (IS_AJAX) {
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
     * @param ShopModel $shop
     * @return array|mixed
     */
    public function add(ShopModel $shop)
    {
        if (IS_AJAX) {
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
        if (IS_AJAX) {
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
