<?php
require_once(__DIR__ . "/globals.php");

$q = $db->prepare('SELECT * FROM course NATURAL JOIN instructor WHERE id = :instructor_id ');
$q->bindValue(':instructor_id', $instructor_id);
$q->execute();
$instructors = $q->fetchAll(PDO::FETCH_OBJ);