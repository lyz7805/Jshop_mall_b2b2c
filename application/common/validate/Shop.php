<?php

namespace app\common\validate;

use think\Validate;

class Shop extends Validate
{
    protected $rule = [
        'shop|店铺信息' => 'require|array|min:2',
        'name|店铺名称' => 'require|chsDash|unique:shop',
        'subdomain|子域名' => 'require|alphaDash|length:2,15|unique:shop',

        'manage|管理员信息' => 'require|array|min:3',
    ];

    protected $message = [
        'shop.require' => '请输入店铺信息',
        'name.require' => '请输入店铺名称',
        'subdomain.require' => '请输入店铺子域名',
        'manage.require' => '请输入管理员信息',
    ];

    protected $scene = [
        'add_base' => ['shop', 'manage'],
        'add' => ['name', 'subdomain'],
        'edit' => []
    ];
}