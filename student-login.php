<?php
// Start session
session_start();

$error = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'transcript_management');

    // Check connection
    if ($conn->connect_error) {
        $error = "Connection failed: " . $conn->connect_error;
    } else {
        // Check if student is registered
        $sql = "SELECT Student_ID, Email, password FROM students WHERE Email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $student = $result->fetch_assoc();
            // Verify password
            if ($password == $student['password']) {
                // Set session variables
                $_SESSION['student_email'] = $student['Email'];
                $_SESSION['Student_ID'] = $student['Student_ID'];

                header("Location: student-dashboard.php");
                exit();
            } else {
                $error = "Incorrect password";
            }
        } else {
            $error = "Student not registered on the transcript system";
        }

        $stmt->close();
        $conn->close();
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        filter: brightness(0.2);
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

    .card {
        background: rgba(255, 255, 255, 0.1);
        /* Slightly transparent white background */
        border: none;
        border-radius: 10px;
    }

    .cardbody-color {
        background: transparent;
    }

    .btn-color {
        background-color: #0056b3;
        border-color: #004080;
        color: #fff;
    }

    .btn-color:hover {
        background-color: #004080;
        border-color: #003366;
    }

    .profile-image-pic {
        height: 150px;
        width: 150px;
        object-fit: cover;
        border-radius: 50%;
        border: 3px solid #fff;
    }

    .form-control {
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.3);
        color: #fff;
    }

    .form-control::placeholder {
        color: rgba(255, 255, 255, 0.7);
        /* Light placeholder text */
    }

    .form-control:focus {
        background: rgba(255, 255, 255, 0.2);
        border-color: rgba(255, 255, 255, 0.5);
        color: #fff;
    }

    .text-dark {
        color: #fff !important;
    }

    .alert-danger {
        background: rgba(255, 0, 0, 0.2);
        border: none;
        color: #ff6b6b;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .navbar-brand {
            font-size: 1.2rem;
        }

        .profile-image-pic {
            height: 120px;
            width: 120px;
        }
    }

    @media (max-width: 576px) {
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
    <header class="header d-lg-none">
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
                            <a class="nav-link" href="signup.php">Sign up</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center text-light mt-5">Student Login</h2>
                <div class="card my-3">
                    <form class="card-body cardbody-color p-lg-5" method="POST">
                        <div class="text-center"><a href="index.php">
                                <img src="assets/images/bsuLogo.jpg"
                                    class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                                    alt="profile"></a>
                        </div>

                        <?php if ($error): ?>
                        <div class="alert alert-danger text-center" role="alert">
                            <?php echo $error; ?>
                        </div>
                        <?php endif; ?>

                        <div class="mb-3">
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="Enter your email address" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-color px-5 mb-3 w-100">Login</button>
                        </div>
                        <div class="text-center mb-3">
                            <p class="text-light fw-bold">Forgot Password? <a href="forgot-password.php "
                                    class="text-light fw-bold ps-1">Reset here</a>
                            </p>

                        </div>
                        <div id="emailHelp" class="form-text text-center mb-5 text-light d-none">
                            Not Registered? <a href="signup.php" class="text-light fw-bold">Register here</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>