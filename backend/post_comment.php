<?php
	
	require_once("init.php");
	
	$parent_id = 1;
	
	$message_id = $_GET["message_id"];
	$comment = $_GET["comment"];

	$team_id = $conn->escape_string($team_id);
	$message_id = $conn->escape_string($message_id);
	$comment = $conn->escape_string($comment);
	
	$result = $conn->query("INSERT INTO comments SET team_id = $team_id, parent_id = $parent_id, message_id = $message_id, comment = '$comment', created_at = NOW()");
	
	$comment_id = $conn->insert_id;
	
	$result = $conn->query("SELECT comments.*, parents.fname, parents.lname FROM comments LEFT JOIN parents ON parents.id = comments.parent_id WHERE comments.id = $comment_id");
	
	$comment = $result->fetch_assoc();
	
	echo json_encode($comment);
	
?>