<?php
	require_once("init.php");
	
	$arr = [];
	if ($result = $conn->query("SELECT id, coach_id, name FROM teams LEFT JOIN parents_teams ON team_id = id WHERE parent_id = $user_id")) {
	
	    while($row = $result->fetch_array(MYSQL_ASSOC)) {
		    	$row["id"] = intval($row["id"]);
		    	$row["coach_id"] = intval($row["coach_id"]);
	            $arr[] = $row;
	    }
	}

	echo json_encode($arr);
?>