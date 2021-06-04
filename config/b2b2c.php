<?php

return [
    // 商城主域名
    'default_subdomain' => env('b2b2c.default_subdomain', 'www'),

    // 商城店铺主域名，如果设置子域名，则可通过子域名加上此域名直接访问店铺
    'mall_subdomain' => env('b2b2c.mall_subdomain', env('b2b2c.default_subdomain')),

    // 商城店铺主域名访问模式，头部标记商城店铺secret_id，如果用子域名访问可不用加此header
    'shop_secret_id_header_name' => env('b2b2c.shop_secret_id_header', 'SHOP_ID'),

    // 根据id索引缓存商铺列表
    'shop_list_with_id_cache_key' => 'shop_list_with_id',

    // 根据secret_id索引缓存商铺列表
    'shop_list_with_secret_id_cache_key' => 'shop_list_with_secret_id',

    // 根据subdomain索引缓存商铺列表
    'shop_list_with_subdomain_cache_key' => 'shop_list_with_subdomain'
];
