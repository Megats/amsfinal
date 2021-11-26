<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- get session -->
<% String email = (String) session.getAttribute("sessionId");%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Login</title>
<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />

<style>
body {
	font-family: "Karla", sans-serif;
	background-color: #d0d0ce;
	min-height: 100vh;
}

.brand-wrapper {
	display: flex;
	flex-direction: row;
	margin-bottom: 19px;
	align-items: center;
}

.brand-wrapper .logo {
	height: 70px;
}

.brand-wrapper h2 {
	letter-spacing: -2px;
	font-weight: 900;
}

.login-card {
	border: 0;
	border-radius: 27.5px;
	box-shadow: 0 10px 30px 0 rgba(172, 168, 168, 0.43);
	overflow: hidden;
}

.login-card-img {
	border-radius: 0;
	position: absolute;
	width: 100%;
	height: 100%;
	-o-object-fit: cover;
	object-fit: cover;
}

.login-card .card-body {
	padding: 75px 60px 60px;
}

@media ( max-width : 422px) {
	.login-card .card-body {
		padding: 35px 24px;
	}
}

.login-card-description {
	font-size: 25px;
	color: #000;
	font-weight: normal;
	margin-bottom: 23px;
}

.login-card form {
	max-width: 326px;
}

.login-card .form-control {
	border: 1px solid #d5dae2;
	padding: 15px 25px;
	margin-bottom: 20px;
	min-height: 45px;
	font-size: 13px;
	line-height: 15;
	font-weight: normal;
}

.login-card .form-control::-webkit-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::-moz-placeholder {
	color: #919aa3;
}

.login-card .form-control:-ms-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::-ms-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::placeholder {
	color: #919aa3;
}

.login-card .login-btn {
	padding: 13px 20px 12px;
	background-color: #000;
	border-radius: 4px;
	font-size: 17px;
	font-weight: bold;
	line-height: 20px;
	color: #fff;
	margin-bottom: 24px;
}

.login-card .login-btn:hover {
	border: 1px solid #000;
	background-color: transparent;
	color: #000;
}

.login-card .forgot-password-link {
	font-size: 14px;
	color: #919aa3;
	margin-bottom: 12px;
}

.login-card-footer-text {
	font-size: 16px;
	color: #0d2366;
	margin-bottom: 60px;
}

@media ( max-width : 767px) {
	.login-card-footer-text {
		margin-bottom: 24px;
	}
}

.login-card-footer-nav a {
	font-size: 14px;
	color: #919aa3;
}

.alert {
	padding: 10px;
	background-color: #f44336;
	color: white;
	opacity: 1;
	transition: opacity 0.6s;
	margin-bottom: 15px;
	display: none;
}

.alert.success {
	background-color: #04AA6D;
}

.alert.info {
	background-color: #2196F3;
}

.alert.warning {
	background-color: #ff9800;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}

/*# sourceMappingURL=login.css.map */
</style>
</head>
<body>
	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters">
					<div class="col-md-5">
						<img src="picture/scone.jpg" alt="login" class="login-card-img" />
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<div class="brand-wrapper">
								<img src="picture/company_logo-removebg-preview.png" alt="logo"
									class="logo" width="70px">
								<h2>Reset Password</h2>
							</div>
							<form action="ResetController" method="POST">
								
								<input type="hidden" name="email" value="<%=email%>"/>
								<div class="form-group">
									<label for="agentid" class="sr-only">Enter new password</label> <input
										type="text" name="password" id="password" class="form-control"
										placeholder="Enter new password" onpaste="return false;" onCopy="return false" onkeyup="check();" required>
								</div>
								<div class="form-group mb-4">
									<label for="password" class="sr-only">Re-enter new password</label> <input
										type="password" name="passwordConfirm" id="passwordConfirm"
										class="form-control" placeholder="Re-enter new password" onpaste="return false;" onCopy="return false" onkeyup="check();" required>
								<span id="message"></span>
								</div>
																	
								<input name="submit" id="submit" class="btn btn-block login-btn mb-4" type="submit" value="Submit" disabled = "disabled">
							<c:choose>
                        	<c:when test="${success.equals('Password has been reset!')}">
                            <script>
	                			alert("Password has been reset!");
                            </script>
								                        </c:when>
								                    </c:choose>
							</form>
							<div class="alert"></div>
							
							
								<span style="color: red;" id="success">${success} </span> <a
									href="#!" class="text-reset"></a>
							
							<nav class="login-card-footer-nav">
								<a href="#!">Terms of use.</a> <a href="#!">Privacy policy</a>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="card login-card">
        <img src="assets/images/login.jpg" alt="login" class="login-card-img">
        <div class="card-body">
          <h2 class="login-card-title">Login</h2>
          <p class="login-card-description">Sign in to your account to continue.</p>
          <form action="#!">
            <div class="form-group">
              <label for="email" class="sr-only">Email</label>
              <input type="email" name="email" id="email" class="form-control" placeholder="Email">
            </div>
            <div class="form-group">
              <label for="password" class="sr-only">Password</label>
              <input type="password" name="password" id="password" class="form-control" placeholder="Password">
            </div>
            <div class="form-prompt-wrapper">
              <div class="custom-control custom-checkbox login-card-check-box">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember me</label>
              </div>              
              <a href="#!" class="text-reset">Forgot password?</a>
            </div>
            <input name="login" id="login" class="btn btn-block login-btn mb-4" type="button" value="Login">
          </form>
          <p class="login-card-footer-text">Don't have an account? <a href="#!" class="text-reset">Register here</a></p>
        </div>
      </div> -->
		</div>
	</main>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'>
	</script>
	<script src='//cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js'>
	</script>
	<script src="//cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script>
	
	
	function myFunction() {
		password = document.getElementById("password");
		
		if(password == null)
			alert("please enter password");
		else
			alert("Password has been reset!");
	}
    var close = document.getElementsByClassName("closebtn");
    setTimeOut(function(){
 
    	if(${login == 'invalid'}){
       	 close.style.display = 'block'
       	}   
    },10000)
   
   function check() {
  if (document.getElementById('password').value ==
    document.getElementById('passwordConfirm').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
    document.getElementById("submit").disabled = false;

  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
    document.getElementById("submit").disabled = true;
  }
}


</script>

    
</body>
</html>