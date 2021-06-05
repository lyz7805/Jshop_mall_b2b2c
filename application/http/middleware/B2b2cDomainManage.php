<?php

namespace app\http\middleware;

use think\Request;
use think\facade\Cache;

/**
 * B2b2c域名访问控制中间件
 */
class B2b2cDomainManage
{
    public function handle(Request $request, \Closure $next)
    {
        // 缓存商铺列表
        cache_shop_list();

        if ('cli' != PHP_SAPI) { // 非Console模式
            $default_subdomain = config('b2b2c.default_subdomain');
            $mall_subdomain = config('b2b2c.mall_subdomain');

            $sub_domain = $request->subDomain();
            if ($sub_domain) {
                $domain = explode('.', $sub_domain);
                $domain2 = array_pop($domain);

                // 二级域名是默认域名
                if ($domain2 == $default_subdomain) {
                    if (count($domain)) { // 存在更多级子域名则跳回默认域名
                        $to_url = url($request->url(), [], false, $default_subdomain);
                        return redirect($to_url);
                    } else {
                        return $next($request);
                    }
                }

                // 二级域名是商铺域名
                if ($domain2 == $mall_subdomain) {
                    if (count($domain) == 0) { // 不存在三级子域名，根据参数解析
                        $shop_secret_id = $request->header(config('b2b2c.shop_secret_id_header_name'), null);
                        if ($shop_secret_id) {
                            $shop_list = Cache::get(SHOP_LIST_WITH_SECRET_ID_CACHE_KEY);
                            !in_array($shop_secret_id, array_keys($shop_list)) && abort(404, '请求页面不存在');

                            session('shop', $shop_list[$shop_secret_id]);
                            session('shop_id', $shop_list[$shop_secret_id]['id']);

                            return $next($request);
                        }

                        // TODO 其他访问模式，通过链接中标记商铺信息，比如京东链接https://mall.jd.com/index-1000004123.html

                        abort(404, '请求页面不存在');
                    } elseif (count($domain) == 1) { // 存在三级子域名，判断是否在配置的子域名中
                        !Cache::has(SHOP_LIST_WITH_SUBDOMAIN_CACHE_KEY) && abort(404, '请求页面不存在');

                        $domain3 = array_pop($domain);
                        $shop_list = Cache::get(SHOP_LIST_WITH_SUBDOMAIN_CACHE_KEY);

                        !in_array($domain3, array_keys($shop_list)) && abort(404, '请求页面不存在');

                        session('shop', $shop_list[$domain3]);
                        session('shop_id', $shop_list[$domain3]['id']);

                        return $next($request);
                    } else { // 存在更多级子域名跳转404
                        abort(404, '请求页面不存在');
                    }
                }
            }
        } else {
            return $next($request);
        }
    }
}
