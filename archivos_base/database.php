<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$active_group = 'db_ventas';
$query_builder = TRUE;

$db['db_ventas'] = array(
	'dsn'	=> '',
	'hostname' => '127.0.0.1',
	'username' => 'root', 	
	'password' => '',	
	'database' => 'db_proyectox',
	//'database' => 'id9969591_basealdidacom',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);
