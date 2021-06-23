<?php

namespace app\common\model;

use app\common\model\AdminSetting as AdminSettingModel;
use think\facade\Cache;

/**
 * 店铺设置
 * Class Setting
 * @package app\common\model
 */
class Setting extends BaseB2b2c
{
    public $skeys = [
        'shop_name' => [
            'name' => '店铺名称',
            'value' => 'jshop商城系统'
        ],
        'shop_desc' => [
            'name' => '店铺描述',
            'value' => '店铺描述会展示在前台及微信分享店铺描述'
        ],
        'shop_address' => [
            'name' => '店铺地址',
            'value' => '我的店铺地址'
        ],
        'shop_beian' => [
            'name' => '备案信息',
            'value' => '网站备案信息'
        ],
        'shop_logo' => [
            'name' => '店铺logo',
            'value' => '',
        ],
        'shop_favicon' => [
            'name' => 'Favicon图标',
            'value' => '',
        ],
        'shop_default_image' => [
            'name' => '默认图',
            'value' => '',
        ],
        'shop_mobile' => [
            'name' => '商家手机号',
            'value' => ''
        ],
        'store_switch' => [
            'name' => '开启门店自提',
            'value' => '2'
        ],
        'cate_style' => [
            'name' => '分类样式',
            'value' => 3
        ],
        'cate_type' => [        //此配置已废弃
            'name' => 'H5分类样式',
            'value' => 1
        ],
        'order_cancel_time' => [
            'name' => '订单取消时间',
            'value' => '1'
        ],
        'order_complete_time' => [
            'name' => '订单完成时间',
            'value' => '30'
        ],
        'order_autoSign_time' => [
            'name' => '订单确认收货时间',
            'value' => '20'
        ],
        'order_autoEval_time' => [
            'name' => '订单自动评价时间',
            'value' => '30'
        ],
        'remind_order_time' => [
            'name' => '订单提醒付款时间',
            'value' => '1'
        ],
        'goods_stocks_warn' =>  [
            'name' => '库存警报数量',
            'value' => '10'
        ],
        'reship_name' => [
            'name' => '退货联系人',
            'value' => ''
        ],
        'reship_mobile' => [
            'name' => '退货联系方式',
            'value' => ''
        ],
        'reship_area_id' => [
            'name' => '退货区域',
            'value' => ''
        ],
        'reship_address' => [
            'name' => '退货详细地址',
            'value' => ''
        ],
        'sign_point_type' => [
            'name' => '签到奖励类型',
            'value' => 2
        ],
        'sign_random_min' => [
            'name' => '随机奖励积分最小值',
            'value' => 1,
        ],
        'sign_random_max' => [
            'name' => '随机奖励积分最大值',
            'value' => 10
        ],
        'first_sign_point' => [
            'name' => '首次奖励积分',
            'value' => 1
        ],
        'continuity_sign_additional' => [
            'name' => '连续签到追加',
            'value' => 1
        ],
        'sign_most_point' => [
            'name' => '单日最大奖励',
            'value' => 10
        ],
        'point_switch' => [
            'name' => '开启积分功能',
            'value' => 1
        ],
        'point_discounted_proportion' => [
            'name' => '订单积分折现比例',
            'value' => 100
        ],
        'orders_point_proportion' => [
            'name' => '订单积分使用比例',
            'value' => 10
        ],
        'orders_reward_proportion' => [
            'name' => '订单积分奖励比例',
            'value' => 1
        ],
        'sign_appoint_date_status' => [
            'name' => '指定特殊日期状态',
            'value' => false
        ],
        'sign_appoint_date' => [
            'name' => '指定特殊日期',
            'value' => ''
        ],
        'sign_appoint_data_type' => [
            'name' => '指定日期奖励类型',
            'value' => 1
        ],
        'sign_appoint_date_rate' => [
            'name' => '指定日期倍率',
            'value' => 2
        ],
        'sign_appoint_date_additional' => [
            'name' => '指定日期追加',
            'value' => 10
        ],
        'wx_nick_name' => [
            'name' => '小程序名称',
            'value' => 'JSHOP',
        ],
        //小程序设置
        'wx_appid' => [           //小程序id
            'name' => 'AppId',
            'value' => '',
        ],
        'wx_app_secret' => [
            'name' => 'AppSecret',
            'value' => '',
        ],
        'wx_user_name' => [
            'name' => '原始Id',
            'value' => '',
        ],
        'wx_principal_name' => [
            'name' => '主体信息',
            'value' => '河南吉海网络科技有限公司',
        ],
        'wx_signature' => [
            'name' => '简介',
            'value' => 'Jshop小程序是一款标准B2C商城小程序',
        ],
        //公众号设置
        'wx_official_name' => [
            'name' => '公众号名称',
            'value' => '',
        ],
        'wx_official_id' => [
            'name' => '微信号',
            'value' => '',
        ],
        'wx_official_appid' => [
            'name' => 'AppId',
            'value' => '',
        ],
        'wx_official_app_secret' => [
            'name' => 'AppSecret',
            'value' => '',
        ],
        'wx_official_source_id' => [
            'name' => '公众号原始ID',
            'value' => '',
        ],
        'wx_official_token' => [
            'name' => '微信验证TOKEN',
            'value' => '',
        ],
        'wx_official_encodeaeskey' => [
            'name' => 'EncodingAESKey',
            'value' => ''
        ],
        'wx_official_type' => [
            'name' => '公众号类型',
            'value' => 'service'
        ],
        // 提现设置
        'tocash_money_low' => [
            'name' => '最低提现金额',
            'value' => '0.01'
        ],
        'tocash_money_rate' => [
            'name' => '提现服务费率',
            'value' => '0'
        ],
        'tocash_money_limit' => [
            'name' => '每日提现上限',
            'value' => '0'
        ],
        //其他设置
        'qq_map_key' => [
            'name' => '腾讯地图key',
            'value' => ''
        ],
        'kuaidi100_customer' => [
            'name' => '公司编号',
            'value' => ''
        ],
        'kuaidi100_key' => [
            'name' => '授权key',
            'value' => ''
        ],
        'image_storage_type' => [
            'name' => '图片存储引擎',
            'value' => 'Local'
        ],
        'image_storage_params' => [
            'name' => '图片存储配置参数',
            'value' => ''
        ],
        //搜索发现关键字
        'recommend_keys' => [
            'name' => '搜索发现关键词',
            'value' => '羽绒服 iphone 小米mix'
        ],
        //统计代码
        'statistics_code' => [
            'name' => '百度统计代码',
            'value' => ''
        ],
        //发票开关
        'invoice_switch' => [
            'name' => '发票功能',
            'value' => 1
        ],
        //第三方的登陆的时候，是否需要绑定手机号码，强烈建议用户开启，除非只在微信小程序内使用
        'is_bind_mobile' => [
            'name' => '绑定手机号码',
            'value' => '1'                      //1绑定，2不绑定
        ],
        //支付宝小程序appid
        'mp_alipay_appid' => [
            'name' => '支付宝小程序appid',
            'value' => ''
        ],
        'share_image' => [
            'name' => '分享图片',
            'value' => ''
        ],
        'share_title' => [
            'name' => '分享标题',
            'value' => '优质好店邀您共享'
        ],
        'share_desc' => [
            'name' => '分享描述',
            'value' => ''
        ],
        'about_article_id' => [
            'name' => '关于我们文章',
            'value' => '1'
        ],
        'about_article' => [
            'name' => '关于我们文章',
            'value' => ''
        ],
        'ent_id' => [
            'name' => '客服ID',
            'value' => ''
        ],
        'Web_channeid' => [
            'name' => '网页channelId',
            'value' => ''
        ],
        'App_channeid' => [
            'name' => 'APPchannelId',
            'value' => ''
        ],
        'Official_channeid' => [
            'name' => '微信公众号channelId',
            'value' => ''
        ],
        'Smallapp_channeid' => [
            'name' => '微信小程序channelId',
            'value' => ''
        ],
        'user_agreement_id' => [
            'name' => '用户协议',
            'value' => '2'
        ],
        'user_agreement' => [
            'name' => '用户协议',
            'value' => ''
        ],
        'privacy_policy_id' => [
            'name' => '隐私政策',
            'value' => '3'
        ],
        'privacy_policy' => [
            'name' => '隐私政策',
            'value' => ''
        ],
        'goods_show_word1' => [
            'name' => '商品显示文字1',
            'value' => '24小时内发货',
        ],
        'goods_show_word2' => [
            'name' => '商品显示文字2',
            'value' => '7天无理由退款'
        ],
        'language' => [
            'name' => '语言包',
            'value' => 'cn',
        ],
    ];

    protected const ALL_SETTING_CACHE_KEY = 'shop_all_setting';

    /**
     * 获取店铺全部设置缓存键
     * @return string
     */
    public static function getAllShopSettingCacheKey(): string
    {
        return self::ALL_SETTING_CACHE_KEY . '-' . static::$shop_id;
    }

    //设置参数
    public function setValue($skey, $value)
    {
        $result = $this->check($skey, $value);
        if (!$result['status']) {
            return $result;
        }
        if (is_array($value)) {
            $value = json_encode($value);
        }
        $info = $this->where(array('skey' => $skey))->find();
        if ($info) {
            $info->value = $value;
            $info->save();
        } else {
            $model = new $this();
            $model->save([
                'skey' => $skey,
                'value' => $value
            ]);
        }

        Cache::rm(self::getAllShopSettingCacheKey());

        $result['status'] = true;
        return $result;
    }

    /**
     * 取得参数
     * @param string $skey
     * @return mixed|string|array|null
     */
    public function getValue(string $skey)
    {
        $all = $this->getAll();
        return $all[$skey]['value'] ?? null;
    }

    /**
     * 一次查询获取多个配置信息
     * @param string $skeys 多个参数用英文逗号分隔
     * @return array
     */
    public function getMultipleValue(string $skeys): array
    {
        $all = $this->getAll();
        $skeys = explode(',', $skeys);
        $newList = [];
        //默认赋值
        foreach ($skeys as $key) {
            $newList[$key] = $all[$key]['value'] ?? '';
        }
        return $newList;
    }

    /**
     * 参数校验
     * @param $skey
     * @param $value
     * @return array|mixed|string
     */
    public function check($skey, $value)
    {
        if (!isset($this->skeys[$skey])) {
            return error_code(10008);
        }
        if ($skey == 'shop_name') {
            if ($value == '') {
                //                $result['msg'] = "店铺名称不能为空";
                return error_code(10084);
            }
        }

        if ($skey == 'shop_mobile') {
            if ($value != '') {
                if (!isMobile($value)) {
                    //                    $result['msg'] = '联系方式号码格式错误';
                    return error_code(10085);
                }
            }
        }
        $result = [
            'status' => true,
            'data' => '',
            'msg' => ''
        ];
        return $result;
    }

    /**
     * 获取全部参数，缓存加持
     * @return array
     */
    public function getAll(): array
    {
        $key = self::getAllShopSettingCacheKey();
        if (Cache::has($key)) {
            return Cache::get($key);
        }

        // 以下几个设置店铺可自定义覆盖平台设置
        $allowOverrideSkeys = ['about_article', 'about_article_id', 'shop_default_image', 'recommend_keys', 'cate_style'];
        $shop_list = Cache::get(SHOP_LIST_WITH_ID_CACHE_KEY);
        $shop = $shop_list[static::$shop_id];
        $adminSettingModel = new AdminSettingModel();
        $adminList = $adminSettingModel->getAll();
        $list = $this->select();
        foreach ($this->skeys as $k => $v) {
            if ($k == 'shop_name') {
                $this->skeys[$k]['value'] = $shop['name'];
                continue;
            }
            if (array_key_exists($k, $adminList)) {
                $this->skeys[$k]['value'] = $adminList[$k]['value'];

                if (!in_array($k, $allowOverrideSkeys)) continue;
            }
            foreach ($list as $info) {
                if ($info['skey'] == $k) {
                    if (isjson($info['value'])) {
                        $info['value'] = json_decode($info['value'], true);
                    }
                    $this->skeys[$k]['value'] = $info['value'];
                    break;
                }
            }
        }
        $this->skeys['shop_id'] = [
            'name' => '店铺ID',
            'value' => $shop['id']
        ];
        Cache::set($key, $this->skeys);
        return $this->skeys;
    }

    /**
     * 返回layui的table所需要的格式
     * @author sin
     * @param $post
     * @return mixed
     */
    public function tableData($post)
    {
        if (isset($post['limit'])) {
            $limit = $post['limit'];
        } else {
            $limit = config('paginate.list_rows');
        }
        $tableWhere = $this->tableWhere($post);
        $list = $this->field($tableWhere['field'])->where($tableWhere['where'])->order($tableWhere['order'])->paginate($limit);
        $data = $this->tableFormat($list->getCollection());         //返回的数据格式化，并渲染成table所需要的最终的显示数据类型

        $re['code'] = 0;
        $re['msg'] = '';
        $re['count'] = $list->total();
        $re['data'] = $data;
        //        $re['sql'] = $this->getLastSql();

        return $re;
    }

    /**
     * 根据输入的查询条件，返回所需要的where
     * @author sin
     * @param $post
     * @return mixed
     */
    protected function tableWhere($post)
    {
        $where = [];
        if (isset($post['skey']) && $post['skey'] != "") {
            $where[] = ['skey', 'eq', $post['skey']];
        }
        if (isset($post['value']) && $post['value'] != "") {
            $where[] = ['value', 'like', '%' . $post['value'] . '%'];
        }
        $result['where'] = $where;
        $result['field'] = "*";
        $result['order'] = [];
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
            if (isset($this->skeys[$v['skey']])) {
                $list[$k]['key_name'] = $this->skeys[$v['skey']]['name'];
            } else {
                $list[$k]['key_name'] = "";
            }
        }
        return $list;
    }
}
