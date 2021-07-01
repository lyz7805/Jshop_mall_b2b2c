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

            self::abort('禁止访问', 403);
        }

        return $next($request);
    }

    private static function abort(string $message = 'Request Error', int $code = 200)
    {
        $response = new Json(['msg' => $message, 'status' => false], $code);
        throw new HttpResponseException($response);
    }

    private static function abort_error_code(int $code = 10000)
    {
        self::abort(error_code($code, true), 200);
    }
}
