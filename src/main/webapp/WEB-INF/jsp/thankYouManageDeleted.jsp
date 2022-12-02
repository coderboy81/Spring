<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ABC Jobs</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body><header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home"><img src="images/Black And White Modern Vintage Retro Brand Logo.png" alt="Logo - ABC Jobs"></a>
            </div><!-- branding -->
            <ul class="navbar">
                <li><a href="/goToAdminHome">user home</a></li>
                <li><a href="/updateAdminProfile">update profile</a></li>
                <li><a href="/logout">logout</a></li>
                <li><a href="/goToAdminSearch">search</a></li>
                <!-- <li><a href="#search">search</a></li> -->
                <li><a href="/redirectToLinkedIn">linkedin</a></li>
            </ul><!-- navbar -->

        </div><!-- container nav-elements -->
    </nav>
    <div class="container tagline">
        <h1 class="headline">Our Mission</h1>
         <em>Welcome, ${username}</em>
    </div><!-- container tagline -->
</header><!-- #home -->

	<section id="search" class="section">
		<header class="imageheader"></header>
		<div class="container">
			<h2 class="headline">Thank You</h2>
			<p>User, ${user.firstName} ${user.lastName}, deleted successfully!<br>
			<!-- A registration confirmation email is sent to you. -->
			</p>
		</div>
	</section>
	
	<%@ include file="footer.jsp"%>

</body>
</html>