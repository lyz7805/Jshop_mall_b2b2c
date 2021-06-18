<?php

namespace app\manage\controller;

use think\facade\Request;
use app\common\controller\Base;
use app\common\model\Manage;
use app\common\model\ManageLog;

class Common extends Base
{
    protected function initialize()
    {
        parent::initialize();

        cache_shop_list();

        //此控制器不需要模板布局，所以屏蔽掉
        $this->view->engine->layout(false);
    }

    /**
     * 用户登陆页面
     * @author sin
     */
    public function login()
    {
        if (get_shop_id()) {
            $shopList = cache(SHOP_LIST_WITH_ID_CACHE_KEY);
            $shop = $shopList[get_shop_id()];
            $shop_name = $shop['name'];
        } else {
            $shop_name = getSetting('shop_name');
        }
        $this->assign('shop_name', $shop_name);
        if (session('?manage')) {
            $this->success('已经登录成功，跳转中...', redirect_url(url('index/index')));
        }
        if (Request::isPost()) {
            $manageModel = new Manage();
            $result = $manageModel->toLogin(input('param.'));
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
     * @author sin
     */
    public function logout()
    {
        //增加退出日志
        if (session('manage.id')) {
            $logModel = new ManageLog();
            $logModel->setLog(session('manage.id'), $logModel::USER_LOGOUT, []);
        }

        // session('manage', null);
        session(null);
        $this->success('退出成功', url('index/index'));
    }
}
