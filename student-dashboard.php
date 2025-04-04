<?php
// Start session
session_start();

// Check if the logout query parameter is set
if (isset($_GET['logout']) && $_GET['logout'] == 'true') {
    // Unset all session variables
    $_SESSION = array();

    // Destroy the session
    session_destroy();

    // Redirect to the login page or home page
    header("Location: student-login.php"); // Replace "login.php" with your desired page
    exit();
}

// Check if user is logged in
if (!isset( $_SESSION['student_email'])) {
    header("Location: student-login.php");
    exit();
}

// Database connection
$conn = new mysqli('localhost', 'root', '', 'transcript_management');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch student data
$student_email = $_SESSION['student_email'];
$sql = "SELECT Student_ID, Email, password, first_name, middle_name, last_name, Department, Program, Admission_year, Phone, Address FROM students WHERE Email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $student_email);
$stmt->execute();
$result = $stmt->get_result();
$student = $result->fetch_assoc();

if (!$student) {
    echo "No student data found for Email: " . htmlspecialchars($student_email);
    exit();
}

$stmt->close();
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Material UI Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="profile-styles.css">
</head>

<body>
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary justify-space-between">
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
                        <a class="nav-link d-none" href="index.php">Logout</a>
                        <a class="nav-link" href="?logout=true">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Notification Alert -->
    <div id="login-alert" class="alert alert-success text-center" role="alert" style="display: none;">
        <p><strong>Welcome</strong> <?php echo htmlspecialchars($student['first_name']); ?></p>
    </div>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Student Profile</h1>
        </div>

        <!-- Profile Section -->
        <section class="mb-4">
            <h2>Personal Information</h2>
            <div class="card shadow-sm">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Name:</strong>
                                <?php echo htmlspecialchars($student['last_name'] ." ". $student['first_name']." ".$student['middle_name']); ?>
                            </p>
                            <p><strong>Matric Number:</strong> <?php echo htmlspecialchars($student['Student_ID']); ?>
                            </p>
                            <p><strong>Department:</strong> <?php echo htmlspecialchars($student['Department']); ?></p>
                            <p><strong>Admission Year:</strong>
                                <?php echo htmlspecialchars($student['Admission_year']); ?></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Program:</strong> <?php echo htmlspecialchars($student['Program']); ?></p>
                            <p><strong>Email:</strong> <?php echo htmlspecialchars($student['Email']); ?></p>
                            <p><strong>Phone:</strong> <?php echo htmlspecialchars($student['Phone']); ?></p>
                            <p><strong>Address:</strong> <?php echo htmlspecialchars($student['Address']); ?></p>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Transcript Section -->
        <section class="mb-4">
            <h2>Transcript</h2>
            <div class="card shadow-sm py-3">
                <div class="card-body justify-content-between py-2">
                    <a href="transcript-request.php"><button class="btn btn-primary btn-sm  py-2"
                            id="request-transcript">
                            Request Transcript
                        </button></a>


                    <a href="transcript-view.php"><button class="btn btn-success py-2 btn-sm" id="request-transcript">
                            View Transcript
                        </button></a>




                </div>
            </div>
        </section>

        <!-- QR Code Section -->
        <section class="d-none">
            <h2>Transcript Verification</h2>
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Scan to Verify</h5>
                    <canvas id="qr-code"></canvas>
                    <p class="text-muted">Use this QR code to verify the authenticity of the transcript.</p>
                </div>
            </div>
        </section>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- QR Code Generator -->
    <script src="https://cdn.jsdelivr.net/npm/qrcode/build/qrcode.min.js"></script>
    <script src="profile-script.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const loginAlert = document.getElementById('login-alert');
        loginAlert.style.display = 'block';
        setTimeout(() => {
            loginAlert.classList.add('fade-out');
        }, 3000);
        setTimeout(() => {
            loginAlert.style.display = 'none';
        }, 6000);

        // Example logic for transcript status
        const transcriptStatus = document.getElementById('transcript-status').innerText;
        if (transcriptStatus === 'sent') {
            document.getElementById('download-transcript').style.display = 'block';
        }

        // Request transcript button logic
        document.getElementById('request-transcript').addEventListener('click', function() {
            // Logic to request transcript
            alert('Transcript requested successfully!');
            document.getElementById('transcript-status').innerText = 'requested';
        });
    });
    </script>
    <style>
    #login-alert {
        position: fixed;
        top: 5%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1050;
        font-size: 1.25rem;
        font-weight: bold;
    }

    .fade-out {
        transition: opacity 3s;
        opacity: 0;
    }

    .container {
        max-width: 800px;
    }

    .card {
        margin-bottom: 20px;
    }

    .card.shadow-sm {
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
    }

    .card-body {
        padding: 1.5rem;
    }

    .card-title {
        font-size: 1.25rem;
        margin-bottom: 1rem;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }

    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-success:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }
    </style>
</body>

</html>