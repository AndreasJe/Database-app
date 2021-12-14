<?php
$db = new PDO("pgsql:host=localhost;dbname=exam", "postgres", "22486050");

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