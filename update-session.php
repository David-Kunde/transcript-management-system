<?php
// 1. Connect to database
$db = new PDO("mysql:host=localhost;dbname=transcript_management", "root", "");
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

echo "Database connected.<br>";

// 2. Fetch ALL records (to verify updates)
$students = $db->query("SELECT grade_ID, student_ID, exam_year, session FROM grades")->fetchAll(PDO::FETCH_ASSOC);

if (empty($students)) {
    die("No records found.");
}

// 3. Prepare UPDATE statement
$update = $db->prepare("UPDATE grades SET session = ? WHERE grade_ID = ?");
$updated = 0;

// 4. Update each record
foreach ($students as $student) {
    $correctSession = $student['exam_year'] . '/' . ($student['exam_year'] + 1);
    
    // Only update if current session is wrong
    if ($student['session'] != $correctSession) {
        $update->execute([$correctSession, $student['grade_ID']]);
        $updated++;
        echo "Updated grade_ID {$student['grade_ID']}: {$student['session']} → $correctSession<br>";
    }
}

echo "<br><strong>Total corrected sessions: $updated</strong>";