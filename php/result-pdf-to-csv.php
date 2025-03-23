<?php
require 'vendor/autoload.php';

use Smalot\PdfParser\Parser;

// Function to extract data and save as CSV
function convertPdfToCsv($pdfFile, $csvFile) {
    $parser = new Parser();
    $pdf = $parser->parseFile($pdfFile);
    $text = $pdf->getText();

    // Define the headers we need
    $headers = ['student_number', 'course_code', 'course_title', 'credit_unit', 'status', 'score', 'grade'];

    // Open CSV file for writing
    $file = fopen($csvFile, 'w');
    fputcsv($file, $headers);

    // Extract relevant data
    $lines = explode("\n", $text);
    foreach ($lines as $line) {
        $data = preg_split('/\s{2,}/', trim($line)); // Split by multiple spaces

        // Check if the extracted row matches expected column count
        if (count($data) === count($headers)) {
            fputcsv($file, $data);
        }
    }

    fclose($file);
    echo "CSV file created successfully: $csvFile\n";
}

// Example usage
$pdfFile = '/students-results/bsusccmp19542861001.pdf';  // Change this to your PDF file path
$csvFile = 'student_result.csv';

convertPdfToCsv($pdfFile, $csvFile);
?>