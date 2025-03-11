<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Lead</title>
<style type="text/css">
     .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 1200px;
            padding: 45px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background: white;
        }
</style>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<jsp:include page="sidebar.jsp" />

	<div class="container mt-4">
	<div class="card">
	
		<h2>Add New Lead</h2>
		<form action="addLead" method="post">
			<div class="row g-3">
				<div class="col-md-4">
					<label for="name" class="form-label">Name</label> <input
						type="text" name="name" id="name" class="form-control" required>
				</div>
				<div class="col-md-4">
					<label for="email" class="form-label">Email</label> <input
						type="email" name="email" id="email" class="form-control" required>
				</div>
				<div class="col-md-4">
					<label for="phone" class="form-label">Phone</label> <input
						type="text" name="phone" id="phone" class="form-control" required>
				</div>
				<div class="col-md-4">
					<label for="company" class="form-label">Company</label> <input
						type="text" name="company" id="company" class="form-control">
				</div>
				<div class="col-md-4">
					<label for="source" class="form-label">Source</label> <input
						type="text" name="source" id="source" class="form-control">
				</div>
				<div class="col-md-4">
					<label for="industry" class="form-label">Industry</label> <input
						type="text" name="industry" id="industry" class="form-control">
				</div>
				<div class="col-md-4">
					<label for="title" class="form-label">Title</label> <input
						type="text" name="title" id="title" class="form-control">
				</div>
				<div class="col-md-4">
					<label for="assignedTo" class="form-label">Assigned To</label> <select
						name="assignedTo" class="form-select">
						<c:forEach items="${users}" var="user">
							<option value="${user.id}">${user.id}-${user.username}</option>
						</c:forEach>
					</select>
				</div>

				<div class="col-md-4">
					<label for="status" class="form-label">Status</label> <select
						name="status" id="status" class="form-select" required>
						<option value="New">New</option>
						<option value="Contacted">Contacted</option>
						<option value="Qualified">Qualified</option>
						<option value="Closed">Closed</option>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-success mt-3">Add Lead</button>
			<a href="${pageContext.request.contextPath}/leads"
				class="btn btn-secondary mt-3">Cancel</a>
		</form>
	</div>
</div>
</body>
</html>
