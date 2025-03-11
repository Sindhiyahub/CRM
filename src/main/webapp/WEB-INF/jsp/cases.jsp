<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cases List</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css">


    <style>
      .container {
            margin-top: 120px;
            max-width: 1200px;
        }
      
        .custom-table {
            border-collapse: collapse;
            width: 100%;
        }

        .custom-table thead {
            
            color: black;
        }

        .custom-table th {
            padding: 12px;
            border-bottom: 2px solid #ddd;
            text-align: left;
        }

        .custom-table td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

  
        .custom-table tbody tr:hover {
            background-color: #f5f5f5;
        }

        .table-responsive {
            overflow-x: auto;
        }
    </style>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#casesTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [ 10, 25, 50, 100],
                "responsive": true,
                "columnDefs": [
                    { "orderable": false, "targets": [5] }
                ]
            });
        });
    </script>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mb-0">Cases List</h2>
        <a href="${pageContext.request.contextPath}/cases/add" class="btn btn-primary">+ Add Case</a>
    </div>

    <div class="table-responsive">
        <table id="casesTable" class="custom-table">
            <thead>
                <tr>
                    <th>Case ID</th>
                    <th>Case Subject</th>
                    <th>Case Details</th>
                    <th>Case Status</th>
                    <th>Case Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="caseObj" items="${cases}">
                    <tr>
                        <td>${caseObj.id}</td>
                        <td>${caseObj.subject}</td>
                        <td>${caseObj.details}</td>
                        <td>
                            <span class="badge bg-${caseObj.status == 'Open' ? 'success' : 'secondary'}">
                                ${caseObj.status}
                            </span>
                        </td>
                        <td>${caseObj.createdAt}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/cases/edit/${caseObj.id}" class="btn btn-primary btn-sm">Manage</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
