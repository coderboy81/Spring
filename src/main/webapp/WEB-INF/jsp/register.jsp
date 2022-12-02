<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
	<link rel="stylesheet" href="/css/style.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<%@ include file="header.jsp"%>
	<!-- #home -->




	<section id="registration" class="section">
	 <div class="container tagline">
	 <em>Register User</em><br/>
    		 <form:form method="post" action="/registeruser" modelAttribute="newuser">
    			<label>Username</label> 
    			<form:input path="username" type="text" /><form:errors path="username" cssClass="error"/><br/>
    			<label>Password</label>  
    			<form:input path="password" type="password" /><form:errors path="password" cssClass="error"/><br/>
    			<label>First Name</label>
    			<form:input path="firstName" type="text" /><form:errors path="firstName" cssClass="error"/><br/>
    			<label>Last Name</label>  
    			<form:input path="lastName" type="text" /><br/>
    			<label>Well versed languages</label> 
				<form:input path="language" id="language" type="text" /><form:errors path="language" cssClass="error"/><br/>
    			<label>Date of birth</label>
    			<form:input path="dateOfBirth" type="date" />
    			<form:errors path="dateOfBirth" cssClass="error"/>
    			<br>
    			<label>Gender</label>
    			<form:select path="gender" items="${genderItems}"/>
    			<br>
    			<label>Email</label> 
				<form:input path="email" id="email" type="text" /><form:errors path="email" cssClass="error"/><br/>
				<label>City</label>
				<form:input path="city" id="city" type="text" /><br/>
				<label>Country</label>
				<form:input path="country" id="country" type="text" /><br/>
    			<input type="submit" value="Submit" id="submit">
    		</form:form>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
		<!-- container -->
	</footer>
	<!-- footer -->




</body>
</html>