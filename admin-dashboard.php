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
                        <th>Delivery Method</th>
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
                        <th>Request ID</th>
                        <th>Matric Number</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Date Requested</th>
                        <th>Delivery Method</th>
                        <th>Actions</th>
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
                                <a href="view_result.php?matric_number=<?php echo $request['matric_number']; ?>&email=<?php echo urlencode($request['email']); ?>"
                                    class="btn btn-info btn-sm">
                                    <i class="fas fa-eye"></i> View Result
                                </a>
                            </form>
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
                                    <td>${request.request_ID}</td>
                                    <td>${request.matric_number}</td>
                                    <td>${request.email}</td>
                                    <td>
                                        <span class="status-badge ${request.status.toLowerCase()}">
                                            ${request.status}
                                        </span>
                                    </td>
                                    <td>${formattedDate}</td>
                                    <td>${request.delivery_method}</td>
                                    <td class="action-buttons">
                                        <form method="POST" style="display:inline;">
                                            <input type="hidden" name="request_id" value="${request.request_ID}">
                                            <button type="submit" name="action" value="approve" class="btn btn-success btn-sm" ${approveDisabled}>
                                                <i class="fas fa-check"></i> Approve
                                            </button>
                                            <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm" ${rejectDisabled}>
                                                <i class="fas fa-times"></i> Reject
                                            </button>
                                            <a href="view_result.php?matric_number=${request.matric_number}"
                                                class="btn btn-info btn-sm">
                                                <i class="fas fa-eye"></i> View Result
                                            </a>
                                        </form>
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