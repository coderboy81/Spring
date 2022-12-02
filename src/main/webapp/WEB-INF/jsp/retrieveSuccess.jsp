<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ABC Jobs</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file="header.jsp"%>
	<!-- #home -->
	


	<section id="search" class="section">
		<header class="imageheader"></header>
		<div class="container">
			<h2 class="headline">Thank You</h2>
			<p>Password retrieved successfully!<br>
			Your password is <b>${password}</b>.
			</p>
		</div>
	</section>
	
<%@ include file="footer.jsp"%>

</body>
</html>