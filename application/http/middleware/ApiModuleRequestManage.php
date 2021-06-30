<?php

namespace app\http\middleware;

use Closure;
use think\Exception\HttpResponseException;
use think\Request;
use think\Response\Json;

/**
 * Api模块请求管理中间件
 */
class ApiModuleRequestManage
{
    /**
     * Api模块名称
     */
    public const MODULE_API = 'api';

    public function handle(Request $request, Closure $next)
    {
        if ($request->module() == self::MODULE_API) {
            $ctl = $request->controller(true);
            $act = $request->action(true);

            // Api模块只允许common控制器和index控制器index方法访问
            if ($ctl == 'common' || ($ctl == 'index' && $act == 'index')) {
                return $next($request);
            }

            $response = new Json(['msg' => '禁止访问', 'status' => false], 403);
            throw new HttpResponseException($response);
        }

        return $next($request);
    }
}
