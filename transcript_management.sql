-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2025 at 05:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transcript_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Admin_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Permissions` varchar(255) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL,
  `courseCode` varchar(10) NOT NULL,
  `courseTitle` varchar(255) NOT NULL,
  `creditUnits` int(11) NOT NULL,
  `course_type_for_computer` enum('core','elective','gst') DEFAULT NULL,
  `course_type_for_mathematics` enum('core','elective','gst') DEFAULT NULL,
  `course_type_for_statistics` enum('core','elective','gst') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `courseCode`, `courseTitle`, `creditUnits`, `course_type_for_computer`, `course_type_for_mathematics`, `course_type_for_statistics`) VALUES
(0, 'STA 406', 'Research Project', 6, 'core', 'core', 'core'),
(1, 'STA 111', 'Probability', 4, '', '', 'core'),
(2, 'MTH 101', 'Elementary Mathematics I', 3, 'core', 'core', 'core'),
(3, 'CMP 101', 'Introduction to Computer Science', 2, 'core', 'core', 'core'),
(4, 'BIO 101', 'General Biology', 3, 'core', 'core', 'core'),
(5, 'CHM 101', 'General Physical Chemistry', 2, 'core', 'core', 'core'),
(6, 'CHM 141', 'First Year Practical Chemistry I', 1, 'core', 'core', 'core'),
(7, 'PHY 101', 'Mechanics and Waves', 2, 'core', 'core', 'core'),
(8, 'PHY 105', 'Physics Laboratory I', 1, 'core', 'core', 'core'),
(9, 'GST 111', 'Communication in English I', 2, 'gst', 'gst', 'gst'),
(10, 'GST 113', 'Nigeria People and Culture', 2, 'gst', 'gst', 'gst'),
(11, 'GST 121', 'Use of Library, Study Skills and ICT', 2, 'gst', 'gst', 'gst'),
(12, 'STA 112', 'Statistical Inference I', 4, '', 'elective', 'core'),
(13, 'STA 114', 'Descriptive Statistics', 3, '', '', 'core'),
(14, 'STA 124', 'Statistical Computing I', 2, 'elective', NULL, 'core'),
(15, 'MTH 104', 'Elementary Mathematics III', 3, 'core', 'core', 'core'),
(16, 'CMP 102', 'Introduction to Programming', 3, 'core', 'core', 'core'),
(17, 'GST 122', 'Communication in English II', 2, 'gst', 'gst', 'gst'),
(18, 'MTH 102', 'Elementary Mathematics II', 3, 'core', 'core', 'elective'),
(19, 'PHY 102', 'Heat and Properties of Matter', 3, 'core', 'core', 'elective'),
(20, 'STA 211', 'Probability II', 4, '', 'core', 'core'),
(21, 'MTH 201', 'Mathematical Methods I', 3, 'core', 'core', 'core'),
(22, 'MTH 205', 'Linear Algebra I', 2, 'elective', 'core', 'core'),
(23, 'CMP 201', 'Computer Programming I', 3, 'core', 'core', 'core'),
(24, 'PHY 103', 'Electricity and Magnetism', 3, 'core', 'core', 'core'),
(25, 'EPS 201', 'Entrepreneurship Studies I', 2, 'core', 'core', 'core'),
(26, 'STA 201', 'Statistics for Physical Sciences and Engineering', 4, 'core', 'elective', 'core'),
(27, 'STA 203', 'Statistics for Agriculture & Biological Sciences', 4, '', '', 'core'),
(28, 'CMP 203', 'Assembly Language', 2, 'core', 'elective', 'elective'),
(29, 'MTH 203', 'Sets, Logic & Algebra', 3, '', 'core', 'elective'),
(30, 'MTH 207', 'Vector Analysis', 2, '', 'core', ''),
(31, 'STA 212', 'Introduction to Social & Economic Statistics', 3, '', '', 'core'),
(32, 'STA 214', 'Statistical Computing II', 2, '', '', 'core'),
(33, 'STA 222', 'Statistical Inference II', 4, '', '', 'core'),
(34, 'MTH 202', 'Introduction to Numerical Analysis', 3, 'core', 'core', 'core'),
(35, 'MTH 208', 'Elementary Differential Equations', 3, 'core', 'core', 'core'),
(36, 'GST 222', 'Peace Studies and Conflict Resolution', 2, 'core', 'core', 'core'),
(37, 'EPS 202', 'Entrepreneurship Studies II', 2, 'gst', 'gst', 'gst'),
(38, 'BIO 206', 'Biostatistics I', 2, '', '', 'elective'),
(39, 'CMP 202', 'Computer Programming II', 3, 'core', 'core', 'elective'),
(40, 'CMP 210', 'Data Structures', 3, 'core', 'elective', 'elective'),
(41, 'STA 311', 'Probability III', 3, '', '', 'core'),
(42, 'STA 319', 'Statistical Inferences III', 3, '', '', 'core'),
(43, 'STA 321', 'Survey Methods and Sampling Theory', 3, '', '', 'core'),
(44, 'STA 323', 'Design and Analysis of Experiment I', 3, '', '', 'core'),
(45, 'EPS 301', 'Entrepreneurship Studies', 2, 'gst', 'gst', 'gst'),
(46, 'STA 315', 'Regression and Analysis of Variance I', 2, '', '', 'elective'),
(47, 'STA 325', 'Statistical Quality Control', 3, '', '', 'elective'),
(48, 'STA 327', 'Demography I', 3, '', '', 'elective'),
(49, 'MTH 313', 'Introduction to Mathematics Modeling', 3, 'elective', '', 'elective'),
(50, 'MTH 323', 'Numerical Analysis I', 3, 'core', 'core', 'elective'),
(51, 'CMP 315', 'Object Oriented Programming', 3, 'core', '', ''),
(52, 'STA 312', 'Biometric Methods', 3, '', '', 'core'),
(53, 'STA 314', 'Distribution Theory I', 3, '', '', 'core'),
(54, 'STA 318', 'Laboratory/Field Work for Survey Methods and Sampling Theory', 2, '', '', 'core'),
(55, 'STA 320', 'Laboratory/Field Work on Experimental Design I', 2, '', '', 'core'),
(56, 'STA 324', 'Operations Research I', 3, '', '', 'core'),
(57, 'STA 326', 'Statistical Computing III', 2, '', '', 'core'),
(58, 'CMP 264', 'System Analysis and Design', 3, 'core', '', 'core'),
(59, 'STA 302', 'Sequential Methods in Statistics', 3, '', '', 'elective'),
(60, 'STA 304', 'Introduction to Econometrics', 3, '', '', 'elective'),
(61, 'STA 411', 'Probability IV', 3, '', '', 'core'),
(62, 'STA 413', 'Time Series Analysis', 3, '', '', 'core'),
(63, 'STA 417', 'Statistical Inference IV', 3, '', '', 'core'),
(64, 'STA 419', 'Distribution Theory II', 4, '', '', 'core'),
(65, 'STA 421', 'Stochastic Processes', 3, '', '', 'core'),
(66, 'STA 441', 'Multivariate Methods', 3, '', '', 'elective'),
(67, 'STA 443', 'Operations Research II', 3, '', '', 'elective'),
(68, 'STA 451', 'Biometric Method II', 3, '', '', 'elective'),
(69, 'STA 453', 'Bayesian Inference and Decision Theory', 3, '', '', 'elective'),
(70, 'STA 415', 'Regression and Analysis of Variance II', 4, '', '', 'elective'),
(71, 'STA 445', 'Educational Statistics', 3, '', '', 'elective'),
(72, 'STA 457', 'Medical Statistics', 3, '', '', 'elective'),
(73, 'STA 459', 'Demography II', 3, '', '', 'elective'),
(75, 'STA 426', 'Design and Analysis of Experiments II', 3, '', '', 'core'),
(76, 'STA 424', 'Sampling Techniques', 3, '', '', 'core'),
(77, 'STA 422', 'Logical Background of Statistics and Decision Theory', 4, '', '', 'core'),
(78, 'STA 440', 'Multivariate Methods', 3, '', '', 'elective'),
(79, 'STA 442', 'Non-parametric Methods', 3, '', '', 'elective'),
(80, 'STA 444', 'Econometric Methods', 3, '', '', 'elective'),
(81, 'STA 452', 'Psychomental Methods', 3, '', '', 'elective'),
(82, 'STA 454', 'Environmental Statistics', 3, '', '', 'elective'),
(83, 'STA 456', 'Health Statistics', 3, '', '', 'elective'),
(84, 'STA 458', 'Energy Statistics', 3, '', '', 'elective'),
(85, 'MTH 406', 'Project', 6, '', 'core', ''),
(86, 'MTH 404', 'Lebesgue Measure and Integration', 3, '', 'core', ''),
(87, 'MTH 410', 'Complex Analysis', 3, '', 'core', ''),
(88, 'MTH 408', 'Numerical Analysis II', 3, '', 'elective', ''),
(89, 'MTH 412', 'Mathematical Methods III', 3, '', 'elective', ''),
(90, 'MTH 416', 'Measure Theory', 3, '', 'elective', ''),
(91, 'MTH 418', 'Advanced Algebra', 3, '', 'elective', ''),
(92, 'MTH 424', 'History of Mathematics', 3, '', 'elective', ''),
(93, 'MTH 315', 'Discrete Mathematics', 4, 'elective', NULL, NULL),
(94, 'PHY 201', 'Elementry Modern Physics', 2, NULL, 'elective', NULL),
(95, 'PHY 205', 'Thermal Physics I', 2, NULL, 'elective', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `Student_ID` varchar(20) NOT NULL,
  `Course_ID` varchar(20) NOT NULL,
  `Score` float NOT NULL,
  `Grade` varchar(5) DEFAULT NULL,
  `GPA_Points` float DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL,
  `Year` int(11) NOT NULL,
  `Date_Recorded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Admission_year` int(11) DEFAULT NULL,
  `Program` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Department`, `Admission_year`, `Program`, `Email`, `Phone`, `Address`, `Status`) VALUES
('BSU/SC/CMP/19/54286', 'Chibuike Okonkwo', 'Mathematics and Computer Science', 2019, 'BSc. Computer Science', 'chibuikeokonkwo21@bsumail.edu.ng', '07034567890', '15 Makurdi Road, Benue State', 'Graduated'),
('BSU/SC/CMP/20/54289', 'Chinedu Eze', 'Mathematics and Computer Science', 2020, 'BSc. Computer Science', 'chinedueze12@bsumail.edu.ng', '08165432198', '42 High Level Road, Makurdi', 'Student'),
('BSU/SC/CMP/21/54292', 'Ngozi Okafor', 'Mathematics and Computer Science', 2021, 'BSc. Computer Science', 'ngoziokafor33@bsumail.edu.ng', '09056789012', '18 Wurukum Market Area, Makurdi', 'Student'),
('BSU/SC/CMP/22/54295', 'Tunde Bakare', 'Mathematics and Computer Science', 2022, 'BSc. Computer Science', 'tundebakare45@bsumail.edu.ng', '08134567890', '27 Judges Quarters, Makurdi', 'Student'),
('BSU/SC/MTH/19/54288', 'Oluwaseun Adeyemi', 'Mathematics and Computer Science', 2019, 'BSc. Mathematics', 'oluwaseunadeyemi5@bsumail.edu.ng', '09087654321', '23 University Road, Makurdi', 'Student'),
('BSU/SC/MTH/20/54291', 'Ibrahim Abubakar', 'Mathematics and Computer Science', 2020, 'BSc. Mathematics', 'ibrahimabubakar@bsumail.edu.ng', '08176543210', '5 Modern Market Road, Makurdi', 'Student'),
('BSU/SC/MTH/21/54294', 'Halima Mohammed', 'Mathematics and Computer Science', 2021, 'BSc. Mathematics', 'halimamohammed@bsumail.edu.ng', '07062345678', '9 Logo Road, Makurdi', 'Student'),
('BSU/SC/STA/19/54287', 'Adaobi Nwachukwu', 'Mathematics and Computer Science', 2019, 'BSc. Statistics', 'adaobinwachukwu@bsumail.edu.ng', '08123456789', '7 Gboko Street, Makurdi', 'Graduated'),
('BSU/SC/STA/20/54290', 'Funmilayo Ogunlade', 'Mathematics and Computer Science', 2020, 'BSc. Statistics', 'funmilayoogunlade7@bsumail.edu.ng', '07098765432', '10 North Bank Area, Makurdi', 'Student'),
('BSU/SC/STA/21/54293', 'Emeka Nnamdi', 'Mathematics and Computer Science', 2021, 'BSc. Statistics', 'emekannamdi101@bsumail.edu.ng', '08187654321', '32 Nyiman Layout, Makurdi', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `transcript_request`
--

CREATE TABLE `transcript_request` (
  `Request_ID` int(11) NOT NULL,
  `Student_ID` varchar(20) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Date_Requested` date DEFAULT NULL,
  `Date_Processed` date DEFAULT NULL,
  `Admin_ID` int(11) DEFAULT NULL,
  `Purpose` varchar(100) DEFAULT NULL,
  `Format` varchar(50) DEFAULT NULL,
  `Delivery_Method` varchar(50) DEFAULT NULL,
  `Additional_Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `userType` enum('student','admin','','') NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Last_Login` timestamp NULL DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `userType`, `First_Name`, `Middle_Name`, `Last_Name`, `Email`, `Phone_Number`, `Password_Hash`, `Created_At`, `Last_Login`, `Is_Active`) VALUES
(24, 'student', 'chibuikeo', '', 'okonkwo', 'chibuikeokonkwo21@bsumail.edu.ng', '', '$2y$10$FBtAwa4qWgs2ZFBTmzrhg.n0m0sZy/pe1.DkzcCdfCB6YooXfASAm', '2025-02-28 15:45:00', NULL, 1),
(25, 'student', 'chinedue', '', 'eze', 'chinedueze12@bsumail.edu.ng', '08165432198', '$2y$10$t.HQtkeOWj.VWyE38M9JYONxV7.q7nsdNzeuOCfysEVY3tFuoGlzy', '2025-02-28 15:47:07', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`Score`),
  ADD UNIQUE KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `transcript_request`
--
ALTER TABLE `transcript_request`
  ADD PRIMARY KEY (`Request_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Constraints for table `transcript_request`
--
ALTER TABLE `transcript_request`
  ADD CONSTRAINT `transcript_request_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `transcript_request_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
