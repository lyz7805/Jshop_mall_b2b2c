<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\AdminLog;
use app\common\model\AdminOperationLog as LogModel;
use app\common\model\User as UserModel;
use app\common\model\AdminUserLog;
use \think\facade\Request;

class AdminOperationLog extends Admin
{
    public function index()
    {
        $logModel = new LogModel();
        if(Request::isAjax())
        {
            $request = input('param.');
            return $logModel->tableData($request);
        }
        return $this->fetch();
    }

    public function getLastLog(){
        $logModel = new LogModel();
        $request['limit'] = 10;//最近10条数据
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
        if (Request::isAjax()) {
            $request         = input('param.');
            $request['type'] = $logModel::MANAGE_TYPE;
            return $logModel->tableData($request);
        }
        return $this->fetch('user_list');
    }

    /**
     * 删除日志
     * @return array
     */
    public function delLog()
    {
        $result = error_code(10075);
        return $result;

        $ids = input('ids/a', []);
        if (!$ids) {
            return error_code(10051);
        }
        $logModel = new LogModel();
        $res = $logModel->where([['id','in',$ids]])->delete();
        if($res !== false)
        {
            $result['msg'] = '删除成功';
            $result['status'] = true;
        }
        return $result;
    }

}