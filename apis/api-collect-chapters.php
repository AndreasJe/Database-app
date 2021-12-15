<?php
require_once(__DIR__ . "/globals.php");

$id = $_GET['id'];
$_SESSION['current_course_id'] = $id;

// Getting all objects from items column
try {



    $q = $db->prepare('	SELECT *
    FROM course_chapter
WHERE course_chapter.course_id = :number;');
    $q->bindValue(':number', $id);
    $q->execute();
    $chapters = $q->fetchAll(PDO::FETCH_OBJ);
} catch (Exception $ex) {
    send_500('Database failed - System under maintainance');
    echo json_encode($ex);
}




// $q = $db->prepare('	SELECT *
// FROM course
// NATURAL JOIN course_chapter
// WHERE course.id = :number AND course_chapter.course_id = :number;');