<?php
require_once 'config.php';
	$dbh = new PDO ("mysql:dbname=$db['name'];host=$db['host'],
		$db['login'],
		$db['passwd'],
		array(PDO::MYSQL_ATTR-INIT_COMMAND => "SET NAMES 'utf8'")
	);


