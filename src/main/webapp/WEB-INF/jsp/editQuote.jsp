<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Quote</title>

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
            text-align: center;
            color: #343a40;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
        }

        .btn-container .btn {
            width: 48%;
        }
        

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 20px;
            }
            
            .btn-container {
                flex-direction: column;
                gap: 10px;
            }

            .btn-container .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <%@ include file="sidebar.jsp"%>

    <div class="container">
    <div class="card">
        <h2>Edit Quote</h2>
        
        <!-- Edit Quote Form -->
        <form action="../update" method="post">
            <input type="hidden" name="id" value="${quote.id}">

            <div class="mb-3">
                <label class="form-label">Opportunity:</label>
                <select name="opportunityId" class="form-select" required>
                    <c:forEach var="opportunity" items="${opportunities}">
                        <option value="${opportunity.id}" ${opportunity.id == quote.opportunityId ? 'selected' : ''}>
                            ${opportunity.id} - ${opportunity.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Amount:</label>
                <input type="number" name="amount" class="form-control" step="0.01" value="${quote.amount}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description:</label>
                <textarea name="description" class="form-control">${quote.description}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Status:</label>
                <select name="status" class="form-select">
                    <option value="Pending" ${quote.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Approved" ${quote.status == 'Approved' ? 'selected' : ''}>Approved</option>
                    <option value="Rejected" ${quote.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Approved By:</label>
                <select name="approvedBy" class="form-select">
                    <c:forEach var="user" items="${users}">
                        <option value="${user.id}" ${user.id == quote.approvedBy ? 'selected' : ''}>
                            ${user.id} - ${user.username}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- Buttons: Update, Delete (opens modal), Cancel -->
            <div class="btn-container">
                <button type="submit" class="btn btn-warning">Update</button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    Delete
                </button>
            </div>

            <div class="mt-3 text-center">
                <a href="${pageContext.request.contextPath}/quotes" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this quote?
                </div>
                <div class="modal-footer">
                    <form action="../delete" method="post">
                        <input type="hidden" name="id" value="${quote.id}">
                        <button type="submit" class="btn btn-danger">Yes, Delete</button>
                    </form>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS for modal functionality -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
