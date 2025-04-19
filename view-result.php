<?php
session_start();

// Check if matric number is provided
if (!isset($_GET['matric_number'])) {
    die("Matric number not provided.");
}

$matric_number = $_GET['matric_number'];

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "transcript_management";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Fetch student data
$student_query = "SELECT * FROM students WHERE matric_number = ?";
$stmt = $conn->prepare($student_query);
$stmt->execute([$matric_number]);
$student = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$student) {
    die("Student not found.");
}

// Fetch grades data
$grades_query = "SELECT grades.*, courses.courseTitle 
                 FROM grades 
                 JOIN courses ON grades.course_code = courses.courseCode 
                 WHERE grades.student_ID = ?
                 ORDER BY grades.exam_year ASC";
$stmt = $conn->prepare($grades_query);
$stmt->execute([$student['Student_ID']]);
$grades = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Calculate transcript statistics
$tcr = $tce = $twgp = 0;
foreach ($grades as $grade) {
    $tcr += $grade['credit_units'];
    if ($grade['grade'] != 'F') {
        $tce += $grade['credit_units'];
        $twgp += $grade['credit_units'] * $grade['grade_points'];
    }
}
$cgpa = ($tcr > 0) ? $twgp / $tcr : 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin View - Student Transcript</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Add your existing styles here */
        body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
        .transcript-container { background-color: #fff; padding: 30px; border-radius: 8px; margin: 20px auto; max-width: 800px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .header { text-align: center; margin-bottom: 30px; }
        .header img { max-width: 100px; margin-bottom: 15px; }
        .header h1 { font-size: 24px; color: #0056b3; }
        .table th { background-color: #0056b3; color: #fff; }
        .btn-print { margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="container transcript-container">
        <button onclick="window.print()" class="btn btn-primary btn-print float-end">
            <i class="fas fa-print"></i> Print Transcript
        </button>
        
        <div class="header">
            <img src="assets/images/bsuLogo.jpg" alt="University Logo">
            <h1>Benue State University</h1>
            <p>Office of the Registrar - Academic Transcript</p>
        </div>

        <!-- Student Information -->
        <div class="student-info mb-4">
            <p><strong>Name:</strong> <?= htmlspecialchars($student['first_name'].' '.$student['middle_name'].' '.$student['last_name']) ?></p>
            <p><strong>Matric Number:</strong> <?= htmlspecialchars($matric_number) ?></p>
            <p><strong>Program:</strong> <?= htmlspecialchars($student['Program']) ?></p>
            <p><strong>CGPA:</strong> <?= number_format($cgpa, 2) ?></p>
        </div>

        <!-- Grades Table -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Course Title</th>
                    <th>Credit Unit</th>
                    <th>Grade</th>
                    <th>Points</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($grades as $grade): ?>
                <tr>
                    <td><?= htmlspecialchars($grade['course_code']) ?></td>
                    <td><?= htmlspecialchars($grade['courseTitle']) ?></td>
                    <td><?= htmlspecialchars($grade['credit_units']) ?></td>
                    <td><?= htmlspecialchars($grade['grade']) ?></td>
                    <td><?= htmlspecialchars($grade['grade_points']) ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Summary Section -->
        <div class="summary-section mt-4">
            <table class="table table-bordered">
                <tr>
                    <th>Total Credit Registered</th>
                    <td><?= $tcr ?></td>
                </tr>
                <tr>
                    <th>Total Credit Earned</th>
                    <td><?= $tce ?></td>
                </tr>
                <tr>
                    <th>CGPA</th>
                    <td><?= number_format($cgpa, 2) ?></td>
                </tr>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>