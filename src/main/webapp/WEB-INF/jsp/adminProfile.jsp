<!DOCTYPE html>
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
            <br><em>My Profile</em>
    		<section id="products" class="section">
    		<div class="productContainer">
    		<table id="profile">
			  <tr>
			    <th>${currentuser.firstName} ${currentuser.lastName}</th>
			  </tr>
			  <tr>
		   		<td><label>Username</label></td>
				<td><label style="color:blue;">${currentuser.username}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Password</label></td>
				<td><label style="color:blue;">${currentuser.password}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>First Name</label></td>
				<td><label style="color:blue;">${currentuser.firstName}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Last Name</label></td>
				<td><label style="color:blue;">${currentuser.lastName}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Well versed languages</label></td>
				<td><label style="color:blue;">${currentuser.language}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Date of birth</label></td>
				<td><label style="color:blue;">${currentuser.dateOfBirth}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Gender</label></td>
				<td><label style="color:blue;">${currentuser.gender}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Email</label></td>
				<td><label style="color:blue;">${currentuser.email}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>City</label></td>
				<td><label style="color:blue;">${currentuser.city}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Country</label></td>
				<td><label style="color:blue;">${currentuser.country}</label></td>	
			  </tr>
			  <tr>
			  	 <th></th>
			  	 <th><button style="padding: 5px 10px; background-color: #f3d350; text-decoration: none; border-radius: 5px;" 
			  	 onclick="window.location.href='/updateAdminProfile';">Edit</button></th>
			  </tr>
            </table>
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
			<form action="/adminsearch" method="get">
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
