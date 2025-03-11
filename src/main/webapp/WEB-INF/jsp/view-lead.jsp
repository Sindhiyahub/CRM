<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Lead</title>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.lead-container {
margin-top:110px;
margin-left:90px;
	max-width: 1100px;
	
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
	border: 1px solid #dee2e6;
	padding: 20px;
}

/* Styling for Tabs and Convert Button */
.tab-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: silver;
	padding: 10px 20px;
	border-radius: 15px;
	margin-bottom: 20px;
	border-top-left-radius: 50px;
	border-bottom-right-radius: 50px;
}

.tab-buttons button {
	border-radius: 20px;
	padding: 8px 20px;
	border: none;
	background-color: #d3d3d3;
	font-size: 16px;
	font-weight: 500;
	color: #343a40;
	transition: 0.3s;
}

.tab-buttons button.active {
	background-color: #007bff;
	color: white;
}

.convert-button {
	background-color: white;
	color: black;
	padding: 8px 15px;
	border-radius: 20px;
	font-weight: bold;
	transition: 0.3s;
}

.convert-button:hover {
	color: grey;
	
}

.lead-info {
	display: flex;
	gap: 20px;
	padding-top: 20px;
}

.lead-details {
	flex: 3;
	margin-left: 100px;
}

.lead-summary {
	flex: 1;
	background: #f1f3f5;
	padding: 15px;
	border-radius: 8px;
	margin-right: 100px;
}

.lead-summary p {
	font-size: 14px;
	color: #495057;
}

.lead-heading {
	margin-left: -30px; /* Adjust as needed */
	font-weight: bold;
}

.lead-subheading {
	margin-left: -30px; /* Same left alignment as h3 */
	font-weight: normal;
	color: gray;
}

.lead-item {
	margin-left: 10px; /* Shift all <p> tags slightly to the right */
}

.lead-item {
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 16px;
	padding: 5px 0;
}

.lead-item i {
	color: #007bff;
}

.action-buttons {
	margin-top: 15px;
	display: flex;
	gap: 30px;
		margin-left: -30px; /* Same left alignment as h3 */
	
}

.action-buttons button, .action-buttons a {
	border-radius: 8px;
	padding: 8px 15px;
}
</style>
</head>
<body>

	<jsp:include page="sidebar.jsp" />

	<div class="container mt-4">
		<div class="lead-container">
			<!-- Tab and Convert Button Row -->
			<div class="tab-container">
				<div class="tab-buttons">
					<button class="active">Overview</button>
				</div>
				<button type="button" class="convert-button" data-bs-toggle="modal"
					data-bs-target="#confirmConvertModal">Convert to Account &
					Contact</button>
			</div>

			<!-- Lead Information -->
			<div class="lead-info">
				<!-- Lead Details -->
				<div class="lead-details">
					<h3 class="lead-heading">${lead.name}</h3>
					<h5 class="lead-subheading">
						<p>${lead.title}</p>
					</h5>
					<p class="lead-item">
						<i class="fas fa-envelope"></i> <strong>Email:</strong>
						${lead.email}
					</p>
					<p class="lead-item">
						<i class="fas fa-phone"></i> <strong>Phone:</strong> ${lead.phone}
					</p>
					<p class="lead-item">
						<i class="fas fa-building"></i> <strong>Company:</strong>
						${lead.company}
					</p>
					<p class="lead-item">
						<i class="fas fa-chart-line"></i> <strong>Status:</strong>
						${lead.status}
					</p>
					<p class="lead-item">
						<i class="fas fa-industry"></i> <strong>Industry:</strong>
						${lead.industry}
					</p>
					<p class="lead-item">
						<i class="fas fa-user-tie"></i> <strong>Assigned To:</strong>
						${lead.assignedTo}
					</p>

					<!-- Action Buttons -->
					<div class="action-buttons">
						<!-- Delete Button -->
						<button type="button" class="btn btn-danger btn-sm"
							data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
							Delete</button>

						<!-- Edit & Back Buttons -->
						<a href="${pageContext.request.contextPath}/editLead/${lead.id}"
							class="btn btn-primary btn-sm"> <i class="fas fa-edit"></i>
							Edit
						</a> <a href="${pageContext.request.contextPath}/leads"
							class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left"></i>
							Back to Leads </a>
					</div>
				</div>

				<!-- Lead Summary -->
				<div class="lead-summary">
					<h5>Best Time For</h5>
					<p>
						<strong>Call:</strong> No best time for the day
					</p>
					<p>
						<strong>Email:</strong> No best time for the day
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Convert Confirmation Modal -->
	<div class="modal fade" id="confirmConvertModal" tabindex="-1"
		aria-labelledby="confirmConvertModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Confirm Conversion</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<h4 class="text-center fw-bold text-primary">Convert Lead</h4>
					<p class="text-center text-muted">(${lead.company} -
						${lead.name})</p>

					<!-- Lead Summary Section -->
					<div class="lead-summary bg-light p-3 rounded">
						<div class="p-2 bg-white shadow-sm rounded mb-3">
							<h6 class="fw-bold text-secondary mb-1">Create New Account</h6>
							<p class="mb-0">
								<i class="fas fa-building text-primary"></i> ${lead.company}
							</p>
						</div>

						<div class="p-2 bg-white shadow-sm rounded mb-3">
							<h6 class="fw-bold text-secondary mb-1">Create New Contact</h6>
							<p class="mb-0">
								<i class="fas fa-user text-success"></i> ${lead.name}
							</p>
						</div>


						<div class="p-2 bg-white shadow-sm rounded mb-3">
							<h6 class="fw-bold text-secondary mb-1">Phone</h6>
							<p class="mb-0">${lead.phone}</p>
						</div>
						<br>

					</div>
				</div>

				<div class="modal-footer">
					<button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					<form
						action="${pageContext.request.contextPath}/convertToAccountContact/${lead.id}"
						method="post">
						<button type="submit" class="btn btn-success">Confirm</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
		aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Confirm Deletion</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to delete this lead?</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					<form action="deleteLead" method="post">
						<input type="hidden" name="leadId" value="${lead.id}">
						<button type="submit" class="btn btn-danger">Confirm
							Delete</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
