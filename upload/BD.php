<?php

//Criar as constantes com as credencias de acesso ao banco de dados
define('HOST', 'localhost');
define('USER', 'u241268151_root');
define('PASS', 'Sara1122*1122');
define('DBNAME', 'u241268151_tcc1');

//Criar a conexão com banco de dados usando o PDO
$bd = new pdo('mysql:host=' . HOST . ';dbname=' . DBNAME, USER, PASS);