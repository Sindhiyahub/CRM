<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Campaign</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
        margin-top:90px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-primary, .btn-secondary {
            width: 150px;
        }
        .btn-danger {
            background-color: #f8d7da;
            color: #dc3545;
            border: none;
            width: 150px;
        }
        .btn-danger:hover {
            background-color: #dc3545;
            color: #fff;
        }
        .form-control, .form-select {
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp"%>

    <div class="container mt-5">
        <div class="card p-4">
            <h2 class="text-center mb-4">Edit Campaign</h2>

            <form action="../save" method="post">
                <input type="hidden" name="id" value="${campaign.id}">

                <div class="row">
                    <!-- Left Column -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Name:</label>
                            <input type="text" name="name" value="${campaign.name}" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Description:</label>
                            <textarea name="description" class="form-control">${campaign.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Start Date:</label>
                            <input type="date" name="startDate" value="${campaign.startDate}" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">End Date:</label>
                            <input type="date" name="endDate" value="${campaign.endDate}" class="form-control">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Budget:</label>
                            <input type="number" name="budget" step="0.01" value="${campaign.budget}" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Status:</label>
                            <select name="status" class="form-select">
                                <option value="Planned" ${campaign.status == 'Planned' ? 'selected' : ''}>Planned</option>
                                <option value="Ongoing" ${campaign.status == 'Ongoing' ? 'selected' : ''}>Ongoing</option>
                                <option value="Completed" ${campaign.status == 'Completed' ? 'selected' : ''}>Completed</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Campaign Type:</label>
                            <input type="text" name="campaignType" value="${campaign.campaignType}" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Created By:</label>
                            <select name="createdBy" class="form-select">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.id}" ${user.id == campaign.createdBy ? 'selected' : ''}>${user.username}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Buttons: Centered and Subtle -->
                <div class="d-flex justify-content-center gap-3 mt-4">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="${pageContext.request.contextPath}/campaigns" class="btn btn-secondary">Cancel</a>
                </div>
            </form>

            <hr class="my-4">

            <!-- Delete Button Triggers Modal -->
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                    Delete Campaign
                </button>
            </div>
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
                <div class="modal-body text-center">
                    <p>Are you sure you want to delete this campaign?</p>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="${pageContext.request.contextPath}/campaigns/delete/${campaign.id}" method="post">
                        <button type="submit" class="btn btn-danger">Confirm Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
