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
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .sidebar {
        width: 250px;
        height: 100vh;
        background: #2e7d32;
        color: white;
        position: fixed;
        top: 0;
        left: 0;
        transition: all 0.3s ease;
        overflow-y: auto;
    }

    .sidebar.collapsed {
        width: 80px;
    }

    .sidebar .logo {
        padding: 20px;
        text-align: center;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .sidebar .logo .logo-text {
        display: inline;
    }

    .sidebar.collapsed .logo-text {
        display: none;
    }

    .sidebar .nav-link {
        color: white;
        padding: 10px 20px;
        display: flex;
        align-items: center;
    }

    .sidebar .nav-link:hover {
        background: rgba(255, 255, 255, 0.1);
    }

    .sidebar .nav-link i {
        margin-right: 10px;
    }

    .sidebar.collapsed .nav-link span {
        display: none;
    }

    .main-content {
        margin-left: 250px;
        transition: all 0.3s ease;
    }

    .main-content.expanded {
        margin-left: 80px;
    }

    .header {
        background: white;
        padding: 15px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header .logo {
        font-size: 24px;
        font-weight: bold;
        color: #2e7d32;
    }

    .header .search {
        width: 300px;
        position: relative;
    }

    .header .search .search-icon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        color: #2e7d32;
        cursor: pointer;
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
    }

    .status-badge.pending {
        background: #ffc107;
        color: black;
    }

    .status-badge.approved {
        background: #28a745;
        color: white;
    }

    .status-badge.rejected {
        background: #dc3545;
        color: white;
    }

    .action-buttons .btn {
        margin: 2px;
    }

    .toggle-sidebar {
        position: fixed;
        top: 20px;
        left: 210px;
        z-index: 1000;
        cursor: pointer;
        background: #2e7d32;
        color: white;
        border-radius: 50%;
        padding: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .toggle-sidebar.collapsed {
        left: 40px;
    }

    #searchResults {
        display: none;
    }

    .search-message {
        padding: 20px;
        text-align: center;
        background-color: #f8d7da;
        color: #721c24;
        border-radius: 8px;
        margin: 20px;
    }

    .btn:disabled {
        cursor: not-allowed;
        opacity: 0.6;
    }
    </style>
</head>

<body>
    <!-- Sidebar Toggle Icon -->
    <div class="toggle-sidebar" id="toggleSidebar">
        <i class="material-icons">chevron_left</i>
    </div>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="logo">
            <i class="material-icons d-none">school</i>
            <span class="logo-text text-start text-bolder">Benue State University</span>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="?status=">
                    <i class="material-icons">equalizer</i>
                    <span>Overview</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="?status=Pending">
                    <i class="material-icons">pending_actions</i>
                    <span>Pending Requests</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="?status=Approved">
                    <i class="material-icons">check_circle</i>
                    <span>Approved Transcripts</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="?status=Rejected">
                    <i class="material-icons">cancel</i>
                    <span>Rejected Transcripts</span>
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <!-- Header -->
        <div class="header">
            <div class="logo">Transcript Management</div>
            <div class="search">
                <input type="text" class="form-control" id="searchInput" placeholder="Search by Matric Number">
                <i class="material-icons search-icon" id="searchButton">search</i>
            </div>
        </div>

        <!-- Alert Messages -->
        <?php if (!empty($alertMessage)): ?>
        <div class="alert alert-<?php echo $alertType; ?> alert-dismissible fade show m-4" role="alert"
            id="alertMessage">
            <i class="material-icons me-2"><?php echo $alertType == 'success' ? 'check_circle' : 'error'; ?></i>
            <?php echo $alertMessage; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <?php endif; ?>

        <!-- Search Results Section -->
        <div id="searchResults" class="table-responsive m-4">
            <h4>Search Results</h4>
            <div id="searchMessage" class="search-message" style="display: none;"></div>
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
                <tbody id="searchResultsBody">
                    <!-- Search results will be populated here -->
                </tbody>
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
                            <form method="POST" style="display:inline;">
                                <input type="hidden" name="request_id" value="<?php echo $request['request_ID']; ?>">
                                <button type="submit" name="action" value="approve" class="btn btn-success btn-sm"
                                    <?php if ($request['status'] == 'Approved'): ?> disabled data-bs-toggle="tooltip"
                                    data-bs-placement="top" title="Request is already approved" <?php endif; ?>>
                                    <i class="material-icons d-none">check</i>Approve
                                </button>
                                <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm"
                                    <?php if ($request['status'] == 'Rejected'): ?> disabled data-bs-toggle="tooltip"
                                    data-bs-placement="top" title="Request is already rejected" <?php endif; ?>>
                                    <i class="material-icons d-none">close</i>Reject
                                </button>
                                <a href="view_result.php?matric_number=<?php echo $request['matric_number']; ?>"
                                    class="btn btn-info btn-sm text-bold">
                                    <i class="material-icons d-none">visibility</i>View Result
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
    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Toggle sidebar
    const toggleSidebar = document.getElementById('toggleSidebar');
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');

    toggleSidebar.addEventListener('click', function() {
        sidebar.classList.toggle('collapsed');
        mainContent.classList.toggle('expanded');
        toggleSidebar.classList.toggle('collapsed');
        toggleSidebar.innerHTML = sidebar.classList.contains('collapsed') ?
            '<i class="material-icons">chevron_right</i>' :
            '<i class="material-icons">chevron_left</i>';
    });

    // Search functionality
    const searchButton = document.getElementById('searchButton');
    const searchInput = document.getElementById('searchInput');
    const searchResults = document.getElementById('searchResults');
    const searchResultsBody = document.getElementById('searchResultsBody');
    const searchMessage = document.getElementById('searchMessage');
    const searchResultsTable = document.getElementById('searchResultsTable');
    const allRequestsTable = document.getElementById('allRequestsTable');
    const backToAllButton = document.getElementById('backToAllButton');

    // Function to perform search
    function performSearch() {
        const matricNumber = searchInput.value.trim();

        if (matricNumber === '') {
            alert('Please enter a matric number to search');
            return;
        }

        // Show loading state
        searchResultsBody.innerHTML = '<tr><td colspan="7" class="text-center">Searching...</td></tr>';
        searchResults.style.display = 'block';
        allRequestsTable.style.display = 'none';
        searchMessage.style.display = 'none';
        searchResultsTable.style.display = 'table';

        // Make AJAX request
        fetch(`?search_matric=${matricNumber}`)
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    // Populate search results table
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

                        // Determine which buttons should be disabled based on status
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
                                            <i class="material-icons d-none">check</i>Approve
                                        </button>
                                        <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm" ${rejectDisabled}>
                                            <i class="material-icons d-none">close</i>Reject
                                        </button>
                                        <a href="view_result.php?matric_number=${request.matric_number}"
                                            class="btn btn-info btn-sm text-bold">
                                            <i class="material-icons d-none">visibility</i>View Result
                                        </a>
                                    </form>
                                </td>
                            </tr>
                        `;
                    });

                    searchResultsTable.style.display = 'table';
                    searchMessage.style.display = 'none';

                    // Re-initialize tooltips for the newly added buttons
                    var newTooltipTriggerList = [].slice.call(document.querySelectorAll(
                        '[data-bs-toggle="tooltip"]'));
                    var newTooltipList = newTooltipTriggerList.map(function(tooltipTriggerEl) {
                        return new bootstrap.Tooltip(tooltipTriggerEl);
                    });
                } else {
                    // Show not found message
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

    // Search button click event
    searchButton.addEventListener('click', performSearch);

    // Allow pressing Enter in search input
    searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            performSearch();
        }
    });

    // Back to all requests button
    backToAllButton.addEventListener('click', function() {
        searchResults.style.display = 'none';
        allRequestsTable.style.display = 'block';
        searchInput.value = '';
    });

    // Hide alert message after 3 seconds
    const alertMessage = document.getElementById('alertMessage');
    if (alertMessage) {
        setTimeout(() => {
            alertMessage.style.display = 'none';
        }, 3000);
    }
    </script>
</body>

</html>