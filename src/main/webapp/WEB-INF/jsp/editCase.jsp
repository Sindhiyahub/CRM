<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Case</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
}

.container {
	max-width: 400px;
	margin-top: 90px;
}

.card {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	background-color: white;
}

.form-label {
	font-weight: bold;
}

.btn-group {
	display: flex;
	justify-content: space-between;
}

.btn {
	margin-left: 190px;
	border-radius: 6px;
}

.modal-footer {
	justify-content: space-between;
}
</style>
</head>
<body>

	<jsp:include page="sidebar.jsp" />

	<div class="container">
		<div class="card">
			<h4 class="text-center mb-4">Edit Case</h4>
			<form action="${pageContext.request.contextPath}/cases/save"
				method="post">
				<input type="hidden" name="id" value="${caseObj.id}">

				<!-- Subject Input -->
				<div class="mb-3">
					<label for="subject" class="form-label">Subject</label> <input
						type="text" class="form-control" id="subject" name="subject"
						value="${caseObj.subject}" required>
				</div>

				<!-- Status Dropdown -->
				<div class="mb-3">
					<label for="status" class="form-label">Status</label> <select
						class="form-select" id="status" name="status" required>
						<option value="Open" ${caseObj.status == 'Open' ? 'selected' : ''}>Open</option>
						<option value="Closed"
							${caseObj.status == 'Closed' ? 'selected' : ''}>Closed</option>
						<option value="In Progress"
							${caseObj.status == 'In Progress' ? 'selected' : ''}>In
							Progress</option>
						<option value="Resolved"
							${caseObj.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
					</select>
				</div>

				<!-- Details Input -->
				<div class="mb-3">
					<label for="details" class="form-label">Details</label>
					<textarea class="form-control" id="details" name="details" rows="3"
						required>${caseObj.details}</textarea>
				</div>

				<!-- Contact and User Selection -->
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="contactId" class="form-label">Contact</label> <select
							class="form-select" id="contactId" name="contactId" required>
							<option value="">-- Select Contact --</option>
							<c:forEach var="contact" items="${contacts}">
								<option value="${contact.id}"
									${contact.id == caseObj.contactId ? 'selected' : ''}>
									${contact.name} (${contact.email})</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-md-6 mb-3">
						<label for="createdBy" class="form-label">Created By</label> <select
							class="form-select" id="createdBy" name="createdBy" required>
							<option value="">-- Select User --</option>
							<c:forEach var="user" items="${users}">
								<option value="${user.id}"
									${user.id == caseObj.createdBy ? 'selected' : ''}>
									${user.username}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<!-- Buttons -->
				<!-- Buttons with proper spacing -->
				<div class="d-flex  mt-1 gap-1">
					<button type="submit" class="btn btn-success">Update Case</button>
					<button type="button" class="btn btn-danger" data-bs-toggle="modal"
						data-bs-target="#deleteModal">Delete</button>
					<a href="${pageContext.request.contextPath}/cases"
					class="btn btn-secondary">Cancel</a>
			</div>				
			</form>
		</div>
	</div>

	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure you want to delete this
					case?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<form
						action="${pageContext.request.contextPath}/cases/delete/${caseObj.id}"
						method="post">
						<button type="submit" class="btn btn-danger">Delete</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
