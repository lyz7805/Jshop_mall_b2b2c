<?php
namespace app\common\model;

use think\facade\Log;

class OperationLog extends BaseB2b2c
{
    protected $autoWriteTimestamp = true;
    protected $createTime = 'ctime';
    protected $updateTime = false;
    /**
     * 保存操作日志信息
     * @param array $data
     * @return int|string
     */
    public function doAdd($data = [])
    {
        $result = $this->save($data);
        if ($result) {
            return $this->getLastInsID();
        }
        return $result;
    }

    protected function tableWhere($post)
    {
        $where = [];

        if(!empty($post['date']))
        {
            $date_string = $post['date'];
            $date_array = explode(' 到 ', $date_string);
            $sdate = strtotime($date_array[0].' 00:00:00');
            $edate = strtotime($date_array[1].' 23:59:59');
            $where[] = array('ctime', ['>=', $sdate], ['<', $edate], 'and');
        }
        if(isset($post['id']) && $post['id'] !=''){
            $where[] = ['id','in',$post['id']];
        }
        $result['where'] = $where;
        $result['field'] = "*";
        $result['order'] = "id desc";
        return $result;
    }

    protected function tableFormat($list)
    {
        if(!$list->isEmpty()){
            foreach($list as $key=>$val){
                $list[$key]['ctime'] = getTime($val['ctime']);
                $list[$key]['username'] = get_manage_info($val['manage_id']);
            }
        }
        return parent::tableFormat($list); // TODO: Change the autogenerated stub
    }
    /**
     * 设置csv header
     * @return array
     */
    public function csvHeader()
    {
        return [
            [
                'id' => 'username',
                'desc' => '操作员',
            ],
            [
                'id' => 'ctime',
                'desc' => '操作时间',
            ],
            [
                'id' => 'desc',
                'desc' => '操作描述',
            ],
            [
                'id' => 'content',
                'desc' => '操作内容',
            ],
            [
                'id' => 'ip',
                'desc' => '操作IP',
            ],
        ];
    }
    /**
     * 获取csv数据
     * @param $post
     * @return array
     */
    public function getCsvData($post)
    {
        $result = error_code(10083);
        $header = $this->csvHeader();
        $userData = $this->getExportList($post);

        if ($userData['count'] > 0) {
            $tempBody = $userData['data'];
            $body = [];
            $i = 0;

            foreach ($tempBody as $key => $val) {
                $i++;
                foreach ($header as $hk => $hv) {
                    if (isset($val[$hv['id']]) && $val[$hv['id']] && isset($hv['modify'])) {
                        if (function_exists($hv['modify'])) {
                            $body[$i][$hk] = $hv['modify']($val[$hv['id']]);
                        }
                    } elseif (isset($val[$hv['id']]) &&!empty($val[$hv['id']])) {
                        $body[$i][$hk] = $val[$hv['id']];
                    } else {
                        $body[$i][$hk] = '';
                    }
                }
            }
            $result['status'] = true;
            $result['msg'] = '导出成功';
            $result['data'] = $body;
            return $result;
        } else {
            //失败，导出失败
            return $result;
        }
    }
    /**
     * 导出验证
     * @param array $params
     * @return array
     */
    public function exportValidate(&$params = [])
    {
        $result = [
            'status' => true,
            'data'   => [],
            'msg'    => '验证成功',
        ];
        return $result;
    }
    //导出格式
    public function getExportList($post = [])
    {
        $return_data = [
            'status' => false,
            'msg' => error_code(10025,true),
            'data' => '',
            'count' => 0
        ];
        $where = [];

        if(!empty($post['date']))
        {
            $date_string = $post['date'];
            $date_array = explode(' 到 ', $date_string);
            $sdate = strtotime($date_array[0].' 00:00:00');
            $edate = strtotime($date_array[1].' 23:59:59');
            $where[] = array('ctime', ['>=', $sdate], ['<', $edate], 'and');
        }
        if(isset($post['id']) && $post['id'] !=''){
            $where[] = ['id','in',$post['id']];
        }

        $list = $this->where($where)
            ->order('id desc')
            ->select();

        if($list){
            $count = $this->where($where)->count();
            foreach($list as $key=>$val){
                $list[$key]['ctime'] = getTime($val['ctime']);
                $list[$key]['username'] = get_manage_info($val['manage_id']);
            }
            $return_data = [
                'status' => true,
                'msg' => '获取成功',
                'data' => $list,
                'count' => $count
            ];
        }
        return $return_data;
    }

}