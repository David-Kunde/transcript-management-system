<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Transcript System</title>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script defer src="bootstrap/bootstrap.bundle.min.js"></script>
    <style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        color: #fff;
    }

    .header {
        background: rgba(0, 0, 0, 0.8);
    }

    .hero {
        text-align: center;
        /* Reduced margin-top */
    }

    .hero h1 {
        font-size: 3rem;
        margin-bottom: 1rem;
    }

    .hero p {
        font-size: 1.2rem;
        margin-bottom: 2rem;
    }

    .footer {
        background: rgba(0, 0, 0, 0.8);
        padding: 1rem 0;
        text-align: center;
    }

    .footer a {
        color: #fff;
        text-decoration: underline;
    }

    .profile-image-pic {
        height: 150px;
        /* Adjusted height */
        width: 150px;
        /* Adjusted width */
        object-fit: cover;
        border-radius: 50%;
        /* Make it round */
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

    <div class="container d-flex justify-content-center align-items-center vh-100 mt-1">
        <div class="hero">
            <div class="text-center">
                <img src="assets/images/bsuLogo.jpg"
                    class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3" alt="profile">
            </div>
            <h1>Welcome to Department of Mathematics and Computer Science Transcript System</h1>
            <p>Effortlessly access and manage your academic records.</p>
            <div class="mt-4">
                <a href="login.php" class="btn btn-primary btn-lg">Get Started</a>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Benue State University, Makurdi. All Rights Reserved</p>
        </div>
    </footer>
</body>

</html>