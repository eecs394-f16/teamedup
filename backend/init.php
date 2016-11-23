<?php
	
	$servername = "mysql.nudm.org";
	$username = "teamedup";
	$password = "TeamRed2017!";
	$conn = new mysqli($servername, $username, $password, "teamedup");
	// Check connection
	if ($conn->connect_error) {
	    die();
	}
	
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');
	
	require_once("auth.php");
	