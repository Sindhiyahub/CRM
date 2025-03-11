<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account List</title>

    <!-- Bootstrap 5 & DataTables CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 1200px;
            margin-top: 90px;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background: #fff;
        }

        h2 {
            font-size: 26px;
            font-weight: 600;
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }

        .table-responsive {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Header Styling */
        .table thead th {
           
            color: black;
            text-align: left;
            padding: 12px;
            font-weight: bold;
            border-bottom: 2px solid #ccc;
        }

        /* Removing row borders */
        .table tbody tr {
            border: none;
        }

        .table tbody tr td {
            padding: 10px;
            text-align: left;
            border: none;
        }

        /* Bottom border on the last row */
        .table tbody tr:last-child td {
            border-bottom: 2px solid #ccc;
        }

        /* Hover effect */
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }

        .badge {
            font-size: 0.9rem;
            padding: 6px 10px;
            border-radius: 12px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 0.85rem;
            border-radius: 5px;
        }

        .action-btns a {
            margin-right: 5px;
            text-decoration: none;
        }
    </style>

    <!-- jQuery, Bootstrap & DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#accountTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [10, 25, 50, 100],
                "responsive": true
            });
        });
    </script>
</head>
<body>

<%@ include file="sidebar.jsp" %>

<div class="container">
    <div class="card">
        

        <div class="table-responsive">
            <table id="accountTable" class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Billing Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="account" items="${accounts}">
                        <tr>
                            <td>${account.id}</td>
                            <td>${account.name}</td>
                            <td>${account.phone}</td>
                            <td>${account.type}</td>
                            <td>
                                <span class="badge bg-${account.status == 'Active' ? 'success' : 'danger'}">
                                    ${account.status}
                                </span>
                            </td>
                            <td>${account.billingAddress}</td>
                            <td class="action-btns">
                                <a href="${pageContext.request.contextPath}/accounts/edit/${account.id}" 
                                   class="btn btn-primary btn-sm">
                                   <i class="fa fa-edit"></i> Manage
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
