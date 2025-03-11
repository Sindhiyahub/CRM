<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Opportunity</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<style>
        /* Custom Styling */
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 500px;
            margin-top: 120px;
        }

        .card {
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            background: white;
        }
         h2 {
            text-align: center;
            color: #333;
        }
       </style>


</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="container">
        <div class="card">
    <h2>Add Opportunity</h2>
    <form action="${pageContext.request.contextPath}/opportunities/save" method="post">
        <input type="hidden" name="id" value="${opportunity.id}">

        <div class="row">
            <!-- Left Column -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="name" class="form-label">Opportunity Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${opportunity.name}" required>
                </div>
                <div class="mb-3">
                    <label for="value" class="form-label">Opportunity Value</label>
                    <input type="number" class="form-control" id="value" name="value" value="${opportunity.value}" required>
                </div>
                <div class="mb-3">
                    <label for="stage" class="form-label">Stage</label>
                    <input type="text" class="form-control" id="stage" name="stage" value="${opportunity.stage}" required>
                </div>
                <div class="mb-3">
                    <label for="closingDate" class="form-label">Closing Date</label>
                    <input type="date" class="form-control" id="closingDate" name="closingDate" value="${opportunity.closingDate}" required>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="probability" class="form-label">Probability (%)</label>
                    <input type="number" class="form-control" id="probability" name="probability" value="${opportunity.probability}" required>
                </div>
                <div class="mb-3">
                    <label for="accountId" class="form-label">Account</label>
                    <select class="form-control" id="accountId" name="accountId" required>
                        <c:forEach var="account" items="${accounts}">
                            <option value="${account.id}" ${account.id == opportunity.accountId ? 'selected' : ''}>
                                ${account.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="assignedTo" class="form-label">Assigned To</label>
                    <select class="form-control" id="assignedTo" name="assignedTo" required>
                        <c:forEach var="user" items="${users}">
                            <option value="${user.id}" ${user.id == opportunity.assignedTo ? 'selected' : ''}>
                                ${user.username}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="createdAt" class="form-label">Lead Source</label>
                    <select class="form-control" id="createdAt" name="createdAt" required>
                        <c:forEach var="lead" items="${leads}">
                            <option value="${lead.id}" ${lead.id == opportunity.createdAt ? 'selected' : ''}>
                                ${lead.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>

        <!-- Buttons -->
        <div class="mt-4">
            <button type="submit" class="btn btn-primary">Add Opportunity</button>
            <a href="${pageContext.request.contextPath}/opportunities" class="btn btn-secondary">Cancel</a>

           
        </div>
    </form>
</div>
</div>


</body>
</html>
