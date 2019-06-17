<?php
use Corelib\Method;
use Corelib\Valid;
use Make\Database\Pdosql;
use Manage\Func as Manage;

class submit{

    public function _init(){
        $this->_make();
    }

    public function _make(){
        global $board_id;

        $sql = new Pdosql();
        $manage = new Manage();

        $sql->scheme('Module\\Board\\Scheme');

        Method::security('REFERER');
        Method::security('REQUEST_POST');
        $req = Method::request('POST','id,title,theme,use_category,category,use_list,m_use_list,list_limit,m_list_limit,sbj_limit,m_sbj_limit,txt_limit,m_txt_limit,use_likes,use_reply,use_comment,use_secret,ico_secret_def,use_file1,use_file2,use_mng_feed,file_limit,article_min_len,top_source,bottom_source,ctr_level,list_level,write_level,secret_level,comment_level,reply_level,delete_level,read_level,write_level,read_point,write_point,ico_file,ico_secret,ico_new,ico_new_case,ico_hot,ico_hot_case_1,ico_hot_case_2,ico_hot_case_3,conf_1,conf_2,conf_3,conf_4,conf_5,conf_6,conf_7,conf_8,conf_9,conf_10,conf_exp');

        $board_id = $req['id'];

        Valid::isidx('id',$req['id'],1,'');
        Valid::notnull('title',$req['title'],'');
        Valid::isnum('file_limit',$req['file_limit'],0,50,1,'');
        Valid::isnum('ico_new_case',$req['ico_new_case'],0,10,1,'');
        Valid::isnum('ico_hot_case_1',$req['ico_hot_case_1'],0,10,1,'');
        Valid::isnum('ico_hot_case_2',$req['ico_hot_case_2'],0,10,1,'');

        if($req['use_category']=='Y' && !$req['category']){
            Valid::error('category','카테고리 설정을 확인하세요.');
        }
        if(!$req['list_limit']) $req['list_limit'] = 15;
        if(!$req['m_list_limit']) $req['m_list_limit'] = 10;
        if(!$req['sbj_limit']) $req['sbj_limit'] = 50;
        if(!$req['m_sbj_limit']) $req['m_sbj_limit'] = 30;
        if(!$req['txt_limit']) $req['txt_limit'] = 150;
        if(!$req['m_txt_limit']) $req['m_txt_limit'] = 100;
        if(!$req['article_min_len']) $req['article_min_len'] = 30;
        if(!$req['read_point']) $req['read_point'] = 0;
        if(!$req['write_point']) $req['write_point'] = 0;

        $conf_exp = $sql->etcfd_exp(implode('|',$req['conf_exp']));

        $req['use_list'] = $req['use_list'].'|'.$req['m_use_list'];
        $req['list_limit'] = $req['list_limit'].'|'.$req['m_list_limit'];
        $req['sbj_limit'] = $req['sbj_limit'].'|'.$req['m_sbj_limit'];
        $req['txt_limit'] = $req['txt_limit'].'|'.$req['m_txt_limit'];
        $req['ico_hot_case'] = $req['ico_hot_case_1'].'|'.$req['ico_hot_case_3'].'|'.$req['ico_hot_case_2'];

        $sql->query(
            $sql->scheme->manage('create:data'),''
        );

        $sql->query(
            $sql->scheme->manage('create:cmt'),''
        );

        $sql->query(
            $sql->scheme->manage('insert:board'),
            array(
                $req['id'],$req['theme'],$req['title'],$req['use_list'],$req['use_secret'],$req['use_comment'],$req['use_likes'],$req['use_reply'],$req['use_file1'],$req['use_file2'],$req['use_mng_feed'],$req['use_category'],$req['category'],$req['file_limit'],$req['list_limit'],$req['sbj_limit'],$req['txt_limit'],$req['article_min_len'],$req['list_level'],$req['write_level'],$req['secret_level'],$req['comment_level'],$req['delete_level'],$req['read_level'],$req['ctr_level'],$req['reply_level'],$req['write_point'],$req['read_point'],$req['top_source'],$req['bottom_source'],$req['ico_file'],$req['ico_secret'],$req['ico_secret_def'],$req['ico_new'],$req['ico_new_case'],$req['ico_hot'],$req['ico_hot_case'],$req['conf_1'],$req['conf_2'],$req['conf_3'],$req['conf_4'],$req['conf_5'],$req['conf_6'],$req['conf_7'],$req['conf_8'],$req['conf_9'],$req['conf_10'],$conf_exp
            )
        );

        $sql->query(
            $sql->scheme->manage('select:latest_config'),''
        );
        $idx = $sql->fetch('idx');

        Valid::set(
            array(
                'return' => 'alert->location',
                'msg' => '성공적으로 추가 되었습니다.',
                'location' => PH_MANAGE_DIR.'/?mod='.MOD_BOARD.'&href=lists&p=modify&idx='.$idx
            )
        );
        Valid::success();
    }

}
