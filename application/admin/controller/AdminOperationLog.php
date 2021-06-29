<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\AdminOperationLog as LogModel;
use app\common\model\AdminUserLog;

/**
 * 操作日志
 * Class AdminOperationLog
 * @package app\admin\controller
 */
class AdminOperationLog extends Admin
{
    public function index()
    {
        $logModel = new LogModel();
        if (IS_AJAX) {
            $request = input('param.');
            return $logModel->tableData($request);
        }
        return $this->fetch();
    }

    /**
     * 获取最近十条日志
     *
     * @return mixed
     */
    public function getLastLog()
    {
        $logModel = new LogModel();
        $request['limit'] = 10; //最近10条数据
        return $logModel->tableData($request);
    }

    /**
     * 用户日志
     *
     * @return void
     */
    public function userLog()
    {
        $logModel = new AdminUserLog();
        if (IS_AJAX) {
            $request = input('param.');
            $request['type'] = $logModel::MANAGE_TYPE;
            return $logModel->tableData($request);
        }
        return $this->fetch('user_list');
    }

    /**
     * 删除日志，默认返回不让删除提示
     * @return array
     */
    public function delLog(): array
    {
        return error_code(10075);
    }
}
