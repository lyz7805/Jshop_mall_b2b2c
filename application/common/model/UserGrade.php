<?php

namespace app\common\model;

use think\facade\Cache;

/**
 * 用户等级
 * Class UserGrade
 * @package app\common\model
 */
class UserGrade extends Common
{
    /**
     * 是否默认-是
     */
    const IS_DEF_YES = 1;
    /**
     * 是否默认-否
     */
    const IS_DEF_NO = 2;

    /**
     * 所有用户等级缓存键
     */
    const USER_GRADE_ALL_CACHE_KEY = 'user_grade_all';

    public static function init()
    {
        self::cacheAll();
        $closure = function () {
            self::cacheAll(true);
        };
        self::event('after_insert', $closure);
        self::event('after_update', $closure);
        self::event('after_write', $closure);
        self::event('after_delete', $closure);
    }

    /**
     * 缓存所有列表
     * @param bool $refresh
     * @return void
     */
    public static function cacheAll(bool $refresh = false)
    {
        $refresh && Cache::rm(self::USER_GRADE_ALL_CACHE_KEY);

        if (!Cache::has(self::USER_GRADE_ALL_CACHE_KEY)) {
            $list = self::order('id asc')->all();
            if (!$list->isEmpty()) {
                $result = $list->toArray();
                Cache::set(self::USER_GRADE_ALL_CACHE_KEY, $result);
            } else {
                Cache::set(self::USER_GRADE_ALL_CACHE_KEY, []);
            }
        }
    }

    /**
     * 新增或者修改用户等级信息
     * @param $id
     * @param string $name
     * @param int $is_def
     * @return array
     */
    public function toEdit($id, string $name, int $is_def): array
    {
        $result = [
            'status' => true,
            'data' => '',
            'msg' => ''
        ];

        if ($is_def != self::IS_DEF_NO && $is_def != self::IS_DEF_YES) {
            $is_def = self::IS_DEF_NO;
        }

        $where[] = ['id', 'eq', $id];
        $info = $this->where($where)->find();
        if ($info) { //编辑
            $data['name'] = $name;
            $data['is_def'] = $is_def;

            $this->save($data, $where);
        } else { //新增
            $data['id'] = $id;
            $data['name'] = $name;
            $data['is_def'] = $is_def;
            $this->save($data);
        }
        // TODO 这里应该有个bug，如果本来是默认的现在设置非默认，那就没有默认等级了
        if ($is_def == self::IS_DEF_YES) {
            $data1['is_def'] = self::IS_DEF_NO;
            $where1[] = ['id', 'neq', $id];
            $where1[] = ['is_def', 'eq', self::IS_DEF_YES];
            $s = new UserGrade();
            $s->save($data1, $where1);
        }

        return $result;
    }

    /***
     * 获取全部会员等级，加入缓存支持
     * @return array
     */
    public function getAll(): array
    {
        return Cache::get(self::USER_GRADE_ALL_CACHE_KEY);
    }

    /**
     * 根据输入的查询条件，返回所需要的where
     * @author sin
     * @param $post
     * @return array
     */
    protected function tableWhere($post): array
    {
        $result['where'] = [];
        $result['field'] = "*";
        $result['order'] = "id asc";
        return $result;
    }

    /**
     * 根据查询结果，格式化数据
     * @author sin
     * @param $list
     * @return mixed
     */
    protected function tableFormat($list)
    {
        foreach ($list as $k => $v) {
            if ($v['is_def'] == self::IS_DEF_YES) {
                $list[$k]['is_def'] = "默认";
            } else {
                $list[$k]['is_def'] = "";
            }
        }
        return $list;
    }

}