<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-learning</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<body>

    <!-- Page Content -->
    <main>

        <div id="formContainer" class="mx-auto">

            <ul class=" nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="signin-tab" data-bs-toggle="tab" data-bs-target="#signin"
                        type="button" role="tab" aria-controls="signin" aria-selected="true">Sign in</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="signup-tab" data-bs-toggle="tab" data-bs-target="#signup" type="button"
                        role="tab" aria-controls="signup" aria-selected="false">Create
                        account</button>
                </li>
                </u>
                <div class="pt-4 tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">

                        <form id="form_sign_in" onsubmit="return false">

                            <label for="user_email2">Email</label>
                            <input name="user_email2" type="email" data-validate="email" placeholder="Enter email"
                                data-min="2" data-max="50">

                            <label for="user_password2">Password</label>
                            <input name="user_password2" required type="password" data-validate="str"
                                placeholder="Enter Password" data-min="2" data-max="30">


                            <button class="w-100 mt-3 mb-3" onclick="login()"> Sign in
                            </button>
                        </form>
                        <div>
                            <p id="feedback_login" class="p-2 mt-4 text-center d-block ">
                            </p>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                        <form id="form_sign_up" onsubmit="return false">
                            <label for="first_name">First Name</label>
                            <input name="first_name" data-validate="str" data-min="5" data-max="30">
                            <label for="last_name">Last Name</label>
                            <input name="last_name" data-validate="str" data-min="3" data-max="50">
                            <label for="user_email">Email</label>
                            <input name="user_email" type="email" data-validate="email" placeholder="Enter email"
                                data-min="5" data-max="30">
                            <label for="user_password">Password</label>
                            <input name="user_password" required type="password" data-validate="str"
                                placeholder="Create password" data-min="3" data-max="30">

                            <em class="password_req"> Use at least 3 characters</em>
                            <button class="w-100 mt-3 mb-3" onclick="signup()"> Submit </button>
                        </form>
                        <div class="feedback_container">
                            <p id="feedback_signup" class="text-center d-block">
                            </p>
                        </div>
                        <div class="modal-footer modal_info justify-content-center d-flex">
                            <em>By submitting, I accept the terms
                                of use.</em>
                        </div>
                    </div>
                </div>
        </div>

    </main>


    <!-- Footer Content -->
    <footer>
        <p>&copy; Database Exam - Web Development KEA 2021</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


    <script src="components/validator.js"></script>
    <script src="app.js"></script>