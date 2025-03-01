<?php
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
        // Check if user is registered
        $sql = "SELECT Email, Password_Hash, UserType FROM users WHERE Email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            // Verify password
            if (password_verify($password, $user['Password_Hash'])) {
                // Check user type and redirect accordingly
                if ($user['UserType'] == 'student') {
                    header("Location: student-dashboard.php");
                } elseif ($user['UserType'] == 'admin') {
                    header("Location: admin.php");
                }
                exit();
            } else {
                $error = "Incorrect password. If you forgot your password, <a href='forgot_password.php'>reset it here</a>.";
            }
        } else {
            $error = "User not registered. <a href='signup.php'>Create an account</a> or <a href='forgot_password.php'>reset your password</a>.";
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
        width: 150px;
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
                        <a class="nav-link" href="signup.php">Sign up</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center text-dark mt-5">Login</h2>
                <div class="text-center mb-5 text-dark d-none">Made with bootstrap</div>
                <div class="card my-5">

                    <form class="card-body cardbody-color p-lg-5" method="POST" action="login.php">

                        <div class="text-center">
                            <img src="assets/images/bsuLogo.jpg"
                                class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3" alt="profile">
                        </div>

                        <?php if ($error): ?>
                        <div class="alert alert-danger" role="alert">
                            <?php echo $error; ?>
                        </div>
                        <?php endif; ?>

                        <div class="mb-3">
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="Enter your email address">
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Password">
                        </div>
                        <div class="text-center"><button type="submit"
                                class="btn btn-color px-5 mb-3 w-100">Login</button></div>
                        <div class="text-center mb-3"><a href="forgot_password.php" class="text-dark fw-bold">Forgot
                                Password?</a></div>
                        <div id="emailHelp" class="form-text text-center mb-5 text-dark">Not
                            Registered? <a href="signup.php" class="text-dark fw-bold"> Create an
                                Account</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

</body>

</html>