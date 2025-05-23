<?php
$error = '';
$success = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $matricNumber = $_POST['matricNumber'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'transcript_management');

    // Check connection
    if ($conn->connect_error) {
        $error = "Connection failed: " . $conn->connect_error;
    } else {
        // Check if user already exists
        $checkUserSql = "SELECT * FROM students WHERE email = ?";
        $checkStmt = $conn->prepare($checkUserSql);
        $checkStmt->bind_param("s", $email);
        $checkStmt->execute();
        $result = $checkStmt->get_result();

        if ($result->num_rows > 0) {
            $error = "User already registered. If you forgot your password, <a href='forgot_password.php' class='text-light'>reset it here</a>.";
        } else {
            // Insert data into the users table
            $sql = "INSERT INTO students (First_Name, Middle_Name, Last_Name, Email, Phone_Number, Password_Hash) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssss", $firstName, $middleName, $surname, $email, $phone, $password);

            if ($stmt->execute()) {
                $success = "Account created successfully. <br> Login <a href='login.php' class='text-light'>here</a>";
            } else {
                $error = "Error: " . $sql . "<br>" . $conn->error;
            }

            $stmt->close();
        }

        $checkStmt->close();
        $conn->close();
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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

    .alert-success {
        background: rgba(0, 255, 0, 0.2);
        border: none;
        color: #6bff6b;
    }

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
                        <li class="nav-item">
                            <a class="nav-link" href="login.php">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center text-light mt-5">Sign Up</h2>
                <div class="card my-3">
                    <form class="card-body cardbody-color p-lg-5" method="POST" action="signup.php">
                        <div class="text-center">
                            <img src="assets/images/bsuLogo.jpg"
                                class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3" alt="profile">
                        </div>

                        <?php if ($error): ?>
                        <div class="alert alert-danger" role="alert">
                            <?php echo $error; ?>
                        </div>
                        <?php endif; ?>
                        <?php if ($success): ?>
                        <div class="alert alert-success" role="alert">
                            <?php echo $success; ?>
                        </div>
                        <?php endif; ?>

                        <div class="mb-3">
                            <input type="text" class="form-control" id="firstName" name="firstName"
                                placeholder="First Name" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="surname" name="surname" placeholder="Surname"
                                required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="middleName" name="middleName"
                                placeholder="Middle Name">
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="University Email Address" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number"
                                required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="matricNumber" name="matricNumber"
                                placeholder="Matric Number" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-color px-5 mb-3 w-100">Sign Up</button>
                        </div>
                        <div id="emailHelp" class="form-text text-center mb-5 text-light">
                            Already Registered? <a href="student-login.php" class="text-light fw-bold">Login Here</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>