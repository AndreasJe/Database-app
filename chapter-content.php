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
    <div class="container-fluid d-flex justify-content-center">

        <section class="py-5 text-center container">
            <h1>
                Select a chapter
            </h1>

            <div class="p-5"></div>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


                <?php
                // Showing products from database.
                include __DIR__ . "/apis/api-collect-chapter_content.php";


                foreach ($contents as $content) {
                    echo "
                    ";
                } ?>


            </div>
        </section>


</main>



<!-- Footer Content -->
<?php
include __DIR__ . "/components/footer.php"; ?>