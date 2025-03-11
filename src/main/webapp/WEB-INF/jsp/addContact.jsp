<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Contact</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 450px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background: white;
        }

        .card h4 {
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
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .form-footer {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="container">
    <div class="card">
        <h4>Add New Contact</h4>
        <form action="${pageContext.request.contextPath}/save" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>

            <div class="mb-3">
                <label for="accountId" class="form-label">Account</label>
                <select class="form-select" id="accountId" name="accountId" required>
                    <option value="">-- Select Account --</option>
                    <c:forEach var="account" items="${accounts}">
                        <option value="${account.id}">${account.id} - ${account.name} - ${account.status}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-footer">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="${pageContext.request.contextPath}/contacts" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
