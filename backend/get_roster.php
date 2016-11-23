<?php
	require_once("init.php");
	
	$arr = [];
	if ($result = $conn->query("SELECT id, fname, lname, photo, player_number FROM players LEFT JOIN teams_players ON id = player_id WHERE team_id = $team_id")) {
	
	    while($row = $result->fetch_array(MYSQL_ASSOC)) {
		    	$row["id"] = intval($row["id"]);
		    	$row["player_number"] = intval($row["player_number"]);
	            $arr[] = $row;
	    }
	}
	
	$result = $conn->query("SELECT * FROM teams WHERE id = $team_id");
	$row = $result->fetch_array(MYSQL_ASSOC);
	

	echo json_encode(["roster" => $arr, "team" => $row]);
?>