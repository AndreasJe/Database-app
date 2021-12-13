<?php

require_once(__DIR__ . "/globals.php");


// Validate email
if (!filter_var($_POST['user_email2'], FILTER_VALIDATE_EMAIL)) {
    send_400('We need a valid email to find your user. ');
    exit();
}


// Validate password
if (!isset($_POST['user_password2'])) {
    send_400('We need your password to create a user for you!');
    exit();
}
if (strlen($_POST['user_password2']) < 2) {
    send_400('Password has to be a minimum of 2 characters');
    exit();
}
if (strlen($_POST['user_password2']) > 22) {
    send_400('Password cant exceed 22 characters');
    exit();
}

//Executing Content
try {
    $q = $db->prepare('SELECT * FROM students WHERE email = :email');
    $q->bindValue(':email', $_POST['user_email2']);
    $q->execute();
    $row = $q->fetch();
    // If row is not empty - Continue. If empty do else )
    if (!empty($row)) {
        // Verify password input string with hashed password in database row.
        if (password_verify($_POST['user_password2'], $row['password'])) {

            //Start SESSION and assign values from database
            session_start();
            $_SESSION['user_verified'] = $row['verified'];
            $_SESSION['user_email'] = $row['email'];
            $_SESSION['user_password'] = $row['password'];
            $_SESSION['first_name'] = $row['first_name'];
            $_SESSION['last_name'] = $row['last_name'];
            $_SESSION['user_id'] = $row['id'];
            send_200('Welcome! You are now logged in');
        } else {
            send_400('Password is not valid');
        }
        // If $row is empty, the user doesn't exist.
    } else {
        send_400('This user does not exist');
    }
} catch (Exception $ex) {
    send_500('System under maintainance');
    echo "Speak to an adult";
}