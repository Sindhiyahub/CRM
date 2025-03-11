<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contacts List</title>

    <!-- Bootstrap 5 & DataTables CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
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
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-add-contact {
            float: right;
            margin-bottom: 15px;
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            padding: 8px 16px;
            font-size: 14px;
        }

        .btn-add-contact:hover {
            background-color: #0056b3;
        }

  
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        table thead {
text-align: center;
            color: #8D0B41;
        }

         table td {
            text-align: center;
            padding: 12px;
            border: none !important;
        }

        table tbody tr:hover {
            background: #f8f9fa;
        }

    
        .action-btns {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn-sm {
            font-size: 14px;
            padding: 8px 12px;
            border-radius: 6px;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }


        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            .btn-add-contact {
                float: none;
                width: 100%;
                text-align: center;
                margin-bottom: 10px;
            }
        }
    </style>

    <!-- jQuery, Bootstrap & DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#contactsTable').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                lengthMenu: [10, 25, 50, 100],
                responsive: true,
                columnDefs: [{ orderable: false, targets: "no-sort" }]
            });
        });

    </script>

</head>
<body>

    <%@ include file="sidebar.jsp"%>

    <div class="container">
        <div class="card">
          

            
            <table id="contactsTable" class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Company</th>
                        <th class="no-sort">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="contact" items="${contacts}">
                        <tr>
                            <td>${contact.id}</td>
                            <td>${contact.name}</td>
                            <td>${contact.email}</td>
                            <td>${contact.phone}</td>
                            <td>${contact.company}</td>
                            <td class="action-btns">
                                <a href="contacts/edit/${contact.id}" class="btn btn-warning btn-sm">
                                    <i class="fa fa-edit"></i> Manage
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
