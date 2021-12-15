<?php
require_once(__DIR__ . "/globals.php");
session_start();

try {
    $user_id = $_SESSION['user_id'];

    $db->beginTransaction();
    // Enrolled_courses on current user gets a + 1
    $q = $db->prepare('UPDATE students SET courses_enrolled = courses_enrolled + 1 WHERE id = :id');
    $q->bindValue(':id', $user_id);
    $q->execute();

    //Variables for Enrollment Table
    $course_id = $_GET['id'];;
    $created_date = date("Y-m-d H:i:s");

    //Insert data into Enrollment Table
    $q = $db->prepare('INSERT INTO public.enrollment VALUES( :course_id, :student_id, :enrollment_date )');
    $q->bindValue(":course_id", $course_id);
    $q->bindValue(":student_id",  $user_id);
    $q->bindValue(":enrollment_date", $created_date);
    $q->execute();

    $db->commit();
    $param = $_SESSION["current_course_id"];
    header("Location: ../chapters?id=$param");
} catch (PDOException $ex) {

    $db->rollBack();
    echo json_encode($ex);
    send_500('Enrollment failed');
}