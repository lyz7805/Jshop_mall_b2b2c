<?php
// +----------------------------------------------------------------------
// | JSHOP [ 小程序商城 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://jihainet.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: mark <jima@jihainet.com>
// +----------------------------------------------------------------------

namespace app\Manage\controller;

use app\common\controller\Manage;
use app\common\model\Logistics as LogisticsModel;
use Request;

class Logistics extends Manage
{
    /**
     * 列表
     * @return mixed
     */
    public function index()
    {
        if(Request::isAjax()) {
            $logModel = new LogisticsModel();
            return $logModel->tableData(input('request.'));
        }
        return $this->fetch();

    }
}