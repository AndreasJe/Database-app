<!-- Title, language, session_start and header defined -->
<?php
$_title = 'Home';
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: index');
    exit();
}
include __DIR__ . "/components/header.php";
?>

<!-- Page Content -->
<main>

    <h2>Welcome</h2>


</main>



<!-- Footer Content -->
<?php
include __DIR__ . "/components/footer.php"; ?>