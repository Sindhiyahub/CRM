<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Campaign</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
        top:80px;
            max-width: 800px;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-group {
        margin-left:270px;
            display: flex;
            justify-content: center;
            gap: 70px;
            padding:10px;
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp" %>

    <div class="container mt-5">
        <div class="card">
            <h2 class="text-center mb-4">Add New Campaign</h2>

            <form action="${pageContext.request.contextPath}/save" method="post" class="needs-validation" novalidate>
                <div class="row">
                    <!-- Left Column -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Name:</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Description:</label>
                            <textarea name="description" class="form-control"></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Start Date:</label>
                            <input type="date" name="startDate" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">End Date:</label>
                            <input type="date" name="endDate" class="form-control">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Budget:</label>
                            <input type="number" name="budget" step="0.01" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Status:</label>
                            <select name="status" class="form-select">
                                <option value="Planned">Planned</option>
                                <option value="Ongoing">Ongoing</option>
                                <option value="Completed">Completed</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Campaign Type:</label>
                            <input type="text" name="campaignType" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Created By:</label>
                            <select name="createdBy" class="form-select">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.id}">${user.username}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="btn-group mt-4">
                    <button type="submit" class="btn btn-primary w-50">Save</button>
                    <a href="${pageContext.request.contextPath}/campaigns" class="btn btn-secondary w-50">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
