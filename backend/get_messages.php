<?php
	require_once("init.php");
	
	$arr = array();
	if ($result = $conn->query("SELECT messages.id, parent_id, fname, lname, message, created_at FROM messages LEFT JOIN parents ON parents.id = messages.parent_id WHERE team_id = $team_id ORDER BY messages.created_at DESC")) {
	
	    while($row = $result->fetch_array(MYSQL_ASSOC)) {
		    	$row["id"] = intval($row["id"]);
		    	$id = $row["id"];
		    	
		    	$comments = [];
		    	if ($res = $conn->query("SELECT comments.*, parents.fname, parents.lname FROM comments LEFT JOIN parents ON parents.id = comments.parent_id WHERE team_id = $team_id AND message_id = $id ORDER BY comments.created_at ASC")) {
			    	while($r = $res->fetch_array(MYSQL_ASSOC)) {
				    	$r["id"] = intval($r["id"]);
				    	$comments[] = $r;
				    }
			    }
			    
			    $row["comments"] = $comments;
	            $arr[] = $row;
	            
	    }
	}

	echo json_encode($arr);
?>