<?php
	session_start();
	
	$override_userid = 1;
	
	if(!$override_userid && !$_SESSION["user_id"]) {
		echo json_encode(["error"=>"not authorized."]);
		die();
	}
	
	$user_id = $override_userid || $_SESSION["user_id"];
	
	if(isset($_GET["team_id"])) {
		$team_id = $_GET["team_id"];
		$team_id = $conn->escape_string($team_id);
		
		$result = $conn->query("SELECT * FROM parents_teams WHERE parent_id = $user_id AND team_id = $team_id");
		if($row = $result->fetch_array(MYSQL_ASSOC)) {
			// has authorization for this team_id
		} else {
			die();
		}
	}