<?php
require_once(__DIR__ . '/core/db.php');
require_once(__DIR__ . '/core/helpers.php');

function insert_options($key, $value)
{
    global $LOCNGUYEN_SIEUTHICODE;
    if (!$LOCNGUYEN_SIEUTHICODE->get_row("SELECT * FROM `options` WHERE `key` = '$key' ")) {

        $LOCNGUYEN_SIEUTHICODE->query("INSERT INTO `options` (`key`, `value`) VALUES ('$key', '$value')");
    }
}

insert_options('footer','');
insert_options('status_api','1');
insert_options('logo_center','');
insert_options('content_banner','HACK PUBG, PUBG MOBILE, PUBG STEAM, APEX LEGEND,CALL OF DUTY, ĐÂU TRƯỜNG CÔNG LÝ, HACK CALL OF DUTY - NICK RÁC LOL - NICK LMHT - ACC RÁC - HACK VALORANT, HACK ĐỘT KÍCH CFVN-HACK GAME ONLINE.');
die('Success!');
