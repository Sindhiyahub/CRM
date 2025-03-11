<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Case</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
        }

        .container {
      	  	margin-top:40px;
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
        <h4>Add New Case</h4>
        <form action="${pageContext.request.contextPath}/cases/save" method="post">
            <input type="hidden" name="id" value="${caseObj.id}">

            <!-- Subject -->
            <div class="mb-3">
                <label for="subject" class="form-label">Subject</label>
                <input type="text" class="form-control" id="subject" name="subject" value="${caseObj.subject}" required>
            </div>

            <!-- Details -->
            <div class="mb-3">
                <label for="details" class="form-label">Details</label>
                <textarea class="form-control" id="details" name="details" rows="3" required>${caseObj.details}</textarea>
            </div>

            <!-- Status Dropdown -->
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="Open" ${caseObj.status == 'Open' ? 'selected' : ''}>Open</option>
                    <option value="Closed" ${caseObj.status == 'Closed' ? 'selected' : ''}>Closed</option>
                    <option value="In Progress" ${caseObj.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                    <option value="Resolved" ${caseObj.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                </select>
            </div>

            <!-- Contact Dropdown -->
            <div class="mb-3">
                <label for="contactId" class="form-label">Contact</label>
                <select class="form-select" id="contactId" name="contactId" required>
                    <option value="">-- Select Contact --</option>
                    <c:forEach var="contact" items="${contacts}">
                        <option value="${contact.id}" ${contact.id == caseObj.contactId ? 'selected' : ''}>
                            ${contact.name} (${contact.email})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- Assigned User Dropdown -->
            <div class="mb-3">
                <label for="createdBy" class="form-label">Assigned User</label>
                <select class="form-select" id="createdBy" name="createdBy" required>
                    <option value="">-- Select User --</option>
                    <c:forEach var="user" items="${users}">
                        <option value="${user.id}" ${user.id == caseObj.createdBy ? 'selected' : ''}>
                            ${user.username}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- Buttons -->
            <div class="form-footer">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="${pageContext.request.contextPath}/cases" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
