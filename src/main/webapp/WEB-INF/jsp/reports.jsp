<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Custom Styles -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 90px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #343a40;
        }
        canvas {
            max-width: 600px;
            margin: auto;
            display: block;
        }
    </style>
</head>
<body>
<%@ include file="sidebar.jsp" %>

<div class="container">
    <h2 class="text-center mb-4">📊 Sales & Customer Reports</h2>

    <!-- Sales Report Table -->
    <div class="card p-3 mb-4">
        <h4 class="text-primary">📌 Sales Report</h4>
        <table id="salesTable" class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Stage</th>
                    <th>Total Deals</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sale" items="${salesData}">
                    <tr>
                        <td>${sale.stage}</td>
                        <td>${sale.total}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

   

    <!-- Customer Report Table -->
    <div class="card p-3 mb-4">
        <h4 class="text-success">📌 Customer Report</h4>
        <table id="customerTable" class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Customer Type</th>
                    <th>Total Customers</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customerData}">
                    <tr>
                        <td>${customer.type}</td>
                        <td>${customer.total}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

  

<!-- jQuery, Bootstrap & DataTables JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

<!-- Initialize DataTables -->
<script>
    $(document).ready(function() {
        $('#salesTable').DataTable();
        $('#customerTable').DataTable();
    });

    // Fetching sales data for Chart
    var salesLabels = [];
    var salesData = [];
    <c:forEach var="sale" items="${salesData}">
        salesLabels.push("${sale.stage}");
        salesData.push(${sale.total});
    </c:forEach>

    // Sales Chart (Bar Chart)
    var ctx1 = document.getElementById('salesChart').getContext('2d');
    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: salesLabels,
            datasets: [{
                label: 'Total Deals',
                data: salesData,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Fetching customer data for Chart
    var customerLabels = [];
    var customerData = [];
    <c:forEach var="customer" items="${customerData}">
        customerLabels.push("${customer.type}");
        customerData.push(${customer.total});
    </c:forEach>

    // Customer Chart (Pie Chart)
    var ctx2 = document.getElementById('customerChart').getContext('2d');
    new Chart(ctx2, {
        type: 'pie',
        data: {
            labels: customerLabels,
            datasets: [{
                label: 'Total Customers',
                data: customerData,
                backgroundColor: ['#ff6384', '#36a2eb', '#ffcd56', '#4bc0c0', '#9966ff'],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true
        }
    });

</script>

</body>
</html>
