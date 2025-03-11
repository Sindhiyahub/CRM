<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Sidebar</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            overflow-x: hidden;
            background-color: #f8f9fa;
        }

        /* Navbar Styling */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1030;
            background-color: #212529;
            color:#8D0B41;
            padding: 10px 20px;
        }

        .navbar-brand {
            font-size: 1.6rem;
            font-weight: bold;
            color: #872341; /* Gold color */
        }

        .navbar-brand:hover {
            color: #872341; /* Brighter gold */
        }

        .bi-list {
            font-size: 30px;
            color: #fff;
            cursor: pointer;
        }

        /* Sidebar Styles */
        .offcanvas {
            width: 260px;
            background-color: #2c3e50;
            color: white;
        }

        .offcanvas-header {
            background-color: #34495e;
            padding: 15px;
             color: #872341;
        }

        .offcanvas-body {
            padding: 0;
        }

        .offcanvas-body a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #ecf0f1;
            font-size: 16px;
            text-decoration: none;
            transition: background 0.3s, padding 0.2s ease-in-out;
        }

        .offcanvas-body a i {
            margin-right: 10px;
            font-size: 18px;
        }

        .offcanvas-body a:hover,
        .offcanvas-body a.active {
            background-color: #7E99A3;
            padding-left: 25px;
        }

        /* Submenu Styles */
        .collapse a {
            padding-left: 45px;
            font-size: 14px;
        }

        .collapse a:hover {
            background-color: #5D6D7E;
        }

        /* Sidebar Footer (Logout) */
        .sidebar-footer {
            text-align: center;
            padding: 15px 0;
            background-color: #1b2838;
            border-top: 1px solid #444;
        }

        .sidebar-footer a {
            color: #0dcaf0;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .sidebar-footer a:hover {
            color: #007bff;
        }

        .sidebar-footer i {
            font-size: 18px;
            margin-right: 5px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar">
                <i class="bi bi-list"></i>
            </button>
            <span class="navbar-brand"><a href="dashboard" class="text-decoration-none text-white">
                <i class="bi bi-people me-2"></i> CRM
            </a></span>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="offcanvas offcanvas-start" id="sidebar">
        <div class="offcanvas-header">
            <h5 class="mb-0"> <a href="dashboard" class="text-decoration-none text-white">
                <i class="bi bi-people me-2"></i> CRM</a>
            </h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
        </div>

        <div class="offcanvas-body">
            <a href="${pageContext.request.contextPath}/dashboard" class="active"><i class="bi bi-speedometer2"></i> Dashboard</a>

            <!-- Administration -->
            <a data-bs-toggle="collapse" href="#adminMenu"><i class="bi bi-gear"></i> Administration</a>
            <div class="collapse" id="adminMenu">
                <a data-bs-toggle="collapse" href="#userManagementMenu"><i class="bi bi-person-gear"></i> User Management</a>
                <div class="collapse" id="userManagementMenu">
                    <a href="${pageContext.request.contextPath}/usermanagement"> Manage Users</a>
                    <a href="${pageContext.request.contextPath}/addUser"> Add User</a>
                </div>
            </div>

            <!-- Leads -->
            <a data-bs-toggle="collapse" href="#leadsMenu"><i class="bi bi-people"></i> Leads</a>
            <div class="collapse" id="leadsMenu">
                <a href="${pageContext.request.contextPath}/leads"> Manage Leads</a>
                <a href="${pageContext.request.contextPath}/addLead"> Add Lead</a>
            </div>

            <a data-bs-toggle="collapse" href="#contactsMenu"><i class="bi bi-table me-2"></i>Contacts</a>
<div class="collapse ps-3" id="contactsMenu">
    <a href="${pageContext.request.contextPath}/contacts" class="nav-link">Manage Contacts</a>
    <a href="${pageContext.request.contextPath}/contacts/add" class="nav-link">Add Contact</a>
</div>

<a data-bs-toggle="collapse" href="#accountsMenu"><i class="bi bi-grid me-2"></i>Accounts</a>
<div class="collapse ps-3" id="accountsMenu">
    <a href="${pageContext.request.contextPath}/accounts" class="nav-link">Manage Accounts</a>
    <a href="${pageContext.request.contextPath}/accounts/add" class="nav-link">Add Account</a>
</div>

<a data-bs-toggle="collapse" href="#opportunitiesMenu"><i class="bi bi-briefcase me-2"></i>Opportunities</a>
<div class="collapse ps-3" id="opportunitiesMenu">
    <a href="${pageContext.request.contextPath}/opportunities" class="nav-link">Manage Opportunities</a>
    <a href="${pageContext.request.contextPath}/opportunities/add" class="nav-link">Add Opportunity</a>
</div>

<a data-bs-toggle="collapse" href="#casesMenu"><i class="bi bi-chat-dots me-2"></i>Cases</a>
<div class="collapse ps-3" id="casesMenu">
    <a href="${pageContext.request.contextPath}/cases" class="nav-link">Manage Cases</a>
    <a href="${pageContext.request.contextPath}/cases/add" class="nav-link">Add Case</a>
</div>

           <a data-bs-toggle="collapse" href="#salesMarketingMenu"><i class="bi bi-bar-chart me-2"></i> Sales & Marketing</a>
<div class="collapse ps-3" id="salesMarketingMenu">
    <!-- Campaigns -->
    <a data-bs-toggle="collapse" href="#campaignsMenu"><i class="bi bi-megaphone me-2"></i> Campaigns</a>
    <div class="collapse ps-3" id="campaignsMenu">
        <a href="${pageContext.request.contextPath}/campaigns" class="nav-link">Manage Campaigns</a>
        <a href="${pageContext.request.contextPath}/campaigns/add" class="nav-link">Add Campaign</a>
    </div>

    <!-- Quotes -->
    <a data-bs-toggle="collapse" href="#quotesMenu"><i class="bi bi-card-checklist me-2"></i> Quotes</a>
    <div class="collapse ps-3" id="quotesMenu">
        <a href="${pageContext.request.contextPath}/quotes" class="nav-link">Manage Quotes</a>
        <a href="${pageContext.request.contextPath}/quotes/add" class="nav-link">Add Quote</a>
    </div>
</div>

            <!-- Analytics & Reporting -->
            <a data-bs-toggle="collapse" href="#analyticsMenu"><i class="bi bi-graph-up-arrow"></i> Analytics & Reporting</a>
            <div class="collapse" id="analyticsMenu">
                <a href="${pageContext.request.contextPath}/reports"><i class="bi bi-file-earmark-bar-graph"></i> Reports</a>
            </div>
        </div>

        <!-- Logout -->
        <div class="sidebar-footer">
            <a href="logout"><i class="bi bi-box-arrow-right"></i> LogOut</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
