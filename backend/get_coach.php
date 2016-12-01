<?php
	require_once("init.php");
	
	$coach_id = $_GET["coach_id"];
	$coach_id = $conn->escape_string($coach_id);
	
	if ($result = $conn->query("SELECT * FROM coaches WHERE team_id = $team_id")) {
	
	    $row = $result->fetch_array(MYSQL_ASSOC);
		$row["id"] = intval($row["id"]);
		$row["team_id"] = intval($row["team_id"]);
		echo json_encode($row);
		
	}
?>