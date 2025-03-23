<?php
// Database connection details
$host = "localhost"; // Database host
$dbname = "transcript_management"; // Database name
$username = "root"; // Database username
$password = ""; // Database password

// Create a connection to the database
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Fetch matric number from query parameter
$matric_number = $_GET['matric_number'] ?? die("Matric number not provided.");

// Fetch student data using their matric number
$student_query = "SELECT * FROM students WHERE matric_number = :matric_number";
$stmt = $conn->prepare($student_query);
$stmt->bindParam(':matric_number', $matric_number);
$stmt->execute();
$student = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$student) {
    die("Student not found.");
}

// Fetch grades data using the Student_ID
$student_id = $student['Student_ID']; // Student's ID
$grades_query = "SELECT grades.*, courses.courseTitle 
                 FROM grades 
                 JOIN courses ON grades.course_code = courses.courseCode 
                 WHERE grades.student_ID = :student_id";
$stmt = $conn->prepare($grades_query);
$stmt->bindParam(':student_id', $student_id);
$stmt->execute();
$grades = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Calculate TCR, TCE, TWGP, and CGPA
$tcr = 0; // Total Credit Registered
$tce = 0; // Total Credit Earned
$twgp = 0; // Total Weighted Grade Points
foreach ($grades as $grade) {
    $tcr += $grade['credit_units'];
    if ($grade['grade'] != 'F') { // Only count earned credits if the grade is not 'F'
        $tce += $grade['credit_units'];
        $twgp += $grade['credit_units'] * $grade['grade_points'];
    }
}
$cgpa = ($tce > 0) ? $twgp / $tce : 0; // Calculate CGPA
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transcript View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* Add custom styles here */
    </style>
</head>

<body>
    <div class="container transcript-container">
        <!-- Header Section -->
        <div class="header">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrtSpLdQIBsrr3OiwHsiuXm1C-Fp9_hw2zA8ffcWbIZ2F1iYuQvUHTjRPHwYt2Z1pMtII&usqp=CAU"
                alt="School Logo">
            <h1>Benue State University, Makurdi, Nigeria</h1>
            <p>Office of the Registrar - Academic Transcript</p>
        </div>

        <!-- Student Info Section -->
        <div class="student-info ms-2 mb-4">
            <p><strong>Name:</strong>
                <?php echo htmlspecialchars($student['first_name'] . ' ' . $student['middle_name'] . ' ' . $student['last_name']); ?>
            </p>
            <p><strong>Student Number:</strong> <?php echo htmlspecialchars($student['Student_ID']); ?></p>
            <p><strong>Date of Birth:</strong> <?php echo htmlspecialchars($student['date_of_birth']); ?></p>
            <p><strong>Sex:</strong> <?php echo htmlspecialchars($student['sex']); ?></p>
            <p><strong>Dates in University:</strong> Entered <?php echo htmlspecialchars($student['Admission_year']); ?>
            </p>
            <p><strong>Faculty:</strong> <?php echo htmlspecialchars($student['faculty']); ?></p>
            <p><strong>Department:</strong> <?php echo htmlspecialchars($student['Department']); ?></p>
            <p><strong>Degree Awarded:</strong> <?php echo htmlspecialchars($student['Program']); ?></p>
            <p><strong>CGPA:</strong> <?php echo round($cgpa, 2); ?></p>
            <p><strong>Certificate Awarded:</strong>
                <?php 
if ($cgpa >= 4.5 && $cgpa <= 5.0) {
    echo "First Class Honours";
} elseif ($cgpa >= 3.5 && $cgpa < 4.5) {
    echo "Second Class Honours (Upper Division)";
} elseif ($cgpa >= 2.5 && $cgpa < 3.5) {
    echo "Second Class Honours (Lower Division)";
} elseif ($cgpa >= 1.5 && $cgpa < 2.5) {
    echo "Third Class Honours";
} elseif ($cgpa >= 1.0 && $cgpa < 1.5) {
    echo "Pass";
} else {
    echo "No Award";
}
?>
            </p>
        </div>

        <!-- Transcript Table -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Course Title</th>
                    <th>Credit Unit</th>
                    <th>Letter Grade</th>
                    <th>Grade Point</th>
                    <th>Weighted Grade Point</th>
                    <th>Year Taken</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($grades as $grade): ?>
                <tr>
                    <td><?php echo htmlspecialchars($grade['course_code']); ?></td>
                    <td><?php echo htmlspecialchars($grade['courseTitle']); ?></td>
                    <td><?php echo htmlspecialchars($grade['credit_units']); ?></td>
                    <td><?php echo htmlspecialchars($grade['grade']); ?></td>
                    <td><?php echo htmlspecialchars($grade['grade_points']); ?></td>
                    <td><?php echo htmlspecialchars($grade['credit_units'] * $grade['grade_points']); ?></td>
                    <td><?php echo htmlspecialchars($grade['exam_year']); ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Summary Table -->
        <table class="table table-bordered summary-table text-center">
            <thead>
                <tr>
                    <th>Total Credit Registered (TCR)</th>
                    <th>Total Credit Earned (TCE)</th>
                    <th>Total Weighted Grade Points (TWGP)</th>
                    <th>Cumulative Grade Point Average (CGPA)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?php echo $tcr; ?></td>
                    <td><?php echo $tce; ?></td>
                    <td><?php echo $twgp; ?></td>
                    <td><?php echo number_format($cgpa, 2); ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>