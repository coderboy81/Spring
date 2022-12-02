<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<!-- #home -->
    <span class="success">${dataSaved}</span>
   	<section id="login" class="section">
		<div class="container tagline">
			<em>LOGIN USER</em>
			<form action="/login" method="post" modelAttribute="login">
				<label>Username</label> <input type="text" name="username"/><br />
			    <label>Password</label> <input type="password" name="password"/><br />
			     <input type="submit" value="Login">
			</form>
			 <a class="card-title" href="/goToRegistration">Register new user? Click here</a>
			 <p style="margin-bottom: 0px;margin-top: 0px;">OR</p>
			 <a class="card-title" href="/goToRetrievePassword">Retrieve Password? Click here</a>
		</div>
	</section>
	<!-- #products -->


	<%@ include file="footer.jsp"%>
		<!-- container -->
	</footer>
	<!-- footer -->

</body>
</html>