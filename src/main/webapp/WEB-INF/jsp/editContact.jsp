<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Contact</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            max-width: 600px;
            margin: auto;
            margin-top: 90px;          
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .form-control {
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp"%>

    <div class="container mt-5">
        <div class="card p-4">
            <h2 class="text-center mb-4">Edit Contact</h2>

            <form action="${pageContext.request.contextPath}/contacts/update" method="post">
                <input type="hidden" name="id" value="${contact.id}"/>

                <div class="mb-3">
                    <label for="name" class="form-label fw-semibold">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${contact.name}" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-semibold">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${contact.email}" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label fw-semibold">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${contact.phone}" required>
                </div>

                <div class="mb-3">
                    <label for="accountId" class="form-label fw-semibold">Account</label>
                    <select class="form-control" id="accountId" name="accountId" required>
                        <option value="">Select Account</option>
                        <c:forEach var="account" items="${accounts}">
                            <option value="${account.id}" ${contact.accountId == account.id ? 'selected' : ''}>
                                ${account.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-primary w-50">Update</button>
                    <a href="${pageContext.request.contextPath}/contacts" class="btn btn-secondary w-50 ms-2">Cancel</a>
                </div>
            </form>

            <hr class="my-4">

            <!-- Delete Button Triggers Modal -->
            <button type="button" class="btn btn-danger w-100" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                Delete Contact
            </button>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this contact?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="${pageContext.request.contextPath}/contacts/delete/${contact.id}" method="post">
                        <button type="submit" class="btn btn-danger">Confirm Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
