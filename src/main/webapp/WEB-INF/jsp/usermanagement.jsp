<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables CSS & JS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 1200px;
            margin-top: 90px;
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

        /* Removing all row borders */
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Keeping only top and bottom borders */
        .table thead th {
            background-color: #f8f9fa;
            text-align: left;
            padding: 12px;
            font-weight: bold;
            border-bottom: 2px solid #ccc;
        }

        .table tbody tr {
            border: none; /* Remove row lines */
        }

        .table tbody tr td {
            padding: 10px;
            text-align: left;
            border: none; /* No borders in the rows */
        }

        /* Adding bottom border at the end of the table */
        .table tbody tr:last-child td {
            border-bottom: 2px solid #ccc;
        }

        .badge {
            font-size: 0.9rem;
            padding: 6px 10px;
            border-radius: 12px;
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

        .btn-info {
            background-color: #17a2b8;
            border: none;
        }

        .btn-info:hover {
            background-color: #138496;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('#userTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [10, 25, 50, 100]
            });
        });

        function confirmDelete(userId) {
            if (confirm("Are you sure you want to delete this user?")) {
                document.getElementById("deleteForm-" + userId).submit();
            }
        }
    </script>

</head>
<body>

    <%@ include file="sidebar.jsp" %>

    <div class="container">
        

        <div class="table-responsive">
            <table id="userTable" class="table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.role}</td>
                            <td>
                                <span class="badge bg-${user.active ? 'success' : 'secondary'}">
                                    ${user.active ? 'Active' : 'Inactive'}
                                </span>
                            </td>
                            <td class="action-btns">
                                <a href="manageUser?userId=${user.id}" class="btn btn-info btn-sm">Manage User</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
