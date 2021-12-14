<?php

require_once(__DIR__ . "../globals.php");


// Validate email
if (!filter_var($_POST['user_email'], FILTER_VALIDATE_EMAIL)) {
  send_400('Please enter a valid email');
  exit();
}

// Validate password
if (!isset($_POST['user_password'])) {
  send_400('We need your password to create a user for you!');
  exit();
}
if (strlen($_POST['user_password']) < 3) {
  send_400('Password has to be a minimum of 3 characters');
  exit();
}
if (strlen($_POST['user_password']) > 22) {
  send_400('Password cant exceed 22 characters');
  exit();
}

//Executing Content
try {
  $password = $_POST['user_password'];
  $email = $_POST['user_email'];
  $hashed_password = password_hash($password, PASSWORD_DEFAULT);
  $created_date = date("Y-m-d H:i:s");
  // Insert data in the Database
  $q = $db->prepare('INSERT INTO public.students VALUES(:first_name, :last_name, :email, :password, :courses_enrolled, :courses_complete, :verified, :registration_date  )');
  $q->bindValue(":first_name", null);
  $q->bindValue(":last_name",  null);
  $q->bindValue(":email", $email);
  $q->bindValue(":password", $hashed_password);
  $q->bindValue(":courses_enrolled",  0);
  $q->bindValue(":courses_complete",  0);
  $q->bindValue(":verified", 0);
  $q->bindValue(":registration_date", $created_date);
  $q->execute();
  send_200('User has been created');
  $user_id = $db->lastInsertId();
} catch (Exception $ex) {
  send_500($ex);
  exit();
}