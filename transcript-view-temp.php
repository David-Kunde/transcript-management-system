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

// Fetch grades data using the Student_ID including session and semester
$student_id = $student['Student_ID']; // Student's ID
$grades_query = "SELECT grades.*, courses.courseTitle 
                 FROM grades 
                 JOIN courses ON grades.course_code = courses.courseCode 
                 WHERE grades.student_ID = :student_id
                 ORDER BY grades.session ASC, 
                 CASE grades.semester
                    WHEN 'First Semester' THEN 1
                    WHEN 'Second Semester' THEN 2
                    ELSE 3
                 END ASC";
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

// Organize grades by level and semester
$organized_grades = [];
foreach ($grades as $grade) {
    $session = $grade['session'];
    $semester = $grade['semester']; 
    $level = substr($session, 0, 3) . 'L'; // Extract level from session, e.g., "100" from "100L"
    
    $key = $level . ' ' . $semester;
    
    if (!isset($organized_grades[$key])) {
        $organized_grades[$key] = [];
    }
    
    $organized_grades[$key][] = $grade;
}

// Sort keys to ensure proper ordering
uksort($organized_grades, function($a, $b) {
    $level_a = intval(substr($a, 0, 3));
    $level_b = intval(substr($b, 0, 3));
    
    if ($level_a != $level_b) {
        return $level_a - $level_b;
    }
    
    $sem_a = (strpos($a, 'First') !== false) ? 1 : 2;
    $sem_b = (strpos($b, 'First') !== false) ? 1 : 2;
    
    return $sem_a - $sem_b;
});
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

    .table tr