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
                <a href="#home"><img src="images/images/Black And White Modern Vintage Retro Brand Logo.png" alt="Logo - ABC"></a>
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
	<!-- search results -->
            <c:if test="${!empty(currentuser)}">
            <section id="registration" class="section">
	 <div class="container tagline">
	 <br><em>Update Profile</em><br>
    		 <form:form method="post" action="/updateprofile" modelAttribute="currentuser">
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



</body>
</html>
