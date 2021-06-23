<?php

namespace app\admin\controller;

use app\common\controller\Admin;
use app\common\model\AdminSetting as AdminSetting;
use app\common\model\Videos as VideosModel;
use think\Console;
use think\facade\Cache;

/**
 * 平台设置
 * Class Setting
 * @package app\admin\controller
 */
class Setting extends Admin
{
    public function index()
    {
        $adminSettingModel = new AdminSetting();
        if (IS_AJAX) {
            foreach (input('param.') as $k => $v) {
                $result = $adminSettingModel->setValue($k, $v);
                //如果出错，就返回，如果是没有此参数，就默认跳过
                if (!$result['status'] && $result['data'] != 10008) {
                    return $result;
                }
            }
            $result = array(
                'status' => true,
                'data' => [],
                'msg' => '保存成功'
            );
            //配置保存后，清理缓存
            Cache::clear();
            @Console::call('clear', ['--cache', '--dir']); //清除缓存文件
            Console::call('clear', ['--path', ROOT_PATH . '\\runtime\\temp\\']); //清除模板缓存
            return $result;
        } else {
            $data = $adminSettingModel->getAll();
            $this->assign('data', $data);
            return $this->fetch();
        }
    }

    /*
    * 弹出层视频列表
    * */
    public function videos()
    {
        $videosModel = new VideosModel();

        if (IS_AJAX) {
            $filter = input('request.');
            return $videosModel->tableData($filter);
        }
        return $this->fetch();
    }

    /*
     * 视频添加
     * */
    public function videoAdd()
    {
        $this->view->engine->layout(false);

        if (IS_POST) {
            $videosModel = new VideosModel();
            return $videosModel->addData(input('param.'));
        }
        return $this->fetch('setting/video_add');
    }

    /*
     * 视频删除
     * */
    public function videoDel()
    {
        $videosModel = new VideosModel();
        $result = [
            'status' => true,
            'msg' => '删除成功'
        ];
        $id = input('param.id/d');
        $url = input('param.path');
        $res = $videosModel->destroy($id);
        if (!unlink($url) && !$res) { // 删除视频文件
            return error_code(10023);
        }
        return $result;
    }
}
