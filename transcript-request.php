<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Transcript Request Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material UI Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
    body {
      background-color: #f9f9f9;
    }
    .form-section {
      background: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .status-section {
      background: #fff3cd;
      border: 1px solid #ffeeba;
      border-radius: 8px;
      padding: 15px;
    }
    .btn-custom {
      background-color: #4caf50;
      color: white;
    }
    .btn-custom:hover {
      background-color: #45a049;
    }
    .file-input-label {
      display: flex;
      align-items: center;
      gap: 10px;
    }
  </style>
</head>
<body>
  <div class="container my-5">
    <h1 class="text-center mb-4">Request Your Transcript</h1>

    <!-- Form Section -->
    <div class="form-section mb-5">
      <h4 class="mb-3">Transcript Request Form</h4>
      <form id="transcriptForm">
        <!-- Personal Details -->
        <div class="mb-3">
          <label for="studentName" class="form-label">Full Name</label>
          <input type="text" class="form-control" id="studentName" placeholder="Enter your full name" required>
        </div>
        <div class="mb-3">
          <label for="studentEmail" class="form-label">Email Address</label>
          <input type="email" class="form-control" id="studentEmail" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
          <label for="studentID" class="form-label">Student ID</label>
          <input type="text" class="form-control" id="studentID" placeholder="Enter your student ID" required>
        </div>

        <!-- Delivery Type -->
        <div class="mb-3">
          <label class="form-label">Delivery Type</label>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="deliveryType" id="emailDelivery" value="Email" required>
            <label class="form-check-label" for="emailDelivery">
              Email <span class="material-icons text-primary">email</span>
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="dispatch" id="dispatch" value="Dispatch">
            <label class="form-check-label" for="dispatch">
              Dispatch <span class="material-icons text-secondary">local_shipping</span>
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="deliveryType" id="pickupDelivery" value="Pickup">
            <label class="form-check-label" for="pickupDelivery">
              Pickup <span class="material-icons text-success">assignment_return</span>
            </label>
          </div>
        </div>

        <!-- Supporting Documents -->
        <div class="mb-3">
          <label class="form-label file-input-label">
            Supporting Documents (if required)
            <span class="material-icons text-primary">upload</span>
          </label>
          <input type="file" class="form-control" id="supportingDocument">
        </div>

        <!-- Payment Method Placeholder -->
        <div class="mb-3">
          <label class="form-label">Payment Method</label>
          <select class="form-select" id="paymentMethod" required>
            <option value="">Select a payment method</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="PayPal">PayPal</option>
          </select>
        </div>

        <button type="submit" class="btn btn-custom w-100">Submit Request</button>
      </form>
    </div>

    <!-- Status Tracking Section -->
    <div class="status-section">
      <h5>Request Status</h5>
      <ul id="statusList" class="list-group mt-3">
        <li class="list-group-item d-none">
          <strong>Request #12345</strong> - Pending
          <span class="badge bg-warning text-dark">In Process</span>
        </li>
        <li class="list-group-item">
          <strong>Request #12344</strong> - Approved
          <span class="badge bg-success">Completed</span>
        </li>
        <li class="list-group-item d-none">
          <strong>Request #12343</strong> - Rejected
          <span class="badge bg-danger">Error</span>
        </li>
      </ul>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Custom JavaScript -->
  <script>
    document.getElementById('transcriptForm').addEventListener('submit', function (event) {
      event.preventDefault();
      alert('Your request has been submitted successfully!');
    });
  </script>
</body>
</html>
