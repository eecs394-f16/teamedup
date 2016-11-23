<?php
	
	require_once("init.php");
	
	$parent_id = 1;
	
	$message = $_GET["message"];

	$team_id = $conn->escape_string($team_id);
	$message = $conn->escape_string($message);
	
	$arr = [];
	$result = $conn->query("INSERT INTO messages SET team_id = $team_id, parent_id = $parent_id, message = '$message', created_at = NOW();");
	
	print json_encode($message);
?>