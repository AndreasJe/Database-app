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
        <?php
        // Showing products from database.
        include __DIR__ . "/apis/api-collect-courses.php";

        foreach ($courses as $course) {
            echo "<div class='card w-50 align-self-center'>
            <h5 class='card-header'>Featured</h5>
            <div class='card-body'>
                <h5 class='card-title'>{$course->course_title}</h5>
                <p class='card-text'>{$course->course_brief}</p>
                <em class='card-subtext'>Number of chapters: {$course->num_of_chapters}</em>
                <em class='card-subtext'>Instructor: {$course->instructor_first_name} {$course->instructor_last_name}</em>
                <em class='card-subtext'>";

            $time = new DateTime($course->created_log);
            $now = new DateTime();
            $interval = $time->diff($now, true);

            if ($interval->y) echo $interval->y . ' years ago';
            elseif ($interval->m) echo ' Created: ' . $interval->m . ' months ago';
            elseif ($interval->d) echo ' Created: ' . $interval->d . ' days ago';
            elseif ($interval->h) echo ' Created: ' . $interval->h . ' hours ago';
            elseif ($interval->i) echo ' Created: ' . $interval->i . ' minutes ago';
            else echo " Submitted: less than 1 minute ago";

            echo "</em>
                <em class='card-subtext'>";

            $time2 = new DateTime($course->updated_log);
            $now2 = new DateTime();
            $interval2 = $time->diff($now, true);

            if ($interval2->y) echo $interval2->y . ' years ago';
            elseif ($interval2->m) echo ' Updated: ' . $interval2->m . ' months ago';
            elseif ($interval2->d) echo ' Updated: ' . $interval2->d . ' days ago';
            elseif ($interval2->h) echo ' Updated: ' . $interval2->h . ' hours ago';
            elseif ($interval2->i) echo ' Updated: ' . $interval2->i . ' minutes ago';
            else echo " Submitted: less than 1 minute ago";

            echo "</em>
                <a href='apis/api-enrollment?id={$course->id}' class='m-3 btn btn-success'  >Enroll in course</a>
                <a  href='chapters?id={$course->id}' class='m-3 btn btn-secondary'>Preview</a>
            </div>
            
            <em id='feedback-enroll'></em>
        </div>";
        } ?>
    </div>

</main>

<iframe style="display:none;" name="target"></iframe>

<!-- Footer Content -->
<?php
include __DIR__ . "/components/footer.php"; ?>