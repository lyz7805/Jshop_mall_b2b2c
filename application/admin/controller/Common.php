<?php

namespace app\admin\controller;

use app\common\model\Brand;
use app\common\model\Goods;
use Request;
use think\Container;
use app\common\controller\Base;
use app\common\model\Admin as AdminModel;
use app\common\model\AdminUserLog;

class Common extends Base
{
    protected function initialize()
    {
        parent::initialize();

        // 此控制器不需要模板布局
        $this->view->engine->layout(false);
    }

    /**
     * 用户登录
     */
    public function login()
    {
        $shop_name = getSetting('shop_name');
        $this->assign('shop_name', $shop_name);
        if (session('?admin')) {
            $this->success('登录成功，跳转中...', redirect_url(url('index/index')));
        }

        if (Request::isPost()) {
            $adminModel = new AdminModel();
            $result = $adminModel->toLogin(input('param.'));
            if ($result['status']) {
                if (Request::isAjax()) {
                    $result['data'] = redirect_url(url('index/index'));
                    return $result;
                } else {
                    $this->redirect(redirect_url(url('index/index')));
                }
            } else {
                return $result;
            }
        } else {
            return $this->fetch('login');
        }
    }

    /**
     * 用户退出
     */
    public function logout()
    {
        // 增加退出日志
        if (session('admin.id')) {
            $userLogModel = new AdminUserLog();
            $userLogModel->setLog(session('admin.id'), $userLogModel::USER_LOGOUT, [], $userLogModel::MANAGE_TYPE);
        }
        session(null);
        $this->success('退出成功', url('admin/common/login'));
    }
}
