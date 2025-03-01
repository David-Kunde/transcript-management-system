<?php
$error = '';
$success = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST['firstName'];
    $surname = $_POST['surname'];
    $middleName = $_POST['middleName'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $matricNumber = $_POST['matricNumber'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'transcript_management');

    // Check connection
    if ($conn->connect_error) {
        $error = "Connection failed: " . $conn->connect_error;
    } else {
        // Check if user already exists
        $checkUserSql = "SELECT * FROM users WHERE Email = ?";
        $checkStmt = $conn->prepare($checkUserSql);
        $checkStmt->bind_param("s", $email);
        $checkStmt->execute();
        $result = $checkStmt->get_result();

        if ($result->num_rows > 0) {
            $error = "User already registered. If you forgot your password, <a href='forgot_password.php'>reset it here</a>.";
        } else {
            // Insert data into the users table
            $sql = "INSERT INTO users (First_Name, Middle_Name, Last_Name, Email, Phone_Number, Password_Hash) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssss", $firstName, $middleName, $surname, $email, $phone, $password);

            if ($stmt->execute()) {
                $success = "Account created successfully. <br> Login <a href='login.php'>here</a>";
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
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center text-dark mt-5">Sign Up</h2>
                <div class="text-center mb-5 text-dark d-none">Made with bootstrap</div>
                <div class="card my-5">

                    <form class="card-body cardbody-color p-lg-5" method="POST" action="signup.php">

                        <div class="text-center">
                            <img src="assets/images/bsuLogo.jpg"
                                class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3" alt="profile">
                        </div>

                        <div class="mb-3">
                            <input type="text" class="form-control" id="firstName" name="firstName"
                                placeholder="First Name">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="surname" name="surname" placeholder="Surname">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="middleName" name="middleName"
                                placeholder="Middle Name">
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="University Email Address">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="matricNumber" name="matricNumber"
                                placeholder="Matric Number">
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Password">
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
                        <div class="text-center"><button type="submit" class="btn btn-color px-5 mb-5 w-100">Sign
                                Up</button></div>
                        <div id="emailHelp" class="form-text text-center mb-5 text-dark">Already Registered? <a
                                href="login.php" class="text-dark fw-bold"> Login Here</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

</body>

</html>