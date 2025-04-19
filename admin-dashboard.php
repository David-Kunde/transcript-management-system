<?php
// Error reporting for development (remove in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Start the session
session_start();

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

// Handle actions (approve, reject, etc.)
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action'])) {
    $request_id = $_POST['request_id'];
    $action = $_POST['action'];

    if ($action == 'approve') {
        $status = 'Approved';
    } elseif ($action == 'reject') {
        $status = 'Rejected';
    } else {
        $status = 'Pending';
    }

    // Update the request status
    $update_sql = "UPDATE transcript_requests SET status = ?, date_processed = NOW() WHERE request_ID = ?";
    $update_stmt = $conn->prepare($update_sql);
    if (!$update_stmt) {
        die("SQL Error: " . $conn->error);
    }
    $update_stmt->bind_param('ss', $status, $request_id);

    if ($update_stmt->execute()) {
        $alertMessage = "Request $status successfully!";
        $alertType = "success";
    } else {
        $alertMessage = "Error: " . $update_stmt->error;
        $alertType = "danger";
    }

    $update_stmt->close();
}

// Check if this is an AJAX search request
if (isset($_GET['search_matric']) && !empty($_GET['search_matric'])) {
    $matric_number = $_GET['search_matric'];
    $search_sql = "SELECT * FROM transcript_requests WHERE matric_number = ?";
    $search_stmt = $conn->prepare($search_sql);
    if (!$search_stmt) {
        die(json_encode(['error' => 'SQL Error: ' . $conn->error]));
    }
    $search_stmt->bind_param('s', $matric_number);
    $search_stmt->execute();
    $result = $search_stmt->get_result();
    
    if ($result->num_rows > 0) {
        $search_results = [];
        while ($row = $result->fetch_assoc()) {
            $search_results[] = $row;
        }
        echo json_encode(['status' => 'success', 'data' => $search_results]);
    } else {
        echo json_encode(['status' => 'not_found', 'message' => 'Invalid Matric number or Student has not requested a transcript']);
    }
    
    $search_stmt->close();
    $conn->close();
    exit; // Stop executing rest of the script
}

// Fetch all transcript requests based on status filter
$status_filter = isset($_GET['status']) ? $_GET['status'] : '';
$sql = "SELECT * FROM transcript_requests";
if ($status_filter) {
    $sql .= " WHERE status = '$status_filter'";
}
$sql .= " ORDER BY date_requested DESC";
$result = $conn->query($sql);
$requests = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $requests[] = $row;
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
    <title>Admin Dashboard - Transcript Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet"  href="bootstrap.min.css">
    
    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Inter', sans-serif;
    }

    .sidebar {
        width: 250px;
        height: 100vh;
        background: #2c3e50;
        color: white;
        position: fixed;
        top: 0;
        left: 0;
        overflow-y: auto;
        transition: all 0.3s ease;
    }

    .sidebar .logo {
        padding: 20px;
        text-align: center;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .sidebar .logo img {
        width: 40%;
        max-width: 40px;
    }

    .sidebar .nav-link {
        color: white;
        padding: 10px 20px;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
    }

    .sidebar .nav-link:hover {
        background: rgba(255, 255, 255, 0.1);
    }

    .sidebar .nav-link i {
        margin-right: 10px;
    }

    .main-content {
        margin-left: 250px;
        transition: all 0.3s ease;
    }

    .header {
        background: white;
        padding: 15px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header .search {
        width: 300px;
        position: relative;
    }

    .header .search input {
        padding-right: 40px;
    }

    .header .search i {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }

    .header .logout-button {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .header .logout-button:hover {
        background-color: #c82333;
    }

    .table-responsive {
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin: 20px;
    }

    .status-badge {
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 500;
    }

    .status-badge.pending {
        background: #fff3cd;
        color: #856404;
    }

    .status-badge.approved {
        background: #d4edda;
        color: #155724;
    }

    .status-badge.rejected {
        background: #f8d7da;
        color: #721c24;
    }

    .action-buttons .btn {
        margin: 2px;
        padding: 5px 10px;
        font-size: 14px;
    }

    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-info {
        background-color: #17a2b8;
        border-color: #17a2b8;
    }

    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
    }

    .accordion-button.btn-info {
    color: white;
    padding: 5px 10px;
    font-size: 14px;
}

.accordion-button:not(.collapsed) {
    color: white;
    background-color: #17a2b8;
}

.accordion-item {
    border: none;
    background: transparent;
}

.accordion-body {
    padding: 10px;
    background: white;
    border-radius: 0 0 5px 5px;
    border: 1px solid #dee2e6;
    border-top: none;
}
/* Add this to your existing styles */
.accordion-container {
    width: 20vw;
    min-width: 200px;
}

.accordion-button.btn-info {
    color: white;
    padding: 5px 10px;
    font-size: 14px;
    width: 100%;
}

.accordion-button:not(.collapsed) {
    color: white;
    background-color: #17a2b8;
    width: 100%;
}

.accordion-item {
    border: none;
    background: transparent;
    width: 100%;
}

.accordion-body {
    padding: 10px;
    background: white;
    border-radius: 0 0 5px 5px;
    border: 1px solid #dee2e6;
    border-top: none;
    width: 100%;
}

    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <a href="index.php"><img src="assets/images/bsuLogo.jpg" alt="Admin Logo"></a>

            <h5 class="mt-2">BSU Transcript System</h5>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="?status=">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Overview</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="?status=Pending">
                    <i class="fas fa-clock"></i>
                    <span>Pending Requests</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="?status=Approved">
                    <i class="fas fa-check-circle"></i>
                    <span>Approved Transcripts</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="?status=Rejected">
                    <i class="fas fa-times-circle"></i>
                    <span>Rejected Transcripts</span>
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="search">
                <input type="text" class="form-control" id="searchInput" placeholder="Search by Matric Number">
                <i class="fas fa-search" id="searchButton"></i>
            </div>
            <button class="logout-button" onclick="logout()">
                <i class="fas fa-sign-out-alt"></i> Logout
            </button>
        </div>

        <!-- Alert Messages -->
        <?php if (!empty($alertMessage)): ?>
        <div class="alert alert-<?php echo $alertType; ?> alert-dismissible fade show m-4" role="alert">
            <i
                class="fas <?php echo $alertType == 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'; ?> me-2"></i>
            <?php echo $alertMessage; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <?php endif; ?>

        <!-- Search Results Section -->
        <div id="searchResults" class="table-responsive m-4">
            <h4>Search Results</h4>
            <div id="searchMessage" class="alert alert-warning" style="display: none;"></div>
            <table class="table table-hover" id="searchResultsTable">
                <thead>
                    <tr>
                        <th>Request ID</th>
                        <th>Matric Number</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Date Requested</th>
                        <th class="d-none">Delivery Method</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="searchResultsBody"></tbody>
            </table>
            <button id="backToAllButton" class="btn btn-secondary">Back to All Requests</button>
        </div>

        <!-- All Requests Table -->
        <div class="table-responsive m-4" id="allRequestsTable">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Matric Number</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Request Date</th>
                        <th>Delivery</th>
                        <th class="align-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
    <?php foreach ($requests as $request): ?>
    <tr>
        <td><?php echo $request['request_ID']; ?></td>
        <td><?php echo $request['matric_number']; ?></td>
        <td><?php echo $request['email']; ?></td>
        <td>
            <span class="status-badge <?php echo strtolower($request['status']); ?>">
                <?php echo $request['status']; ?>
            </span>
        </td>
        <td><?php echo date('F j, Y, g:i a', strtotime($request['date_requested'])); ?></td>
        <td><?php echo $request['delivery_method']; ?></td>
        <td class="action-buttons">
            <form method="POST" class="d-flex gap-1">
                <input type="hidden" name="request_id" value="<?php echo $request['request_ID']; ?>">
                <button type="submit" name="action" value="approve" class="btn btn-success btn-sm"
                    <?php if ($request['status'] == 'Approved'): ?> disabled data-bs-toggle="tooltip"
                    data-bs-placement="top" title="Request is already approved" <?php endif; ?>>
                    <i class="fas fa-check"></i> Approve
                </button>
                <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm"
                    <?php if ($request['status'] == 'Rejected'): ?> disabled data-bs-toggle="tooltip"
                    data-bs-placement="top" title="Request is already rejected" <?php endif; ?>>
                    <i class="fas fa-times"></i> Reject
                </button>
            </form>
        </td>
        <td class="w-25">
            <div class="accordion " id="accordionResult_<?php echo $request['request_ID']; ?>">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed btn btn-info btn-sm " type="button" 
                            data-bs-toggle="collapse" 
                            data-bs-target="#collapse_<?php echo $request['request_ID']; ?>" 
                            aria-expanded="false">
                            <i class="fas fa-eye d-none"></i> Result Summary
                        </button>
                    </h2>
                    <div id="collapse_<?php echo $request['request_ID']; ?>" 
                        class="accordion-collapse collapse" 
                        data-bs-parent="#accordionResult_<?php echo $request['request_ID']; ?>">
                        <div class="accordion-body">
                            


                        <?php
// Database connection details (XAMPP default)
$servername = "localhost";
$username = "root";       // Default XAMPP MySQL username
$password = "";           // Default XAMPP MySQL password (empty)
$dbname = "transcript_management";  

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$matric_number = $request['matric_number'];
$program = "No. Program";
$tce = 0;
$unfulfilled_gst_courses = 0;
$unfulfilled_core_courses = 0;   
$recommendation = "Reject"; // Default to Reject


// 1. Get total credits earned
$sql = "SELECT SUM(credit_units) AS total_credits_earned 
        FROM grades 
        WHERE student_ID = ? AND score > 39";

$stmt = $conn->prepare($sql);
$stmt->bind_param('s', $matric_number);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$total_credits_earned = $row['total_credits_earned'] ?? 0;

// 2. Get student's program
$sql_program = "SELECT Program FROM students WHERE student_ID = ?";
$stmt_program = $conn->prepare($sql_program);
$stmt_program->bind_param('s', $matric_number);
$stmt_program->execute();
$result_program = $stmt_program->get_result();
$row_program = $result_program->fetch_assoc();
$program = $row_program['Program'] ?? 'Unknown Program';

// 3. unfulfilled core courses
$sql_ucc = "SELECT c.courseCode
            FROM courses c
            INNER JOIN grades g
            ON c.courseCode = g.course_code
            WHERE g.student_ID = ? AND c.course_type_for_computer = 'core' AND g.grade = 'F';";

$stmt_ucc = $conn->prepare($sql_ucc);
$stmt_ucc->bind_param('s', $matric_number);
$stmt_ucc->execute();
$result_ucc = $stmt_ucc->get_result();
$ucc = $result_ucc->fetch_all(MYSQLI_ASSOC);

// 4. unfulfilled GST courses
$sql_ugst = "SELECT c.courseCode
             FROM courses c
             INNER JOIN grades g
             ON c.courseCode = g.course_code
             WHERE g.student_ID = ? AND c.course_type_for_computer = 'gst' AND g.grade = 'F';";
                       
$stmt_ugst = $conn->prepare($sql_ugst);
$stmt_ugst->bind_param('s', $matric_number);
$stmt_ugst->execute();
$result_ugst = $stmt_ugst->get_result();
$ugst = $result_ugst->fetch_all(MYSQLI_ASSOC);

// Determine recommendation
if ($total_credits_earned >= 104 && empty($ucc) && empty($ugst)) {
    $recommendation = "Approve";
} else {
    $recommendation = "Reject";
}

$conn->close();
?>

<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <tbody>
            <tr>
                <th class="bg-light" style="width: 30%">Matric NO.</th>
                <td><?php echo htmlspecialchars($matric_number) ?></td>
            </tr>
            <tr>
                <th class="bg-light">Programme</th>
                <td><?php echo htmlspecialchars($program) ?></td>
            </tr>
            <tr>
                <th class="bg-light">TCE</th>
                <td>
                    <div class="d-flex align-items-center">
                        <span class="me-2"><?php echo $total_credits_earned ?>/144</span>
                        <div class="progress flex-grow-1 d-none" style="height: 20px;">
                            <div class="progress-bar bg-<?php echo ($total_credits_earned >= 144) ? 'success' : 'warning' ?>" 
                                 role="progressbar" 
                                 style="width: <?php echo min(100, ($total_credits_earned/144)*100) ?>%">
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            
            <tr>
                <th class="bg-light">Failed Core Courses</th>
                <td>
                    <?php if (!empty($ucc)): ?>
                        <div class="d-flex flex-wrap gap-1">
                            <?php foreach ($ucc as $course): ?>
                                <span class="badge bg-danger">
                                    <?php echo htmlspecialchars($course['courseCode']) ?>
                                </span>
                            <?php endforeach; ?>
                        </div>
                    <?php else: ?>
                        <span class="badge bg-success p-2">ALL PASSED</span>
                    <?php endif; ?>
                </td>
            </tr>

            <tr>
                <th class="bg-light">Failed GST Courses</th>
                <td>
                    <?php if (!empty($ugst)): ?>
                        <div class="d-flex flex-wrap gap-1">
                            <?php foreach ($ugst as $course): ?>
                                <span class="badge bg-danger">
                                    <?php echo htmlspecialchars($course['courseCode']) ?>
                                </span>
                            <?php endforeach; ?>
                        </div>
                    <?php else: ?>
                        <span class="badge bg-success p-2">ALL PASSED</span>
                    <?php endif; ?>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr class="table-<?php echo ($recommendation == 'Approve') ? 'success' : 'danger' ?>">
                <th colspan="2" class="text-center h6 py-2">
                    RECOMMENDATION: <?php echo strtoupper($recommendation) ?>
                </th>
            </tr>
        </tfoot>
    </table>
</div>

                       

                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    <?php endforeach; ?>
</tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script>
    // Search functionality
    const searchButton = document.getElementById('searchButton');
    const searchInput = document.getElementById('searchInput');
    const searchResults = document.getElementById('searchResults');
    const searchResultsBody = document.getElementById('searchResultsBody');
    const searchMessage = document.getElementById('searchMessage');
    const searchResultsTable = document.getElementById('searchResultsTable');
    const allRequestsTable = document.getElementById('allRequestsTable');
    const backToAllButton = document.getElementById('backToAllButton');

    function performSearch() {
        const matricNumber = searchInput.value.trim();
        if (matricNumber === '') {
            alert('Please enter a matric number to search');
            return;
        }

        searchResultsBody.innerHTML = '<tr><td colspan="7" class="text-center">Searching...</td></tr>';
        searchResults.style.display = 'block';
        allRequestsTable.style.display = 'none';
        searchMessage.style.display = 'none';
        searchResultsTable.style.display = 'table';

        fetch(`?search_matric=${matricNumber}`)
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    searchResultsBody.innerHTML = '';
                    data.data.forEach(request => {
                        const date = new Date(request.date_requested);
                        const formattedDate = date.toLocaleString('en-US', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric',
                            hour: 'numeric',
                            minute: 'numeric',
                            hour12: true
                        });

                        const approveDisabled = request.status === 'Approved' ?
                            'disabled data-bs-toggle="tooltip" data-bs-placement="top" title="Request is already approved"' :
                            '';

                        const rejectDisabled = request.status === 'Rejected' ?
                            'disabled data-bs-toggle="tooltip" data-bs-placement="top" title="Request is already rejected"' :
                            '';

                            searchResultsBody.innerHTML += `
    <tr>
        <!-- other table cells -->
        <td>
            <div class="accordion" id="accordionResult_${request.request_ID}">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed btn btn-info btn-sm" type="button" 
                            data-bs-toggle="collapse" 
                            data-bs-target="#collapse_${request.request_ID}" 
                            aria-expanded="false">
                            <i class="fas fa-eye"></i> View Result
                        </button>
                    </h2>
                    <div id="collapse_${request.request_ID}" 
                        class="accordion-collapse collapse" 
                        data-bs-parent="#accordionResult_${request.request_ID}">
                        <div class="accordion-body">
                            <p><strong>Total Credits Earned:</strong> ${request.total_credits || 'N/A'}</p>
                            <p><strong>Unfulfilled Core Courses:</strong> ${request.unfulfilled_core || 'None'}</p>
                            <p><strong>Unfulfilled GST Courses:</strong> ${request.unfulfilled_gst || 'None'}</p>
                            <p><strong>Recommendation:</strong> ${request.recommendation || 'N/A'}</p>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
`;
                    });

                    searchResultsTable.style.display = 'table';
                    searchMessage.style.display = 'none';
                } else {
                    searchMessage.innerHTML = data.message;
                    searchMessage.style.display = 'block';
                    searchResultsTable.style.display = 'none';
                }
            })
            .catch(error => {
                searchMessage.innerHTML = 'An error occurred while searching. Please try again.';
                searchMessage.style.display = 'block';
                searchResultsTable.style.display = 'none';
                console.error('Search error:', error);
            });
    }

    searchButton.addEventListener('click', performSearch);
    searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') performSearch();
    });

    backToAllButton.addEventListener('click', function() {
        searchResults.style.display = 'none';
        allRequestsTable.style.display = 'block';
        searchInput.value = '';
    });

    // Logout function
    function logout() {
        window.location.href = "logout.php";
    }
    </script>
</body>

</html>