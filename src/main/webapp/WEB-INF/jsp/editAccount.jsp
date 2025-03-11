<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Account</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

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
        margin-top:70px;
            width: 600px;
            padding: 45px;
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

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px;
        }

        .btn {
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            width: 48%;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            width: 70%;
        }
       
        

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-secondary {
            width: 100%;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                width: 90%;
            }

            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<!-- Main Content -->
<div class="card">
    <h2>Edit Account</h2>

    <form action="${pageContext.request.contextPath}/accounts/save" method="post">
        <input type="hidden" name="id" value="${account.id}"/>

        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${account.name}" required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${account.phone}" required>
        </div>

        <div class="mb-3">
            <label for="type" class="form-label">Type</label>
            <input type="text" class="form-control" id="type" name="type" value="${account.type}" required>
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status">
                <option value="Active" ${account.status == 'Active' ? 'selected' : ''}>Active</option>
                <option value="Inactive" ${account.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="billingAddress" class="form-label">Billing Address</label>
            <textarea class="form-control" id="billingAddress" name="billingAddress" required>${account.billingAddress}</textarea>
        </div>

        <!-- Buttons -->
        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-success">Update</button>
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </div>

        <a href="${pageContext.request.contextPath}/accounts" class="btn btn-secondary mt-3">Back to Accounts</a>
    </form>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this account?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <form action="${pageContext.request.contextPath}/accounts/delete/${account.id}" method="post">
                    <button type="submit" class="btn btn-danger">Yes, Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
