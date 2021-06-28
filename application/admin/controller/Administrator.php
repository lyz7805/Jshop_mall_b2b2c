<?php

namespace app\admin\controller;

use app\common\controller\Admin as AdminController;
use app\common\model\Admin as AdminModel;
use app\common\model\AdminRole;
use app\common\model\AdminRoleRel;
use app\common\model\UserLog;
use org\Curl;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;

/**
 * 管理员
 * Class Administrator
 * @package app\admin\controller
 */
class Administrator extends AdminController
{
    /**
     * 管理员列表
     * @return mixed
     */
    public function index()
    {
        if (IS_AJAX) {
            $adminModel = new AdminModel();
            return $adminModel->tableData(input('param.'));
        }
        return $this->fetch('index');
    }

    /**
     * 添加管理员
     * @return array|mixed
     * @throws Exception
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     * @throws PDOException
     */
    public function add()
    {
        $result = [
            'status' => false,
            'msg' => error_code(10019, true),
            'data' => ''
        ];
        $this->view->engine->layout(false);
        $adminModel = new AdminModel();
        $adminRoleModel = new AdminRole();
        $adminRoleList = $adminRoleModel->select();
        if (IS_POST) {
            if (!input('?param.username') || input('param.username') == "" || strlen(
                    input('param.username')
                ) < 6 || strlen(input('param.username')) > 20) {
                return error_code(11008);
            }

            if (!input('?param.mobile') || input('param.mobile') == "") {
                return error_code(11080);
            }
            if (!input('?param.password') || strlen(input('param.password')) < 6 || strlen(
                    input('param.password')
                ) > 16) {
                return error_code(11009);
            }
            return $adminModel->toAdd(input('param.'));
        }
        $this->assign('roleList', $adminRoleList);
        $result['status'] = true;
        $result['msg'] = '成功';
        $result['data'] = $this->fetch('edit')->getContent();
        return $result;
    }

    /**
     * 编辑管理员
     * @return array|mixed
     * @throws Exception
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     * @throws PDOException
     */
    public function edit()
    {
        $result = [
            'status' => false,
            'msg' => error_code(10021, true),
            'data' => ''
        ];
        $this->view->engine->layout(false);
        if (!input('?param.id')) {
            return error_code(10000);
        }

        $adminModel = new AdminModel();
        if (input('param.id') == $adminModel::TYPE_SUPER_ID) {
            return error_code(11023);
        }
        $adminInfo = $adminModel->where(['id' => input('param.id')])->find();
        if (!$adminInfo) {
            return error_code(11004);
        }

        if (IS_POST) {
            return $adminModel->toAdd(input('param.'));
        }

        $adminRoleModel = new AdminRole();
        $adminRoleList = $adminRoleModel->select();
        $adminRoleRelModel = new AdminRoleRel();
        $smList = $adminRoleRelModel->where(['admin_id' => input('param.id')])->select();
        foreach ($adminRoleList as $k => $v) {
            $checked = false;
            foreach ($smList as $i => $j) {
                if ($j['role_id'] == $v['id']) {
                    $checked = true;
                    break;
                }
            }
            $adminRoleList[$k]['checked'] = $checked;
        }
        $this->assign('roleList', $adminRoleList);
        $this->assign('adminInfo', $adminInfo);
        $result['status'] = true;
        $result['msg'] = '成功';
        $result['data'] = $this->fetch('edit')->getContent();
        return $result;
    }

    /**
     * 删除管理员
     * @return array|mixed
     * @throws \Exception
     */
    public function del()
    {
        $result = [
            'status' => true,
            'msg' => '删除成功',
            'data' => ''
        ];
        if (!input('?param.id')) {
            return error_code(10000);
        }

        $adminModel = new AdminModel();
        if (input('param.id') == $adminModel::TYPE_SUPER_ID) {
            return error_code(11024);
        }

        $where['id'] = input('param.id');
        $re = $adminModel->where($where)->delete();
        if ($re) {
            return $result;
        } else {
            return error_code(10023);
        }
    }

    /**
     * 获取用户资料信息
     * @return mixed
     */
    public function information()
    {
        $adminModel = new AdminModel();
        $adminInfo = $adminModel->where(['id' => session('admin.id')])->find();
        $this->assign('admin_info', $adminInfo);
        return $this->fetch();
    }

    /**
     * 用户修改/找回密码
     * @return array|string
     */
    public function editPwd()
    {
        $adminModel = new AdminModel();

        if (!input('?param.newPwd') || !input('?param.password') || !input('?param.rePwd')) {
            return error_code(11009);
        }
        if (input('param.newPwd') != input('param.rePwd')) {
            return error_code(11025);
        }

        return $adminModel->chengePwd(session('admin.id'), input('param.password'), input('param.newPwd'));
    }

    /**
     * 获取查询授权信息
     * @return array
     */
    public function getVersion(): array
    {
        $return = [
            'msg' => error_code(10027, true),
            'status' => false,
            'data' => []
        ];
        $product = config('jshop.product');
        $version = config('jshop.version');
        $url = config('jshop.authorization_url') . '/b2c/Authorization/verification';
        $domain = $_SERVER['SERVER_NAME'];
        $curl = new Curl();
        $params = [
            'domain' => $domain,
            'product' => $product,
            'version' => $version,
            'time' => time(),
        ];
        $data = $curl::post($url, $params);
        $data = json_decode($data, true);
        if ($data['status']) {
            $return['data']['is_authorization'] = $data['data']['is_authorization'];
            $return['data']['version'] = $version;
            $return['data']['product'] = $product;
            $return['data']['changeLog'] = $data['data']['changeLog'];
            $return['msg'] = '授权查询成功';
            $return['status'] = true;
            return $return;
        }
        //未授权
        $return['data']['product'] = $product;
        $return['data']['version'] = $version;
        $return['data']['changeLog'] = '未查询到授权信息';
        $return['data']['is_authorization'] = false;
        return $return;
    }

    public function userLogList()
    {
        $userLogModel = new UserLog();
        return $userLogModel->getList(0, $userLogModel::MANAGE_TYPE);
    }
}
