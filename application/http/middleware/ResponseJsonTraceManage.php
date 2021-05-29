<?php

namespace app\http\middleware;

use think\Container;
use think\Db;
use think\Response;

/**
 * 对 Json 返回类型的 Response 进行 Trace
 * ThinkPHP 默认对 Json 返回不做 Trace
 * @package app\http\middleware
 */
class ResponseJsonTraceManage
{
    public const TRACE_KEY = 'app_trace';
    protected $config = [
        'tabs' => ['base' => 'base', 'file' => 'file', 'info' => 'info', 'notice|error' => 'error', 'sql' => 'SQL', 'debug|log' => 'debug'],
    ];

    public function handle($request, \Closure $next)
    {
        /**
         * @var Response
         */
        $response = $next($request);
        // Trace调试注入
        // 此处也可根据Header判断（strpos($response->getHeader('Content-Type'), 'application/json') >= 0）
        if ('cli' != PHP_SAPI && env('app_trace', config('app.app_trace')) && $response instanceof \think\response\Json) {
            $data = $response->getData();
            if (is_array($data) || (is_object($data) && $data instanceof \think\Paginator)) {
                // 获取基本信息
                $runtime = number_format(microtime(true) - Container::get('app')->getBeginTime(), 10, '.', '');
                $reqs    = $runtime > 0 ? number_format(1 / $runtime, 2) : '∞';
                $mem     = number_format((memory_get_usage() - Container::get('app')->getBeginMem()) / 1024, 2);

                $log = Container::get('log')->getLog();

                // 页面Trace信息
                if ($request->host()) {
                    $uri = $request->protocol() . ' ' . $request->method() . ' : ' . $request->url(true);
                } else {
                    $uri = 'cmd:' . implode(' ', $_SERVER['argv']);
                }
                $base = [
                    'request' => date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']) . ' ' . $uri,
                    'runtime' => number_format($runtime, 6) . 's [ 吞吐率：' . $reqs . 'req/s ] 内存消耗：' . $mem . 'kb 文件加载：' . count(get_included_files()),
                    'query' => Db::$queryTimes . ' queries ' . Db::$executeTimes . ' writes ',
                    'cache' => Container::get('cache')->getReadTimes() . ' reads,' . Container::get('cache')->getWriteTimes() . ' writes',
                ];

                if (session_id()) {
                    $base['session'] = 'SESSION_ID=' . session_id();
                }

                $info = Container::get('debug')->getFile(true);

                // 页面Trace信息
                $trace = [];
                foreach ($this->config['tabs'] as $name => $title) {
                    $name = strtolower($name);
                    switch ($name) {
                        case 'base': // 基本信息
                            $trace[$title] = $base;
                            break;
                        case 'file': // 文件信息
                            $trace[$title] = $info;
                            break;
                        default: // 调试信息
                            if (strpos($name, '|')) {
                                // 多组信息
                                $names  = explode('|', $name);
                                $result = [];
                                foreach ($names as $name) {
                                    $result = array_merge($result, isset($log[$name]) ? $log[$name] : []);
                                }
                                $trace[$title] = $result;
                            } else {
                                $trace[$title] = isset($log[$name]) ? $log[$name] : '';
                            }
                    }
                }

                if ($data instanceof \think\Paginator) {
                    $data = $data->toArray();
                }
                $data[self::TRACE_KEY] = $trace;
                $response->data($data);
            }
        }

        return $response;
    }
}
