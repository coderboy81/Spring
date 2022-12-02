
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
					<a href="home"><img src="images/Black And White Modern Vintage Retro Brand Logo.png"
						alt="Logo - ABC Jobs"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">
				<li><a href="/home"><spring:message code="label.home"/></a></li>
                <li><a href="/goToLogin"><spring:message code="label.login"/></a></li>
                <!-- <li><a href="/goToSearch"><spring:message code="label.search"/></a></li> -->
                <li><a href="/redirectToLinkedIn"><spring:message code="label.linkedin"/></a></li>
				</ul>
				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
		<div class="container tagline">
        <h1 class="headline">Our Mission</h1>
        <p style="margin-bottom: 0px;">We provide the <em>Best Software Developers Community Portal</em> with <em>Best-in-class Developers</em>.</p>
    </div><!-- container tagline -->
	</header>
</body>
</html>