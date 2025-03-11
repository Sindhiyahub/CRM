<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Account</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Background Styling */
        body {
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Card Styling */
        .card {
        top:50px;
            width: 600px;
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            background: white;
        }

        .card h2 {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
            color: #555;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px;
            font-size: 16px;
        }

        /* Button Styling */
        .btn {
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            width: 100%;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-secondary {
            width: 100%;
            margin-top: 10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<!-- Main Content -->
<div class="card">
    <h2>Add New Account</h2>
    
    <form action="${pageContext.request.contextPath}/accounts/save" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Account Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter account name" required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>
        </div>

        <div class="mb-3">
            <label for="type" class="form-label">Type</label>
            <input type="text" class="form-control" id="type" name="type" placeholder="e.g., Customer, Vendor" required>
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status">
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="billingAddress" class="form-label">Billing Address</label>
            <textarea class="form-control" id="billingAddress" name="billingAddress" rows="3" placeholder="Enter billing address" required></textarea>
        </div>

        <button type="submit" class="btn btn-success">Save Account</button>
        <a href="${pageContext.request.contextPath}/accounts" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
