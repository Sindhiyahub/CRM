<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage User</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #f5f6fa;
            font-family: 'Arial', sans-serif;
        }
        
          .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 600px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background: white;
        }
        .form-control {
            border-radius: 6px;
        }
        .btn-custom {
            width: 20%;
            border-radius: 6px;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
            border-radius: 6px;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="container">
<div class="card">
    <h4 class="text-center text-primary mb-3">Manage User</h4>

    <!-- Back Button -->
    <a href="userManagement.jsp" class="btn btn-back btn-sm mb-3">
        ⬅ Back to Users
    </a>

    <!-- User Edit Form -->
    <form action="updateUser" method="post">
        <input type="hidden" name="userId" value="${user.id}" />
        
        <div class="mb-2">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" value="${user.username}" required />
        </div>

        <div class="mb-2">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="${user.email}" required />
        </div>

        <div class="mb-2">
            <label class="form-label">Role</label>
            <select class="form-control" name="role">
                <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
                <option value="User" ${user.role == 'User' ? 'selected' : ''}>User</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Status</label>
            <select class="form-control" name="active">
                <option value="true" ${user.active ? 'selected' : ''}>Active</option>
                <option value="false" ${!user.active ? 'selected' : ''}>Inactive</option>
            </select>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-success btn-custom">Update</button>
            <button type="button" class="btn btn-danger btn-custom" onclick="showDeleteModal(${user.id})">Delete</button>
        </div>
    </form>
      </div>
</div>

<!-- ✅ Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <span class="text-danger fs-4">⚠️</span> Are you sure you want to delete this user?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>

<script>
    function showDeleteModal(userId) {
        var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        document.getElementById('confirmDeleteBtn').href = "deleteUser?userId=" + userId;
        deleteModal.show();
    }
</script>

</body>
</html>
