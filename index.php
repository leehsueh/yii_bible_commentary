<?php

// change the following paths if necessary
//$yii=dirname(__FILE__).'/../yii_framework/yii.php';

$deploy = false;

// latest yii framework
if ($deploy) {
	$yii='/home/leehsueh/yii_framework-1.1.8/yii.php';
	$config=dirname(__FILE__).'/protected/config/main.php';
	$YII_DEBUG = false;
} else {
	$yii=dirname(__FILE__).'/../yii-1.1.8/framework/yii.php';
	$config=dirname(__FILE__).'/protected/config/main_mba_dev.php';
}

// remove the following line when in production mode
defined('YII_DEBUG') or define('YII_DEBUG',true);

require_once($yii);
Yii::createWebApplication($config)->run();
