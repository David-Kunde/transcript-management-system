<?php
// Start the session (if not already started)
session_start();

// Check if the student email is set in the session
if (!isset($_SESSION["student_email"])) {
    die("Student email not found in session. Please log in.");
}

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

// Fetch student data using their email from the session
$student_email = $_SESSION["student_email"]; // Use session email instead of hardcoded email
$student_query = "SELECT * FROM students WHERE Email = :email";
$stmt = $conn->prepare($student_query);
$stmt->bindParam(':email', $student_email);
$stmt->execute();
$student = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$student) {
    die("Student not found.");
}

// Fetch grades data using the Student_ID - Modified to order by level and semester
$student_id = $student['Student_ID'];
$grades_query = "SELECT grades.*, courses.courseTitle 
                 FROM grades 
                 JOIN courses ON grades.course_code = courses.courseCode 
                 WHERE grades.student_ID = :student_id
                 ORDER BY grades.student_level ASC, grades.exam_year ASC, grades.semester ASC";
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
$cgpa = ($tce > 0) ? $twgp / $tcr : 0; // Calculate CGPA
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* Custom Styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    .transcript-container {
        background-color: #fff;
        padding: 30px;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin: 20px auto;
        max-width: 800px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        text-align: center;
        margin-bottom: 30px;
    }

    .header img {
        max-width: 100px;
        height: auto;
        margin-bottom: 15px;
    }

    .header h1 {
        font-size: 24px;
        font-weight: bold;
        color: #0056b3;
        /* Blue accent color */
    }

    .header p {
        font-size: 16px;
        color: #666;
    }

    .student-info p {
        margin: 5px 0;
        font-size: 14px;
        color: #444;
    }

    .student-info strong {
        color: #0056b3;
        /* Blue accent color */
    }

    .table th {
        background-color: #0056b3;
        /* Blue accent color */
        color: #fff;
        /* White text for headers */
    }

    .table tr:nth-child(even) {
        background-color: #f1f1f1;
        /* Light gray for even rows */
    }

    .footer {
        text-align: center;
        margin-top: 30px;
        font-size: 14px;
        color: #666;
    }

    .signature-section {
        display: flex;
        justify-content: space-between;
        margin-top: 60px;
    }

    .signature-box {
        width: 45%;
        text-align: center;
    }

    .signature-box p {
        margin: 0;
        font-size: 14px;
        color: #0056b3;
        /* Blue accent color */
    }

    .signature-box .stamp {
        height: 200px;
        /* Reduced height to better fit the stamp */
        margin-top: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .stamp-img {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
    }

    /* Print Styles */
    @media print {
        body {
            background-color: #fff;
            color: #000;
        }

        .transcript-container {
            border: none;
            box-shadow: none;
            padding: 0;
            margin: 0;
        }

        .header img {
            max-width: 80px;
        }

        .header h1 {
            font-size: 20px;
        }

        .header p {
            font-size: 14px;
        }

        .student-info p {
            font-size: 12px;
        }

        .table th,
        .table td {
            padding: 8px;
            font-size: 12px;
        }

        .footer {
            font-size: 12px;
        }

        .signature-box p {
            font-size: 12px;
        }
    }
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
                <?php
                $current_level = null;
                $current_semester = null;
                
                foreach ($grades as $grade):
                    // Check if we need to display a new level/semester header
                    if ($current_level != $grade['student_level'] || $current_semester != $grade['semester']) {
                        $current_level = $grade['student_level'];
                        $current_semester = $grade['semester'];
                        
                        // Display the level/semester header
                        echo '<tr class="level-header bg-primary text-white">';
                        echo '<td colspan="7" class="text-center fw-bold p-3">';  // Added p-3 for padding
                        echo strtoupper($grade['student_level'] . ' LEVEL - ' . $grade['semester'] . ' SEMESTER');
                        echo ' <span class="session-badge bg-light text-dark px-2 py-1 rounded ms-2">' . $grade['session'] . '</span>';
                        echo '</td>';
                        echo '</tr>';
                    }
                ?>
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

        <!-- Footer Section -->
        <div class="footer">
            <!-- Grading System and Degree Classification -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th colspan="3">Grading System</th>
                        <th colspan="2">Degree Classification</th>
                        <th>Abbreviations</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>70-100</td>
                        <td>A</td>
                        <td>5</td>
                        <td>4.50-5.00</td>
                        <td class="text-start">First Class</td>
                        <td class="text-start">TCR: Total Credit Registered</td>
                    </tr>
                    <tr>
                        <td>60-69</td>
                        <td>B</td>
                        <td>4</td>
                        <td>3.50-4.49</td>
                        <td class="text-start">Second Class Upper</td>
                        <td class="text-start">TCE: Total Credit Earned</td>
                    </tr>
                    <tr>
                        <td>50-59</td>
                        <td>C</td>
                        <td>3</td>
                        <td>2.40-3.49</td>
                        <td class="text-start">Second Class Lower</td>
                        <td class="text-start">TWGP: Total Weighted Grade Points</td>
                    </tr>
                    <tr>
                        <td>45-49</td>
                        <td>D</td>
                        <td>2</td>
                        <td>1.50-2.39</td>
                        <td class="text-start">Third Class</td>
                        <td class="text-start">CGPA: Cumulative Grade Point Average</td>
                    </tr>
                    <tr>
                        <td>40-44</td>
                        <td>E</td>
                        <td>1</td>
                        <td>1.00-1.49</td>
                        <td class="text-start">Pass Degree</td>
                        <td class="text-start"></td>
                    </tr>
                    <tr>
                        <td>0-39</td>
                        <td>F</td>
                        <td>0</td>
                        <td>0.00-0.99</td>
                        <td class="text-start">Fail</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

            <!-- Signature and Stamp Section -->
            <div class="signature-section">
                <div class="signature-box">
                    <p>Signature/Stamp of Dean and Date</p>
                    <div class="stamp" style="height: 300px;">
                        <img src="assets/images/dean-stamp.png" alt="Dean's Stamp" class="stamp-img">
                    </div>
                </div>
                <div class="signature-box">
                    <p>Signature/Stamp of Academic Secretary and Date</p>
                    <div class="stamp" style="height: 200px;">
                        <img src="assets/images/registrar-stamp.png" alt="Registrar's Stamp" class="stamp-img">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>