<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------

return [
    // 驱动方式
    'type'       => 'redis',
    'host'       => env('redis.host', '127.0.0.1'),
    'port'       => env('redis.port', 6379),
    'password'   => env('redis.password', ''),
    'select'     => env('redis.select', 0),
    'timeout'    => env('redis.timeout', 0),
    // 缓存有效期 0表示永久缓存
    'expire'     => env('redis.expire', 0),
    'persistent' => env('redis.persistent', false),
    // 缓存前缀
    'prefix'     => env('redis.prefix', 'lyz_'),
    'serialize'  => env('redis.serialize', true)
];
