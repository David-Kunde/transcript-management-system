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
                        <a class="nav-link" href="index.php">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Notification Alert -->
    <div id="login-alert" class="alert alert-success text-center" role="alert" style="display: none;">
        <strong>Logged in successfully!</strong>
    </div>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Student Profile</h1>
        </div>

        <!-- Profile Section -->
        <section class="mb-4">
            <h2>Personal Information</h2>
            <div class="card">
                <div class="card-body">
                    <p><strong>Name:</strong> John Doe</p>
                    <p><strong>Matric Number:</strong> S12345678</p>
                    <p><strong>Department:</strong> Computer Science</p>
                    <p><strong>Admission Year:</strong> 2020</p>
                    <p><strong>Program:</strong> B.Sc. Computer Science</p>
                    <p><strong>Email:</strong> john.doe@example.com</p>
                    <p><strong>Phone:</strong> +1234567890</p>
                    <p><strong>Address:</strong> 123 Main St, City, Country</p>
                    <p><strong>Status:</strong> Active</p>
                </div>
            </div>
        </section>

        <!-- Transcript Section -->
        <section class="mb-4">
            <h2>Transcript</h2>
            <button class="btn btn-primary" id="download-transcript">
                <span class="material-icons">download</span>
                Download Transcript
            </button>
        </section>

        <!-- QR Code Section -->
        <section>
            <h2>Transcript Verification</h2>
            <div class="card">
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
    </style>
</body>

</html>