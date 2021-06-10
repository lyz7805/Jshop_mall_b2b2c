<?php

namespace app\common\validate;

use think\Validate;

class Manage extends Validate
{
    protected $rule = [
        'username|用户名' => 'require|alphaNum|unique:manage',
        'password|密码' => 'require|alphaNum|length:6,18',
        'repassword|确认密码' => 'require|confirm:password',
    ];

    protected $message = [
        'username.require' => '请输入管理员用户名',
        'username.alphaNum' => '用户名只能输入字母或数字',
        'password.require' => '请输入管理员密码',
        'repassword.require' => '请输入确认密码',
        'repassword.confirm' => '确认密码与密码不一致'
    ];

    protected $scene = [
        'shop_add' => ['username', 'password', 'repassword'],
        'add' => [],
        'edit' => []
    ];
}