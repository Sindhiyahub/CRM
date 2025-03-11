<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leads Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css">
    
    <!-- FontAwesome (For Icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* General Styles */
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
            margin: 0;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            
            top: 70;
            left: 0;
            width: 260px;
            height: 100vh;
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: white;
            padding: 3.5rem;
            display: flex;
            flex-direction: column;
            box-shadow: 3px 0 15px rgba(0, 0, 0, 0.2);
        }

        .sidebar h4 {
       
            font-size: 18px;
            color: #ecf0f1;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .sidebar a {
            color: #ecf0f1;
            text-decoration: none;
            padding: 20px 18px;
            border-radius: 6px;
            display: block;
            transition: 0.3s;
            font-size: 15px;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
            padding-left: 22px;
        }

        /* Content */
        .content {
            margin-left: 280px;
            margin-top: 60px;
            padding: 2rem;
        }

        /* Table Container */
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* DataTable */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
            border: none !important;
        }

        table thead {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        table tbody tr:hover {
            background: #f2f2f2;
        }

        /* Buttons */
        .btn-action {
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .btn-action:hover {
            opacity: 0.85;
        }

        /* Status Badges */
        .badge {
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 15px;
            text-transform: capitalize;
        }

        .badge-new { background-color: #ffcc00; color: #333; }
        .badge-contacted { background-color: #007bff; color: white; }
        .badge-qualified { background-color: #28a745; color: white; }
        .badge-closed { background-color: #6c757d; color: white; }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
                padding: 1rem;
            }

            .table-container {
                padding: 1rem;
            }
        }
    </style>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#leadsTable').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                lengthMenu: [10, 25, 50],
                responsive: true,
                columnDefs: [{ orderable: false, targets: "no-sort" }]
            });
        });
    </script>
</head>

<body>
    <jsp:include page="sidebar.jsp" />

    <!-- Sidebar -->
    <div class="sidebar">
        <h4>Filter Leads By</h4>
        <a href="leads"><i class="fa fa-list"></i> All Leads</a>
        <a href="leads?statusFilter=New"><i class="fa fa-star"></i> New</a>
        <a href="leads?statusFilter=Contacted"><i class="fa fa-phone"></i> Contacted</a>
        <a href="leads?statusFilter=Qualified"><i class="fa fa-check-circle"></i> Qualified</a>
        <a href="leads?statusFilter=Closed"><i class="fa fa-times-circle"></i> Closed</a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="table-container">
            <table id="leadsTable" class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Company</th>
                        <th>Source</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lead" items="${leads}">
                        <tr>
                            <td>${lead.name}</td>
                            <td>${lead.company}</td>
                            <td>${lead.source}</td>
                            <td>
                                <span class="badge 
                                    ${lead.status == 'New' ? 'badge-new' : 
                                      lead.status == 'Contacted' ? 'badge-contacted' : 
                                      lead.status == 'Qualified' ? 'badge-qualified' : 'badge-closed'}">
                                    ${lead.status}
                                </span>
                            </td>
                            <td class="no-sort">
                                <a href="/jspapp/leads/${lead.id}" class="btn btn-info btn-sm btn-action">Manage</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
