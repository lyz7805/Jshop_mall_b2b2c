<?php
/**
 * Created by PhpStorm.
 * User: tian yu
 * Date: 2018/1/18 0018
 * Time: 10:49
 */

namespace app\Manage\controller;

use app\common\controller\Manage;
use app\common\model\ManageLog;
use app\common\model\OperationLog as LogModel;
use app\common\model\User as UserModel;
use app\common\model\UserLog;
use \think\facade\Request;

class OperationLog extends Manage
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
     * @deprecated B2B2C模式商铺不可查看用户日志，直接调用manageLog返回
     *
     * @return void
     */
    protected function userLog()
    {
        return $this->manageLog();
        $logModel = new UserLog();
        if (Request::isAjax()) {
            $request         = input('param.');
            $request['type'] = $logModel::MANAGE_TYPE;
            return $logModel->tableData($request);
        }
        return $this->fetch('user_list');
    }

    /**
     * 管理员登录退出日志，B2B2C模式下使用
     *
     * @return void
     */
    public function manageLog()
    {
        $logModel = new ManageLog();
        if (Request::isAjax()) {
            $request         = input('param.');
            return $logModel->tableData($request);
        }
        return $this->fetch('manage_list');
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