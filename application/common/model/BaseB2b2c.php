<?php

namespace app\common\model;

use app\common\event\B2b2cModelObserver;
use think\Db\Query;
use think\Model;

/**
 * B2b2c基础模型类
 * 需要根据商家店铺区分数据的都要继承此类
 */
class BaseB2b2c extends Common
{
    /**
     * 绑定模型事件观察者类
     * @var array
     */
    protected $observerClass = B2b2cModelObserver::class;

    /**
     * 商家店铺ID
     * @var string
     */
    public static $shop_id;

    /**
     * 模型初始化
     *
     * @return void
     */
    protected static function init()
    {
        parent::init();

        static::$shop_id = get_shop_id();
    }

    /**
     * 定义全局查询范围
     * @see https://www.kancloud.cn/manual/thinkphp5_1/354053
     *
     * @param Query $query
     * @return void
     */
    protected function base($query)
    {
        static::$shop_id && $query->where($query->getTable() . '.shop_id', static::$shop_id);
    }
}
