<?php
	require_once("init.php");

	
	$player_id = $_GET["player_id"];
	$player_id = $conn->escape_string($player_id);
	
	$arr = [];
	if ($result = $conn->query("SELECT id, fname, lname, phone, email FROM parents LEFT JOIN players_parents ON id = parent_id WHERE player_id = $player_id")) {
	
	    while($row = $result->fetch_array(MYSQL_ASSOC)) {
		    	$row["id"] = intval($row["id"]);
	            $arr[] = $row;
	    }
	}
	
	$result = $conn->query("SELECT fname, lname, photo FROM players LEFT JOIN teams_players ON player_id = id WHERE id = $player_id AND team_id = $team_id");
	$player = $result->fetch_assoc();
	if (!$player) {
		echo json_encode(["error" => "not authorized."]);
		die();
	}

	echo json_encode(["player" => $player, "parents" => $arr]);
?>