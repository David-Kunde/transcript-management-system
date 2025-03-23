<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Transcript System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Georgia', serif;
        color: #fff;
        margin: 0;
        padding: 0;
        position: relative;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('https://www.collegemagazine.com/wp-content/uploads/2022/02/alfons-morales-YLSwjSy7stw-unsplash-1024x601.jpg') no-repeat center center/cover;
        filter: brightness(0.15);
        /* Darken the background image */
        z-index: -1;
    }

    .header {
        background: rgba(0, 0, 0, 0.7);
        padding: 1rem 0;
    }

    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
    }

    .hero {
        text-align: center;
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding: 2rem;
    }

    .hero h1 {
        font-size: 2.5rem;
        margin-bottom: 1rem;
        font-weight: bold;
    }

    .hero p {
        font-size: 1.2rem;
        margin-bottom: 2rem;
        max-width: 600px;
        line-height: 1.6;
    }

    .btn-primary {
        background-color: #0056b3;
        border-color: #004080;
        padding: 0.75rem 2rem;
        font-size: 1.1rem;
    }

    .btn-primary:hover {
        background-color: #004080;
        border-color: #003366;
    }

    .footer {
        background: rgba(0, 0, 0, 0.7);
        padding: 1rem 0;
        text-align: center;
        width: 100%;
    }

    .footer a {
        color: #fff;
        text-decoration: underline;
    }

    .profile-image-pic {
        height: 150px;
        width: 150px;
        object-fit: cover;
        border-radius: 50%;
        border: 3px solid #fff;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .hero h1 {
            font-size: 2rem;
        }

        .hero p {
            font-size: 1rem;
        }

        .navbar-brand {
            font-size: 1.2rem;
        }

        .profile-image-pic {
            height: 120px;
            width: 120px;
        }
    }

    @media (max-width: 576px) {
        .hero h1 {
            font-size: 1.5rem;
        }

        .hero p {
            font-size: 0.9rem;
        }

        .navbar-brand {
            font-size: 1rem;
        }

        .profile-image-pic {
            height: 100px;
            width: 100px;
        }
    }
    </style>
</head>

<body>
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand px-4" href="index.php">
                    Benue State University, Makurdi
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav ms-auto mx-4">
                        <li class="nav-item d-none">
                            <a class="nav-link" href="student-login.php">Student</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin-login.php">Admin Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="hero">
        <div class="text-center">
            <img src="assets/images/bsuLogo.jpg" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                alt="profile">
        </div>
        <h1>Welcome to Department of Mathematics and Computer Science Transcript System</h1>
        <p>Effortlessly access and manage your academic records with our state‑of‑the‑art transcript system.</p>
        <div class="mt-2">
            <a href="student-login.php" class="btn btn-primary btn-lg">Login</a>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Benue State University, Makurdi. All Rights Reserved</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>