<?php

namespace app\http\middleware;

use think\Request;

/**
 * B2b2c中间件
 */
class B2b2cManage
{
    protected $expect = [
        'common' => ['login', 'logout'],
        'shop' => '*',
    ];

    public function handle(Request $request, \Closure $next)
    {
        $mdl = $request->module();
        if ($mdl != 'manage') {
            return $next($request);
        }

        $ctl = $request->controller(true);
        $act = $request->action(true);

        // 在排除名单中直接返回
        if (in_array($ctl, array_keys($this->expect)) && ($this->expect[$ctl] === '*' || in_array($act, $this->expect[$ctl]))) {
            return $next($request);
        }

        if (session('?manage')) {
            // if (session('manage.username') == 'admin') {
            //     return $next($request);
            // }

            $shop_id = get_shop_id();

            // 未选择店铺
            if (empty($shop_id)) {
                return redirect(redirect_url('Shop/select'));
            }

            $request->shop_id = $shop_id;
            return $next($request);
        } else {
            // 清除session
            session(null);
            return redirect(redirect_url('common/login'));
        }
    }
}
