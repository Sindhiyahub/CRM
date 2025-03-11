<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Quote</title>

    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
     body {
    background-color: #f8f9fa;
    height: 100vh; /* Full screen height */
    display: flex;
    align-items: center; /* Center vertically */
    justify-content: center; /* Center horizontally */
}

   .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
        margin-top:70px;
            width: 600px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background: white;
        }


        h2 {
            color: #343a40;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        textarea {
            resize: none;
            height: 100px;
        }

        .btn {
        margin-left:60px;
            border-radius: 6px;
        }

        .btn-success {
            width: 50%;
            font-size: 16px;
        }

        .btn-secondary {
            width: 50%;
            font-size: 16px;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <%@ include file="sidebar.jsp" %>

    <div class="container">
    <div class="card">
        <h2>Add New Quote</h2>

        <form action="save" method="post">
            <div class="mb-3">
                <label class="form-label">Opportunity:</label>
                <select name="opportunityId" class="form-select" required>
                    <option value="" disabled selected>Select Opportunity</option>
                    <c:forEach var="opportunity" items="${opportunities}">
                        <option value="${opportunity.id}">${opportunity.id} - ${opportunity.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Amount:</label>
                <input type="number" name="amount" class="form-control" step="0.01" required placeholder="Enter quote amount">
            </div>

            <div class="mb-3">
                <label class="form-label">Description:</label>
                <textarea name="description" class="form-control" placeholder="Enter description"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Status:</label>
                <select name="status" class="form-select" required>
                    <option value="Pending">Pending</option>
                    <option value="Approved">Approved</option>
                    <option value="Rejected">Rejected</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Approved By:</label>
                <select name="approvedBy" class="form-select" required>
                    <option value="" disabled selected>Select User</option>
                    <c:forEach var="user" items="${users}">
                        <option value="${user.id}">${user.id} - ${user.username}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="col-md-6">
                    <a href="${pageContext.request.contextPath}/quotes" class="btn btn-secondary">Cancel</a>
                </div>
            </div>
        </form>
    </div>
    </div>

</body>
</html>
