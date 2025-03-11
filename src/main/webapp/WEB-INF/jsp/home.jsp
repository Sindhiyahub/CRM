<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Dashboard</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            position: fixed;
            height: 100%;
            background: #2c3e50;
            color: white;
            padding-top: 20px;
        }

        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
        }

        .sidebar a:hover {
            background: #1a252f;
        }

        /* Main Content */
        .content {
            margin-left: 250px;
            padding: 20px;
        }

        /* Top Navigation */
        .top-nav {
            background: #34495e;
            color: white;
            padding: 10px;
            text-align: right;
        }

        .dashboard-card {
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            background: white;
        }

        .task-list {
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center">CRM</h4>
        <a href="dashboard.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="leads.jsp"><i class="fas fa-user"></i> Leads</a>
        <a href="contacts.jsp"><i class="fas fa-address-book"></i> Contacts</a>
        <a href="accounts.jsp"><i class="fas fa-building"></i> Accounts</a>
        <a href="deals.jsp"><i class="fas fa-handshake"></i> Deals</a>
        <a href="tasks.jsp"><i class="fas fa-tasks"></i> Tasks</a>
        <a href="reports.jsp"><i class="fas fa-chart-line"></i> Reports</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        
        <!-- Top Navigation -->
        <div class="top-nav">
            Welcome, <b>User</b> | <a href="logout.jsp" class="text-white">Logout</a>
        </div>

        <h2>Dashboard</h2>

        <!-- Dashboard Cards -->
        <div class="row">
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h5>Leads</h5>
                    <p>Total: 250</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h5>Deals</h5>
                    <p>Total: 50</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h5>Revenue</h5>
                    <p>$1,250,000</p>
                </div>
            </div>
        </div>

        <!-- Task List -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="task-list">
                    <h5>Upcoming Tasks</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Due Date</th>
                                <th>Task</th>
                                <th>Status</th>
                                <th>Priority</th>
                                <th>Assigned To</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Mar 31</td>
                                <td>Follow up with Client</td>
                                <td><span class="badge bg-warning">In Progress</span></td>
                                <td>High</td>
                                <td>John Doe</td>
                            </tr>
                            <tr>
                                <td>Apr 10</td>
                                <td>Send Proposal</td>
                                <td><span class="badge bg-success">Completed</span></td>
                                <td>Medium</td>
                                <td>Jane Smith</td>
                            </tr>
                            <tr>
                                <td>Apr 14</td>
                                <td>Negotiate Contract</td>
                                <td><span class="badge bg-danger">Pending</span></td>
                                <td>High</td>
                                <td>Mike Ross</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

</body>
</html>
