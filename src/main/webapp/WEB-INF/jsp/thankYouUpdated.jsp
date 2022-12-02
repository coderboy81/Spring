<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Change Update</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body><header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home"><img src="images/Black And White Modern Vintage Retro Brand Logo.png" alt="Logo - ABC"></a>
            </div><!-- branding -->
            <ul class="navbar">
                <li><a href="/goToUserHome">user home</a></li>
                <li><a href="/">update profile</a></li>
                <li><a href="/logout">logout</a></li>
                <li><a href="/goToSearch">search</a></li>
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
			<p>User updated successfully!<br>
			<!-- A registration confirmation email is sent to you. -->
			</p>
		</div>
	</section>
	
	<footer class="footer">
		<div class="container">
			<nav class="nav" role="navigation">
				<div class="container nav-elements">
					<div class="branding">
						<a href="#home"><img src="images/hpluslogo.svg"
							alt="Logo - H Plus Sports"></a>
						<p class="address">
							100 Main Street<br> Seattle, WA 98144
						</p>
					</div>
				</div>
			</nav>
			<p class="legal">ABC Community Portal is a fictitious brand created by
				lynda.com solely for the purpose of training. All products and
				people associated withABC Community Portal are also fictitious. Any resemblance
				to real brands, products, or people is purely coincidental.
				Information provided about the product is also fictitious and should
				not be construed to be representative of actual products on the
				market in a similar product category.</p>
		</div>
	
	

</body>
</html>