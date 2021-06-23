<?php
// +----------------------------------------------------------------------
// | JSHOP [ 小程序 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017~2018 http://jihainet.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: mark <jima@jihainet.com>
// +----------------------------------------------------------------------
namespace app\common\behavior;

use app\common\model\Addons;
use app\common\model\Hooks;
use think\facade\Cache;
use think\facade\Hook;

/**
 * 钩子初始化
 * User: mark
 * Date: 2018/9/6
 * Time: 下午12:06
 */
class InitHooks
{
    /**
     * 初始化钩子
     * @param $params
     */
    public function run($params)
    {
        //if(isset($_GET['m']) && $_GET['m'] === 'Install') return; //屏蔽安装程序
        $data = Cache::get('hooks');
        $hooksModel = new Hooks();
        if (!$data) {
            $hooks = $hooksModel->where([['addons', 'neq', ''], ['addons', 'not null']])
                ->column('addons', 'name');
            if ($hooks) {
                $addonsModel = new Addons();
                foreach ($hooks as $name => $value) {
                    $where = [];
                    //取出可用插件，然后把可用插件加入钩子
                    $where[] = ['status', 'eq', $addonsModel::STATUS_ENABLE];
                    $names = explode(',', $value);
                    $where[] = ['name', 'in', $names];
                    $data = $addonsModel->where($where)->column('name');
                    if ($data) {
                        $addons = array_intersect($names, $data);
                        $addons_list = array_filter(array_map('get_addon_class', $addons));
                        Hook::add($name, $addons_list);
                    }
                }
                Cache::set('hooks', Hook::get());
            }
        } else {
            Hook::import($data, false);
        }
    }
}
