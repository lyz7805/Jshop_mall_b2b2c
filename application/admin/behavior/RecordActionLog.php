<?php

namespace app\admin\behavior;

use app\common\model\AdminOperation;
use app\common\model\AdminOperationLog;
use think\facade\Log;
use think\facade\Request;

/**
 * 记录操作日志
 */
class RecordActionLog
{
    /**
     * 不需要保存的控制器和方法
     *
     * @var array
     */
    protected $exclude = [
        'advertposition' => ['index'],
        'advertisement' => ['index'],
        'article' => ['index'],
        'articletype' => ['index'],
        'billaftersales' => ['index'],
        'billrefund' => ['index'],
        'billreship' => ['index'],
        'brand' => ['index'],
        'categories' => ['index'],
        'coupon' => ['index'],
        'goods' => ['index'],
        'goodstype' => ['index'],
        'goodsrypeSpec' => ['index'],
        'ietask' => ['index'],
        'images' => ['index'],
        'notice' => ['index'],
        'order' => ['index'],
        'payments' => ['index'],
        'promotion' => ['index'],
        'setting' => ['index'],
        'ship' => ['index'],
        'store' => ['index'],
        'user' => ['comment'],
        'wechat' => ['verifylist'],
    ];

    public function run($params)
    {
        $admin = session('admin');
        if (Request::isPost()) {
            $ctl          = strtolower(Request::controller());
            $act          = strtolower(Request::action());

            // 在排除名单之外的
            if (!(in_array($ctl, array_keys($this->exclude)) && ($this->exclude[$ctl] === '*' || in_array($act, $this->exclude[$ctl])))) {
                $operation = new AdminOperation();
                $opinfo    = $operation->getOperationInfo($ctl, $act, $operation::MENU_ADMIN);
                if ($opinfo['status']) {
                    $postData = input('post.');
                    $decs     = $opinfo['data']['act']['name'];
                    if ($postData['name'] || $postData['id']) {
                        $decs = $decs . '：' . ($postData['name'] ? $postData['name'] : $postData['id']);
                    }
                    $log      = [
                        'admin_id'  => $admin['id'],
                        'controller' => $ctl,
                        'method'     => $act,
                        'desc'       => $decs,
                        'content'    => json_encode($postData),
                        'ip'         => get_client_ip(0, true),
                    ];
                    $logModel = new AdminOperationLog();
                    $logModel->doAdd($log);
                } else {
                    Log::record(json_encode($opinfo));
                }
            }
        }
    }
}
