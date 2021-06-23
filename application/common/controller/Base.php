<?php

namespace app\common\controller;

use think\Controller;

/**
 * 控制器基类
 * @author sin
 */
class Base extends Controller
{
    protected function initialize()
    {
        parent::initialize();
        error_reporting(E_ALL ^ E_NOTICE);              //错误等级

        $this->initRequestInfo();

        //初始化配置参数，用于在模板中使用
        $this->assign('params', config('params.'));
    }

    /**
     * 初始化请求信息，添加部分常量，方便控制器使用
     */
    final private function initRequestInfo()
    {
        defined('IS_GET')   or define('IS_GET',     $this->request->isGet());
        defined('IS_POST')  or define('IS_POST',    $this->request->isPost());
        defined('IS_AJAX')  or define('IS_AJAX',    $this->request->isAjax());
    }
}
