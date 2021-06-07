<?php

namespace app\admin\behavior;

use think\facade\Cache;
use think\facade\Request;

class FormSubmitResponseBeforeSend
{
    public function run($params)
    {
        $class     = is_object($params) ? get_class($params) : $params;
        $classname = basename(str_replace('\\', '/', $class));
        $data      = $params->getData();
        if ($classname == 'Json' && is_array($data) && !isset($data['token'])) {
            $form = input('validate_form/s', ''); //有提交验证表单时，再刷新token
            if ($form) {
                $new_token = Request::token('__Jshop_Token__', 'sha1');
                Cache::set($form . '_token', $new_token, 86400);   //1天过期。刷新token
                $data['token'] = $new_token;
                $params->data($data);
            }
        }
    }
}
