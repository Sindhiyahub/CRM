<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Opportunity</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* Custom Styling */
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 500px;
            margin-top: 170px;
        }

        .card {
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            background: white;
        }

        h3 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn {
            border-radius: 8px;
            font-size: 14px;
       width:50%;
	margin-left: 190px;
	
}

        .btn-primary {
            background-color: #5a67d8;
            border: none;
        }

        .btn-primary:hover {
            background-color: #4c51bf;
        }

        .btn-danger {
            background-color: #ff6b6b;
            border: none;
        }

        .btn-danger:hover {
            background-color: #ff4f4f;
        }

        .modal-content {
            border-radius: 10px;
        }
    </style>

    <!-- Bootstrap & jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="container">
 <h3> Edit Opportunity</h3>
    <div class="card">
       
        
  <form action="${pageContext.request.contextPath}/opportunities/update" method="post">
    <input type="hidden" name="id" value="${opportunity.id}">

    <div class="row">
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

 

            <!-- Form Buttons -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Update Opportunity</button>
                
                <!-- Delete Button (Opens Modal) -->
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    <i class="fa fa-trash"></i> Delete
                </button>

                <a href="${pageContext.request.contextPath}/opportunities" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
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
                Are you sure you want to delete this opportunity: <b>${opportunity.name}</b>?
            </div>
            <div class="modal-footer">
                <form id="deleteForm" action="${pageContext.request.contextPath}/opportunities/delete/${opportunity.id}" method="post">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Yes, Delete</button>
                </form>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
