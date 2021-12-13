<?php

// $host = 'localhost';
// $db   = 'elearning';
// $user = 'postgres';
// $pass = '22486050';
// $charset = 'utf8mb4';

// $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
// $options = [
//   PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
//   PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
//   PDO::ATTR_EMULATE_PREPARES   => false,
// ];
// try {
//   $pdo = new PDO($dsn, $user, $pass, $options);
// } catch (\PDOException $e) {
//   throw new \PDOException($e->getMessage(), (int)$e->getCode());
// }

$db = new PDO("pgsql:host=localhost;dbname=elearning", "postgres", "22486050");

//Response 500 means server error
function send_500($error_message)
{
  header('Content-Type: application/json');
  http_response_code(500);
  $response = ["Error" => $error_message];
  echo json_encode($response);
}

//Response 400 means Client error
function send_400($error_message)
{
  header('Content-Type: application/json');
  http_response_code(400);
  $response = ["Error" => $error_message];
  echo json_encode($response);
  exit();
}

//Response 400 means OK error
function send_200($error_message)
{
  header('Content-Type: application/json');
  http_response_code(200);
  $response = ["Info" => $error_message];
  echo json_encode($response);
  exit();
}