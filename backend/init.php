<?php
	
	$servername = "INSERT_MYSQL_HOST";
	$username = "INSERT_MYSQL_USERNAME";
	$password = "INSERT_MYSQL_PASSWORD";
	$conn = new mysqli($servername, $username, $password, "teamedup");
	// Check connection
	if ($conn->connect_error) {
	    die();
	}
	
	$conn->query("SET time_zone = 'America/Chicago';");
	
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');
	
	require_once("auth.php");
	