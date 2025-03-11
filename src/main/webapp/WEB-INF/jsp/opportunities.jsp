<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opportunity Management</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* Pastel Theme Colors */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 90px;
            max-width: 1200px;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background: white;
        }

        h2 {
            font-size: 28px;
            font-weight: 600;
            color: #5a5a5a;
            text-align: center;
        }

        .btn-add-opportunity {
            float: right;
            margin-bottom: 15px;
            background-color: #b3d9ff;
            color: #333;
            border-radius: 8px;
            padding: 8px 16px;
            font-size: 14px;
            border: none;
        }

        .btn-add-opportunity:hover {
            background-color: #99c2ff;
            color: #222;
        }

        /* Table Styling */
        .table-container {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        thead {
            background-color: #fff;
            color: #5a5a5a;
            font-weight: bold;
        }

        th, td {
            text-align: center;
            padding: 12px;
            border: none; /* No borders */
        }

        tbody tr {
       
            background-color: #ffe8cc; /* Pastel row background */
            transition: all 0.3s ease-in-out;
        }

        tbody tr:hover {
            background-color: #ffd9b3; /* Light hover effect */
        }

        table , table td {
            text-align: center;
            padding: 12px;
            border: none !important;
        }
        /* Action Buttons */
        .action-btns {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn-sm {
            font-size: 14px;
            padding: 8px 12px;
            border-radius: 6px;
            border: none;
        }

        .btn-warning {
            background-color: #ffb3ba;
            color: #333;
        }

        .btn-warning:hover {
            background-color: #ff99a1;
        }

        .btn-danger {
            background-color: #ffb3ba;
            color: white;
        }

        .btn-danger:hover {
            background-color: #ff99a1;
        }
    </style>

    <!-- jQuery, Bootstrap & DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#opportunityTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [10, 25, 50, 100],
                "responsive": true,
                "columnDefs": [
                    { "orderable": false, "targets": [4] }
                ]
            });
        });

       
    </script>

</head>
<body>

    <%@ include file="sidebar.jsp"%>

    <div class="container">
        <div class="card">
       
            <div class="table-container">
                <table id="opportunityTable" class="table">
                    <thead>
                        <tr>
                            <th>Opportunity ID</th>
                            <th>Opportunity Name</th>
                            <th>Opportunity Stage</th>
                            <th>Opportunity Closing Date</th>
                            <th>Opportunity Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="opportunity" items="${opportunities}">
                            <tr>
                                <td>${opportunity.id}</td>
                                <td>${opportunity.name}</td>
                                <td>${opportunity.stage}</td>
                                <td>${opportunity.closingDate}</td>
                                <td class="action-btns">
                                    <a href="${pageContext.request.contextPath}/opportunities/edit/${opportunity.id}" class="btn btn-warning btn-sm">
                                        <i class="fa fa-edit"></i> Manage Deal
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
