<?php
// Error reporting for development (remove in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "transcript_management";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Initialize variables for messages
$alertMessage = "";
$alertType = "success"; // Default to success, change to "danger" for errors

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Capture form data
    $matric_number = trim($_POST['studentID']);
    $email = trim($_POST['studentEmail']);
    $delivery_method = trim($_POST['deliveryType']);

    // Validate input
    if (empty($matric_number) || empty($email) || empty($delivery_method)) {
        $alertMessage = "All fields are required.";
        $alertType = "danger";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $alertMessage = "Invalid email format.";
        $alertType = "danger";
    } else {
        // Check if the student has submitted a request before
        $check_sql = "SELECT * FROM transcript_requests WHERE matric_number = ?";
        $check_stmt = $conn->prepare($check_sql);
        if (!$check_stmt) {
            die("SQL Error: " . $conn->error);
        }
        $check_stmt->bind_param('s', $matric_number);
        $check_stmt->execute();
        $check_result = $check_stmt->get_result();

        if ($check_result->num_rows > 0) {
            // Student has submitted a request before
            $alertMessage = "You have already submitted a transcript request. Please check your email for updates.";
            $alertType = "warning";
        } else {
            // Generate a unique request ID
            $request_id = "REQ-" . date("Ymd-His");

            // Prepare SQL statement to insert new request
            $insert_sql = "INSERT INTO transcript_requests 
                           (request_ID, matric_number, email, status, date_requested, date_processed, admin_ID, delivery_method, notes) 
                           VALUES (?, ?, ?, 'Pending', NOW(), NULL, NULL, ?, 'Request submitted successfully')";
            $insert_stmt = $conn->prepare($insert_sql);
            if (!$insert_stmt) {
                die("SQL Error: " . $conn->error);
            }

            // Bind parameters
            $insert_stmt->bind_param('ssss', $request_id, $matric_number, $email, $delivery_method);

            // Execute statement
            if ($insert_stmt->execute()) {
                $alertMessage = "Transcript request submitted successfully!";
                $alertType = "success";
            } else {
                $alertMessage = "Error: " . $insert_stmt->error;
                $alertType = "danger";
            }

            // Close statement
            $insert_stmt->close();
        }

        // Close check statement
        $check_stmt->close();
    }
}

// Close database connection
$conn->close();
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transcript Request Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material UI Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .form-section {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .form-section:hover {
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
    }

    .status-section {
        background: white;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        border-left: 5px solid #17a2b8;
    }

    .btn-custom {
        background-color: #4caf50;
        color: white;
        border-radius: 6px;
        padding: 10px 20px;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #45a049;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .header-section {
        text-align: center;
        padding: 20px 0;
        margin-bottom: 30px;
        background: linear-gradient(135deg, #4caf50 0%, #2e7d32 100%);
        color: white;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .header-section h1 {
        font-weight: 700;
        margin: 0;
    }

    .header-section p {
        opacity: 0.9;
        margin-top: 10px;
    }

    .form-control,
    .form-check-input {
        border-radius: 6px;
    }

    .form-control:focus {
        border-color: #4caf50;
        box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25);
    }

    .form-check-input:checked {
        background-color: #4caf50;
        border-color: #4caf50;
    }

    .form-section h4 {
        border-bottom: 2px solid #f0f0f0;
        padding-bottom: 15px;
        margin-bottom: 25px;
        color: #333;
    }

    .delivery-option {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .delivery-option:hover {
        border-color: #4caf50;
        background-color: #f9fff9;
    }

    .delivery-option.selected {
        border-color: #4caf50;
        background-color: #f0f9f0;
    }

    .icon-container {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: #e9f7e9;
        color: #4caf50;
        margin-right: 15px;
    }

    @media (max-width: 767px) {
        .container {
            width: 95% !important;
        }
    }

    /* Animation for new elements */
    .fade-in {
        animation: fadeIn 0.5s ease-in;
    }

    @keyframes fadeIn {
        0% {
            opacity: 0;
        }

        100% {
            opacity: 1;
        }
    }
    </style>
</head>

<body>
    <div class="container my-5" style="max-width: 800px;">
        <!-- Header -->
        <div class="header-section animate__animated animate__fadeIn">
            <h1><i class="material-icons">school</i> Transcript Request Portal</h1>
            <p>Request your academic transcript online</p>
        </div>

        <!-- Alert Messages -->
        <?php if (!empty($alertMessage)): ?>
        <div class="alert alert-<?php echo $alertType; ?> alert-dismissible fade show mb-4 animate__animated animate__fadeIn"
            role="alert">
            <i
                class="fas <?php echo $alertType == 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'; ?> me-2"></i>
            <?php echo $alertMessage; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <?php endif; ?>




        <!-- Form Section -->
        <div class="form-section mb-5 animate__animated animate__fadeIn">
            <h4><i class="fas fa-edit me-2"></i>Request Form</h4>
            <p class="text-muted mb-4">Please enter your details accurately to request your transcript</p>

            <form id="transcriptForm" method="POST">
                <!-- Personal Details -->
                <div class="row mb-4">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <label for="studentID" class="form-label">Matriculation No.</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                            <input type="text" class="form-control" id="studentID" name="studentID"
                                placeholder="Enter your Matric number" required>
                        </div>
                        <div class="form-text">Your university matriculation number</div>
                    </div>

                    <div class="col-md-6">
                        <label for="studentEmail" class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" class="form-control" id="studentEmail" name="studentEmail"
                                placeholder="Enter your email" required>
                        </div>
                        <div class="form-text">We'll send updates to this email</div>
                    </div>
                </div>

                <!-- Delivery Type -->
                <div class="mb-4">
                    <label class="form-label">Select Your Preferred Delivery Method</label>

                    <div class="delivery-option d-flex align-items-center" data-value="Email">
                        <div class="icon-container">
                            <i class="fas fa-envelope fa-lg"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="fw-bold">Email Delivery</div>
                            <div class="text-muted small">Receive your transcript via email (fastest option)</div>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input delivery-radio" type="radio" name="deliveryType"
                                id="emailDelivery" value="Email" required>
                        </div>
                    </div>

                    <div class="delivery-option d-flex align-items-center" data-value="Dispatch">
                        <div class="icon-container">
                            <i class="fas fa-shipping-fast fa-lg"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="fw-bold">Dispatch</div>
                            <div class="text-muted small">We'll mail a physical copy to your address</div>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input delivery-radio" type="radio" name="deliveryType"
                                id="dispatch" value="Dispatch">
                        </div>
                    </div>

                    <div class="delivery-option d-flex align-items-center" data-value="Pickup">
                        <div class="icon-container">
                            <i class="fas fa-university fa-lg"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="fw-bold">Pickup</div>
                            <div class="text-muted small">Collect in person from the registrar's office</div>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input delivery-radio" type="radio" name="deliveryType"
                                id="pickupDelivery" value="Pickup">
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-custom" id="submitBtn">
                        <i class="fas fa-paper-plane me-2"></i>Submit Request
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JavaScript -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Form validation with visual feedback
        const form = document.getElementById('transcriptForm');
        const submitBtn = document.getElementById('submitBtn');

        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();

                // Shake the submit button to indicate validation error
                submitBtn.classList.add('animate__animated', 'animate__shakeX');
                setTimeout(() => {
                    submitBtn.classList.remove('animate__animated', 'animate__shakeX');
                }, 1000);
            } else {
                // Change button text and add spinner when form is valid and submitting
                submitBtn.innerHTML =
                    '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Processing...';
                submitBtn.disabled = true;
            }

            form.classList.add('was-validated');
        });

        // Delivery option selection enhancement
        const deliveryOptions = document.querySelectorAll('.delivery-option');
        const deliveryRadios = document.querySelectorAll('.delivery-radio');

        deliveryOptions.forEach(option => {
            option.addEventListener('click', function() {
                const value = this.dataset.value;
                const radio = document.querySelector(`input[value="${value}"]`);

                // Reset all options
                deliveryOptions.forEach(opt => opt.classList.remove('selected'));
                deliveryRadios.forEach(rad => rad.checked = false);

                // Select clicked option
                this.classList.add('selected');
                radio.checked = true;
            });
        });

        // Auto-dismiss alerts after 5 seconds
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }, 5000);
        });
    });
    </script>
</body>

</html>