<?php

namespace app\job;

use think\facade\Config;
use think\queue\Job;

/**
 * B2b2c模式队列任务，此模式尽量继承此类，在任务执行方法内先调用 parent::exec() 方法用于限制模型查询过滤
 */
abstract class B2b2c
{
    public function exec(Job $job, $params)
    {
        $options = Config::pull('queue');
        $type    = !empty($options['connector']) ? strtolower($options['connector']) : 'sync';
        // Sync类型的任务直接就运行了
        if ($type != 'sync' && is_array($params) && $params['shop_id']) {
            // 配合B2b2c模式设定的模型查询范围和模型事件
            session('shop_id', $params['shop_id']);
        }
    }
}
