<?php
$SCHEME_MOD = "

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_board_config (
    idx int(11) NOT NULL auto_increment,
    id varchar(255) BINARY default NULL,
    theme varchar(255) default 'list',
    title varchar(255) default NULL,
    use_list char(3) default 'Y|N',
    use_secret char(1) default 'Y',
    use_comment char(1) default 'Y',
    use_likes char(1) default 'Y',
    use_reply char(1) default 'Y',
    use_file1 char(1) default 'Y',
    use_file2 char(1) default 'N',
    use_mng_feed char(1) NOT NULL default 'Y',
    use_category char(1) default 'N',
    category text,
    file_limit int(50) default '5242880',
    list_limit varchar(50) default '15|5',
    sbj_limit varchar(255) NOT NULL default '100|50',
    txt_limit varchar(50) default '50|30',
    article_min_len int(11) NOT NULL default '30',
    list_level int(11) default '10',
    write_level int(11) default '9',
    secret_level int(11) default '1',
    comment_level int(11) default '9',
    delete_level int(11) default '9',
    read_level int(11) default '10',
    ctr_level int(11) default '3',
    reply_level int(11) default '9',
    write_point int(11) default '10',
    read_point int(11) default '0',
    top_source text,
    bottom_source text,
    ico_file char(3) default 'Y',
    ico_secret char(3) default 'Y',
    ico_secret_def char(1) default 'N',
    ico_new char(3) default 'Y',
    ico_new_case int(11) default '4320',
    ico_hot char(3) default 'N',
    ico_hot_case varchar(50) default '10|OR|50',
    regdate datetime default NULL,
    conf_1 text,
    conf_2 text,
    conf_3 text,
    conf_4 text,
    conf_5 text,
    conf_6 text,
    conf_7 text,
    conf_8 text,
    conf_9 text,
    conf_10 text,
    conf_exp text,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_board_data_freeboard (
    idx int(11) NOT NULL auto_increment,
    category varchar(255) default NULL,
    ln int(11) default '0',
    rn int(11) default '0',
    mb_idx int(11) default '0',
    mb_id varchar(255) default NULL,
    writer varchar(255) default NULL,
    pwd text,
    email varchar(255) default NULL,
    article text,
    subject varchar(255) default NULL,
    file1 text,
    file1_cnt int(11) default '0',
    file2 text,
    file2_cnt int(11) default '0',
    use_secret char(1) default 'N',
    use_notice char(1) default 'N',
    use_html char(1) default 'Y',
    use_email char(1) default 'Y',
    view int(11) default '0',
    ip varchar(255) default NULL,
    regdate datetime default NULL,
    dregdate datetime default NULL,
    data_1 text,
    data_2 text,
    data_3 text,
    data_4 text,
    data_5 text,
    data_6 text,
    data_7 text,
    data_8 text,
    data_9 text,
    data_10 text,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_board_cmt_freeboard (
    idx int(11) NOT NULL auto_increment,
    ln int(11) default '0',
    rn int(11) default '0',
    bo_idx int(11) default NULL,
    mb_idx int(11) default '0',
    writer varchar(255) default NULL,
    comment text,
    ip varchar(255) default NULL,
    regdate datetime default NULL,
    cmt_1 text,
    cmt_2 text,
    cmt_3 text,
    cmt_4 text,
    cmt_5 text,
    cmt_6 text,
    cmt_7 text,
    cmt_8 text,
    cmt_9 text,
    cmt_10 text,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_board_data_news (
    idx int(11) NOT NULL auto_increment,
    category varchar(255) default NULL,
    ln int(11) default '0',
    rn int(11) default '0',
    mb_idx int(11) default '0',
    mb_id varchar(255) default NULL,
    writer varchar(255) default NULL,
    pwd text,
    email varchar(255) default NULL,
    article text,
    subject varchar(255) default NULL,
    file1 text,
    file1_cnt int(11) default '0',
    file2 text,
    file2_cnt int(11) default '0',
    use_secret char(1) default 'N',
    use_notice char(1) default 'N',
    use_html char(1) default 'Y',
    use_email char(1) default 'Y',
    view int(11) default '0',
    ip varchar(255) default NULL,
    regdate datetime default NULL,
    dregdate datetime default NULL,
    data_1 text,
    data_2 text,
    data_3 text,
    data_4 text,
    data_5 text,
    data_6 text,
    data_7 text,
    data_8 text,
    data_9 text,
    data_10 text,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_board_cmt_news (
    idx int(11) NOT NULL auto_increment,
    ln int(11) default '0',
    rn int(11) default '0',
    bo_idx int(11) default NULL,
    mb_idx int(11) default '0',
    writer varchar(255) default NULL,
    comment text,
    ip varchar(255) default NULL,
    regdate datetime default NULL,
    cmt_1 text,
    cmt_2 text,
    cmt_3 text,
    cmt_4 text,
    cmt_5 text,
    cmt_6 text,
    cmt_7 text,
    cmt_8 text,
    cmt_9 text,
    cmt_10 text,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO {$req['pfx']}mod_board_config (idx, id, theme, title, use_list, use_secret, use_comment, use_likes, use_reply, use_file1, use_file2, use_mng_feed, use_category, category, file_limit, list_limit, sbj_limit, txt_limit, article_min_len, list_level, write_level, secret_level, comment_level, delete_level, read_level, ctr_level, reply_level, write_point, read_point, top_source, bottom_source, ico_file, ico_secret, ico_secret_def, ico_new, ico_new_case, ico_hot, ico_hot_case, regdate, conf_1, conf_2, conf_3, conf_4, conf_5, conf_6, conf_7, conf_8, conf_9, conf_10, conf_exp) VALUES
(2, 'freeboard', 'gallery', 'Freeboard', 'Y|Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', '', 5242880, '15|10', '50|30', '150|100', 30, 10, 10, 1, 10, 10, 10, 3, 10, 10, 0, '', '', 'Y', 'Y', 'N', 'Y', 60, 'Y', '2|AND|1', now(), '', '', '', '', '', '', '', '', '', '', '|||||||||'),
(1, 'news', 'basic', 'News', 'Y|Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', '', 5242880, '15|10', '50|30', '150|100', 30, 10, 10, 1, 10, 10, 10, 3, 10, 10, 0, '', '', 'Y', 'Y', 'N', 'Y', 60, 'Y', '2|AND|1', now(), '', '', '', '', '', '', '', '', '', '', '|||||||||');

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_board_like (
    idx int(11) NOT NULL auto_increment,
    id varchar(255) default NULL,
    data_idx int(11) default NULL,
    mb_idx int(11) default NULL,
    likes int(11) default '0',
    unlikes int(11) default '0',
    regdate datetime default NULL,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_contactform (
    idx int(11) NOT NULL auto_increment,
    rep_idx int(11) default '0',
    mb_idx int(11) default '0',
    article text,
    name varchar(255) default NULL,
    email text,
    phone varchar(255) default NULL,
    regdate datetime default NULL,
    contact_1 text,
    contact_2 text,
    contact_3 text,
    contact_4 text,
    contact_5 text,
    contact_6 text,
    contact_7 text,
    contact_8 text,
    contact_9 text,
    contact_10 text,
    contact_exp text,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS {$req['pfx']}mod_contents (
    idx int(11) NOT NULL auto_increment,
    data_key varchar(255) NOT NULL,
    title varchar(255) default NULL,
    html text,
    mo_html text,
    use_mo_html char(1) NOT NULL default 'N',
    regdate datetime default NULL,
    PRIMARY KEY  (idx)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO {$req['pfx']}mod_contents (idx, data_key, title, html, mo_html, use_mo_html, regdate) VALUES
(1, 'sample', 'sample', '<h1><span style=\"color:#000000;letter-spacing:-2px;font-size:48px;font-weight:100;\">Contents&nbsp;Module</span></h1><h3><span style=\"font-size:28px;color:#666666;letter-spacing:-2px;font-weight:100;\">이 페이지는 Contents 모듈로 생성한<br />샘플 페이지입니다.</span></h3><div style=\"border:1px; solid #eaeaea;padding:30px;background:#f7f7f7;margin-top:30px;\"><span style=\"color:#000000;font-size:14px;\">현재 페이지의 내용을 변경 하려면 관리자 아이디로 로그인 후<br /><strong>&#39;Manage &gt; 모듈 &gt; 콘텐츠&#39; </strong>에 접근하세요.<br />콘텐츠 페이지를 관리 및 신규 추가가 가능합니다.</span></div>', '<h1><span style=\"color:#000000;letter-spacing:-1px;font-size:25px;font-weight:100;\">Contents&nbsp;Module</span></h1><h3><span style=\"font-size:14px;color:#666666;letter-spacing:-1px;font-weight:100;\">이 페이지는 Contents 모듈로 생성한<br />샘플 페이지입니다.</span></h3><div style=\"border:1px; solid #eaeaea;padding:20px 15pxpx;background:#f7f7f7;margin-top:20px;\"><span style=\"color:#000000;font-size:11px;\">현재 페이지의 내용을 변경 하려면 관리자 아이디로 로그인 후<br /><strong>&#39;Manage &gt; 모듈 &gt; 콘텐츠&#39; </strong>에 접근하세요.<br />콘텐츠 페이지를 관리 및 신규 추가가 가능합니다.</span></div>', 'Y', now());

";
