<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
/* General Page Styling */
body {
  font-family: 'Roboto', sans-serif;
  background: linear-gradient(120deg, #f6d365, #fda085);
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  color: #333;
}

/* Heading Styling */
h1 {
  color: #ffffff;
  font-size: 2.5rem;
  margin: 20px 0;
  margin-bottom:200px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  text-align: center;
}

/* User Info Container */
.user-info {
  background-color: #ffffff;
  border-radius: 12px;
  margin-bottom:200px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  padding: 30px 20px;
  width: 90%;
  max-width: 400px;
  text-align: center;
  animation: fadeIn 1.2s ease-in-out;
}

/* User Info Text Styling */
.user-info p {
  font-size: 1rem;
  color: #555;
  margin: 10px 0;
}

.user-info strong {
  color: #e74c3c;
  font-weight: bold;
}

/* Animation */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Responsive Design */
@media (max-width: 768px) {
  h1 {
    font-size: 1.8rem;
  }

  .user-info {
    padding: 20px;
  }

  .user-info p {
    font-size: 0.9rem;
  }
}
</style>

</head>
<body>
<jsp:include page="sidebar.jsp" />
<h1>Welcome to Your Dashboard</h1>

<div class="user-info">
  <p><strong>Username:</strong> ${signupDTO.username}</p>
  <p><strong>Email:</strong> ${signupDTO.email}</p>
</div>

</body>
</html>
