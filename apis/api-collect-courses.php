<?php
require_once(__DIR__ . "/globals.php");

// Getting all objects from items column
try {
    $q = $db->prepare('	SELECT *
    FROM course
    FULL JOIN instructor
    ON course.id = instructor.id;');
    $q->execute();
    $courses = $q->fetchAll(PDO::FETCH_OBJ);
} catch (Exception $ex) {
    send_500('Database failed - System under maintainance');
    echo json_encode($ex);
}