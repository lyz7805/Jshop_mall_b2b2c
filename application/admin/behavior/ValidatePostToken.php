<?php

namespace app\admin\behavior;

use think\facade\Request;

/**
 * 校检POST请求token
 */
class ValidatePostToken
{
    // 需要校检的控制器和方法，全部小写
    protected $include = [
        'administrator' => ['add', 'edit'],
        'area' => ['add'],
        'article' => ['add', 'edit'],
        'articletype' => ['add', 'edit'],
        'balance' => ['tocashexamine'],
        'billaftersales' => ['audit'],
        'billpayments' => ['topay'],
        'billrefund' => ['refund'],
        'brand' => ['add', 'edit'],
        'carousel' => ['add', 'edit'],
        'categories' => ['add', 'edit'],
        'common' => ['login'],
        'form' => ['add', 'edit'],
        'goods' => ['doadd', 'doedit'],
        'goodsparams' => ['add', 'edit'],
        'goodstype' => ['add', 'edit'],
        'goodstypespec' => ['add', 'edit'],
        'hooks' => ['add', 'edit'],
        'logistics' => ['add', 'edit'],
        'notice' => ['add', 'edit'],
        'operation' => ['add'],
        'order' => ['edit'],
        'payments' => ['edit'],
        'promotion' => ['add', 'edit', 'groupadd', 'groupedit'],
        'role' => ['add'],
        'setting' => ['index'],
        'ship' => ['add', 'edit'],
        'store' => ['add', 'edit'],
        'user' => ['adduser', 'editmoney', 'editpoint', 'edituser', 'gradeadd'],
        'wechat' => ['addmessage', 'doedit', 'doeditmediamessage', 'doeditmenu'],
    ];

    public function run($params)
    {
        $validateToken = config('app.validate_token');
        if (Request::isPost() && $validateToken) {
            $ctl = Request::controller(true);
            $act = Request::action(true);
            if (in_array($ctl, array_keys($this->include)) && ($this->include[$ctl] == '*' || in_array($act, $this->include[$ctl]))) {
                validateJshopToken();
            }
        }
    }
}
