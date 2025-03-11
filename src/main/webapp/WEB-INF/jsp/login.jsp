<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">
<body>
<head>
<title>Slide Navbar</title>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap"
	rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Jost', sans-serif;
	background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
}

.main {
	width: 350px;
	height: 500px;
	background: red;
	overflow: hidden;
	background:
		url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38")
		no-repeat center/cover;
	border-radius: 10px;
	box-shadow: 5px 20px 50px #000;
}

#chk {
	display: none;
}

.signup {
	position: relative;
	width: 100%;
	height: 100%;
}

label {
	color: #fff;
	font-size: 2.3em;
	justify-content: center;
	display: flex;
	margin: 60px;
	font-weight: bold;
	cursor: pointer;
	transition: .5s ease-in-out;
}

input {
	width: 60%;
	height: 20px;
	background: #e0dede;
	justify-content: center;
	display: flex;
	margin: 20px auto;
	padding: 10px; 
	border: none;
	outline: none;
	border-radius: 5px;
}

button {
	width: 90%;
	height: 30px;
	margin: 10px auto;
	justify-content: center;
	display: block;
	color:black;
	background: rgba(0, 0, 0, 0.1);
	font-size: 1em;
	font-weight: bold;
	margin-top: 20px;
	outline: none;
	border: none;
	border-radius: 5px;
	transition: .2s ease-in;
	cursor: pointer;
}

button:hover {
	background: #6d44b8;
}

.login {
	height: 460px;
	background: #eee;
	border-radius: 60%/10%;
	transform: translateY(-180px);
	transition: .8s ease-in-out;
}

.login label {
	color: #573b8a;
	transform: scale(.6);
}

#chk:checked ~ .login {
	transform: translateY(-500px);
}

#chk:checked ~ .login label {
	transform: scale(1);
}

#chk:checked ~ .signup label {
	transform: scale(.6);
}
</style>

</head>
<body>

	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">
<script>
        // Show error popups dynamically
        <c:if test="${not empty error}">
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '${error}',
                confirmButtonColor: '#d33'
            });
        </c:if>

        <c:if test="${not empty message}">
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: '${message}',
            confirmButtonColor: '#3085d6'
        });
    </c:if>
    </script>
		<div class="signup">
			<form:form action="/jspapp/signup" method="post"
				modelAttribute="signupDTO">
				<label for="chk" aria-hidden="true">Sign up</label>
				<form:input path="username" placeholder="User name"
					class="input-class" required="true" />
				<form:input path="email" type="email" placeholder="Email"
					class="input-class" required="true" />
				<form:input path="password" placeholder="Password"
					class="input-class" required="true" />
				<form:input path="role" placeholder="Role" class="input-class"
					required="true" />
				<button type="submit">Sign up</button>
			</form:form>
		</div>


		<div class="login">
			<!-- Spring form tag with correct attributes -->
			<form:form action="/jspapp/login" method="post"
				modelAttribute="userLoginDTO">
				<label for="chk">Login</label>
				<!-- Email input -->
				<form:input path="username" placeholder="Username" class="input"
					required="required" />
				<!-- Password input -->
				<form:input path="password" type="password" placeholder="Password"
					class="input" required="required" />
				<!-- Submit button -->
				<button type="submit">Login</button>
			</form:form>
		</div>

		<script>
        // Show error popups dynamically
        <c:if test="${not empty error}">
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '${error}',
                confirmButtonColor: '#d33'
            });
        </c:if>

        <c:if test="${not empty message}">
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: '${message}',
                confirmButtonColor: '#3085d6'
            });
        </c:if>
    </script>

	</div>
</body>
</html>
<!-- partial -->

