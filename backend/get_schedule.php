<?php
	require_once("init.php");
	
	$arr = array();
	if ($result = $conn->query("SELECT * FROM schedule WHERE team_id = $team_id ORDER BY schedule.at DESC")) {
	
	    while($row = $result->fetch_array(MYSQL_ASSOC)) {
		    	$row["id"] = intval($row["id"]);
		    	$row["team_id"] = intval($row["team_id"]);
	            $arr[] = $row;
	    }
	}

	echo json_encode($arr);
?>