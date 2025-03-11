<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Lead</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container mt-4">
		<h2>Edit Lead</h2>
		<form action="${pageContext.request.contextPath}/updateLead"
			method="post">
			<input type="hidden" name="leadId" value="${lead.id}">
			<div class="row g-3">
				<div class="col-md-4">
					<label for="name" class="form-label">Name</label> <input
						type="text" name="name" id="name" class="form-control"
						value="${lead.name}" required>
				</div>
				<div class="col-md-4">
					<label for="email" class="form-label">Email</label> <input
						type="email" name="email" id="email" class="form-control"
						value="${lead.email}" required>
				</div>
				<div class="col-md-4">
					<label for="phone" class="form-label">Phone</label> <input
						type="text" name="phone" id="phone" class="form-control"
						value="${lead.phone}" required>
				</div>
				<div class="col-md-4">
					<label for="company" class="form-label">Company</label> <input
						type="text" name="company" id="company" class="form-control"
						value="${lead.company}">
				</div>
				<div class="col-md-4">
					<label for="source" class="form-label">Source</label> <input
						type="text" name="source" id="source" class="form-control"
						value="${lead.source}">
				</div>
				<div class="col-md-4">
					<label for="industry" class="form-label">Industry</label> <input
						type="text" name="industry" id="industry" class="form-control"
						value="${lead.industry}">
				</div>
				<div class="col-md-4">
					<label for="title" class="form-label">Title</label> <input
						type="text" name="title" id="title" class="form-control"
						value="${lead.title}">
				</div>
				<div class="col-md-4">
					<label for="assignedTo" class="form-label">Assigned To</label> <select
						name="assignedTo" class="form-select">
						<c:forEach items="${users}" var="user">
							<option value="${user.id}"
								${user.id == lead.assignedTo ? 'selected' : ''}>${user.id}-${user.username}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4">
					<label for="status" class="form-label">Status</label> <select
						name="status" id="status" class="form-select" required>
						<option value="New" ${lead.status == 'New' ? 'selected' : ''}>New</option>
						<option value="Contacted"
							${lead.status == 'Contacted' ? 'selected' : ''}>Contacted</option>
						<option value="Qualified"
							${lead.status == 'Qualified' ? 'selected' : ''}>Qualified</option>
						<option value="Closed"
							${lead.status == 'Closed' ? 'selected' : ''}>Closed</option>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-primary mt-3">Update
				Lead</button>
			<a href="${pageContext.request.contextPath}/leads"
				class="btn btn-secondary mt-3">Cancel</a>
		</form>
	</div>

</body>
</html>
