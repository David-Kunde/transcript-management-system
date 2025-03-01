<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script defer src="bootstrap/bootstrap.bundle.min.js"></script>

    <style>
    .btn-color {
        background-color: #0e1c36;
        color: #fff;
    }

    .profile-image-pic {
        height: 150px;
        /* Adjusted height */
        width: 150px;
        /* Adjusted width */
        object-fit: cover;
    }

    .cardbody-color {
        background-color: #ebf2fa;
    }

    a {
        text-decoration: none;
    }
    </style>
</head>

<body>
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-space-between">
            <a class="navbar-brand px-4" href="index.php">
                Benue State University, Makurdi
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse align-items-center" id="navbarNavDropdown">
                <ul class="navbar-nav ms-auto mx-4">
                    <li class="nav-item">
                        <a class="nav-link" href="login.php">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.php">Sign up</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center text-dark mt-5">Forgot Password</h2>
                <div class="text-center mb-5 text-dark d-none">Made with bootstrap</div>
                <div class="card my-5">

                    <form class="card-body cardbody-color p-lg-5">

                        <div class="text-center">
                            <img src="assets/images/bsuLogo.jpg"
                                class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3" alt="profile">
                        </div>

                        <div class="mb-3">
                            <input type="email" class="form-control" id="email" placeholder="Registered Email Address">
                        </div>
                        <div class="text-center"><button type="submit" class="btn btn-color px-5 mb-5 w-100">Request New
                                Password</button></div>
                        <div id="emailHelp" class="form-text text-center mb-5 text-dark">Remembered your password? <a
                                href="login.php" class="text-dark fw-bold"> Login Here</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

</body>

</html>