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
                include __DIR__ . "/apis/api-collect-chapters.php";


                foreach ($chapters as $chapter) {
                    echo "
    <div class='col'>
        <div class='card shadow-sm'>

            <div class='card-body'>
            <h2>Topic: {$chapter->id}</h2>
                <p class='card-text'>{$chapter->chapter_title}</p>
                <div class='type-indicator'>";


                    if ($chapter->content_reading == 1) {
                        echo "<i class='bi bi-file-earmark-richtext'></i>";
                    }
                    if ($chapter->content_video == 1) {
                        echo "<i class='bi bi-file-play'></i>";
                    }
                    if ($chapter->content_assignment == 1) {
                        echo "<i class='bi bi-hourglass-split'></i>";
                    }



                    echo "</div>
                    <div class='d-flex justify-content-between align-items-center'>
                        <div class='btn-group'>
                            <button type='button' class='btn btn-sm btn-primary'>Begin</button>
                        </div>
    
                        <small class='text-muted'>{$chapter->required_time} mins</small>
                    </div>
                </div>
            </div>
        </div>";
                } ?>


            </div>
        </section>


</main>



<!-- Footer Content -->
<?php
include __DIR__ . "/components/footer.php"; ?>