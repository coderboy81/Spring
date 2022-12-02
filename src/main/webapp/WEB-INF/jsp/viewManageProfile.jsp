<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ABC Jobs</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
</header>

	<!-- #home -->

	<!-- search results -->
            <c:if test="${!empty(user)}">
            <br><em>USER</em>
    		<section id="products" class="section">
    		<div class="productContainer">
    		<table id="profile">
			  <tr>
			    <th>${user.firstName} ${user.lastName}'s Profile</th>
			  </tr>
			  <tr>
		   		<td><label>First Name</label></td>
				<td><label style="color:blue;">${user.firstName}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Last Name</label></td>
				<td><label style="color:blue;">${user.lastName}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Gender</label></td>
				<td><label style="color:blue;">${user.gender}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>City</label></td>
				<td><label style="color:blue;">${user.city}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Country</label></td>
				<td><label style="color:blue;">${user.country}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Email</label></td>
				<td><label style="color:blue;">${user.email}</label></td>	
			  </tr>
			  <tr>
		   		<td><label>Programming Language(s)</label></td>
				<td><label style="color:blue;">${user.language}</label></td>	
			  </tr>
			  <tr>
			  	 <th></th>
			  	 <th>
			  	 	<form:form method="get" action="/updateManageProfile" modelAttribute="user">
			  	 		<input name="username" value="${user.username}" type="hidden"/>
			  	 		<input name="status" value="${user.status}" type="hidden"/>
			  	 		<input style="padding: 5px 10px; background-color: #f3d350; text-decoration: none; border-radius: 5px;" 
			  	 			name="edit" type="submit" value="Edit" id="edit">
			  	 		<input style="padding: 5px 10px; background-color: #f3d350; text-decoration: none; border-radius: 5px;" 
			  	 			name="delete" type="submit" value="Delete" id="delete">
			  	 	</form:form>
			  	 </th>
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
	
	<%@ include file="footer.jsp"%>



</body>
</html>