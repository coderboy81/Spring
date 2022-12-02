<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>ABC Jobs</title>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
</head>
<body>
<header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home"><img src="images/Black And White Modern Vintage Retro Brand Logo.png" alt="Logo - ABC Jobs"></a>
            </div><!-- branding -->
            <ul class="navbar">
                <li><a href="/goToAdminHome">user home</a></li>
                <li><a href="/updateAdminProfile">update profile</a></li>
                <li><a href="/manageProfiles">manage profiles</a></li>
                <li><a href="/emailInvitation">email invitation</a></li>
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
	<!-- search results -->
            <c:if test="${!empty(currentuser)}">
            <section id="registration" class="section">
	 <div class="container tagline">
	 <br><em>Update Profile</em><br>
    		 <form:form method="post" action="/updateadminprofile" modelAttribute="currentuser">
    			<label>Username</label> <form:input path="username" type="text" style="background-color:#D3D3D3" readonly="true" /><form:errors path="username" cssClass="error"/><br/>
    			<label>Password</label> <form:input path="password" type="password" /><form:errors path="password" cssClass="error"/><br/>
    			<label>First Name</label> <form:input path="firstName" type="text" /><form:errors path="firstName" cssClass="error"/><br/>
    			<label>Last Name</label> <form:input path="lastName" type="text" /><br/>
    			<label>Well versed languages</label> 
				<form:input path="language" id="language" type="text" /><form:errors path="language" cssClass="error"/><br/>
    			<label>Date of birth</label>
    			<form:input path="dateOfBirth" type="date" />
    			<form:errors path="dateOfBirth" cssClass="error"/>
    			<br/>
    			<label>Gender</label>
    			<form:select path="gender" items="${genderItems}"/>
    			<br/>
    			<label>Email</label> 
				<form:input path="email" id="email" type="text" /><form:errors path="email" cssClass="error"/><br/>
				<label>City</label> 
				<form:input path="city" id="city" type="text" /><br/>
				<label>Country</label> 
				<form:input path="country" id="country" type="text" /><br/>
    			<input type="submit" value="Save" id="submit">
    		</form:form><br>
		</div>
	</section>
            </c:if>
            
<section id="history" class="section">
    <div class="container">
        <div class="text-content">
            <h2 class="headline">Company History</h2>
            <p>ABC Jobs was co-founded by <em>Eden Zeng</em> in 2010, and since then it has grown to become one 
            of the world's most popular on-demand talent networks.  The portal matches skilled developers
            and programmers to clients across the globe. According to portal data, it currently serves 
            over <em>2,000 clients</em> in more than <em>15 countries</em>.</p>
        </div>
    </div><!-- container text -->
</section><!-- #history -->

<section id="mission" class="section">
    <header class="imageheader"></header>
    <div class="container">
        <h2 class="headline">Our Mission</h2>
        <p class="textblack">We are striving to organize all <em>the world's human capital data</em> and make it meaningful for society.
        It is the core of our business and the guiding principle of <em>our software developers and programmers</em>,
        making <em>ABC Jobs Community Portal</em> a truly unique place to work.
        </p>
        <p class="textblack">A place where you can say that at the end of the day, <em>you make a difference</em>.
        </p>
        <p class="textblack">Each day we help <em>software professionals and companies connect</em>, giving people a chance to find their calling
        and many employers a chance to find and hire top talent to help grow their business.
        </p>
    </div>
</section><!-- mission -->

<section id="search" class="section">
    <header class="imageheader"></header>
		<div class="container">
			<h2 class="headline">Search Users</h2>
			<form action="/search" method="get">
				<label class="card-title">Search user</label>
				 <input path="search" name="search" value="">
			    <input type="submit" value="Search">
			</form>
		</div>
		<br>
</section>

<!-- search results -->
            <c:if test="${!empty(products)}">
    		<section id="products" class="section">
            <c:forEach var="product" items="${products}">
    		<div class="productContainer">
                           
            				<div class="productContainerItem">
            					<img id="pic1" src="${product.imagePath}">
            					<input type="text" name="product"
            						value="${product.name}"><br />

            				</div>
                        
            </c:forEach>
            		</div>
           
            </section>
            </c:if>

<%@ include file="footer.jsp"%>

</body>
</html>
