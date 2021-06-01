<?php

namespace app\common\event;

use think\Model;

/**
 * B2b2c模型观察者
 */
class B2b2cModelObserver
{
    /**
     * 商家店铺ID
     * @var string
     */
    protected static $shop_id;

    public function __construct() {
        self::$shop_id = get_shop_id();
    }

    /**
     * 注册模型before_insert事件
     *
     * @param Model $model 模型实例
     * @return void
     */
    public function beforeInsert(Model $model)
    {
        // dump(class_basename($model));
        if (empty($model->shop_id)) {
            $model->shop_id = static::$shop_id;
            return;
        }
    }

    public function beforeDelete(Model $model)
    {
        if ($model->shop_id !== static::$shop_id) {
            return false;
        }
    }
}