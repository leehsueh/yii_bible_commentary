<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Bible Commentary Application',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
        'application.modules.user.models.*',
	),
    'modules'=>array(
        'user'=>array(
                'hash'=>'md5',                                      # encrypting method (php hash function)
                'sendActivationMail' => true,                         # send activation email
                'loginNotActiv' => false,                             # allow access for non-activated users
                'autoLogin' => true,                                 # automatically login form registration
                'registrationUrl' => array('/user/registration'),   #registration path
                'recoveryUrl' => array('/user/recovery'),           # recover password path
                'loginUrl' => array('/user/login'),                 # login form path
                'returnUrl' => array('/site/dashboard'),              # page after login
                'returnLogoutUrl' => array('/user/login'),          # page after logout
        ),
    ),
	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=leehsueh_bc',
			'emulatePrepare' => true,
			'username' => 'leehsueh_bc',
			'password' => 'bcdev',
			'charset' => 'utf8',
            'tablePrefix' => 'tbl_',
		),
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'hlee@leehsueh.net',
	),
);