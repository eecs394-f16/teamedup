<?php
	require_once("init.php");
	
	$event_id = $_GET["event_id"];
	$event_id = $conn->escape_string($event_id);
	
	if ($result = $conn->query("SELECT * FROM schedule WHERE id = $event_id AND team_id = $team_id")) {
	
	    $row = $result->fetch_array(MYSQL_ASSOC);
		$row["id"] = intval($row["id"]);
		$row["team_id"] = intval($row["team_id"]);
		echo json_encode($row);
		
	}
?>