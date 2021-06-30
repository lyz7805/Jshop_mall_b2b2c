<?php

/**
 * 接口控制器基类
 *
 * @author sin
 *
 */

namespace app\common\controller;

class Api extends Base
{
    protected $userId = 0;                        //用户id

    protected function initialize()
    {
        error_reporting(E_ERROR | E_WARNING | E_PARSE);
        parent::initialize();
    }

    //此方法用于设置参数
    public function setInit($user_id)
    {
        $this->userId = $user_id;
        return true;
    }
}
