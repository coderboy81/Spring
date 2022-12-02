<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Retrieve Password</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	
	<!-- #home -->
    <span class="success">${dataSaved}</span>
   	<section id="registration" class="section">
		<div class="container tagline">
			<em>RETRIEVE PASSWORD</em>
			<form action="/retrievepassword" method="post" modelAttribute="currentuser" >
				<label>Username</label> <input type="username" name="username"/><br />
				<label>Email</label> <input type="text" name="email"/><br />
			     <input type="submit" value="Submit" id="submit">
			</form>
		</div>
	</section>
	<!-- #products -->


	<%@ include file="footer.jsp"%>
	</footer>
	<!-- footer -->

</body>
</html>