<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<%@ include file="header.jsp"%>
	<!-- #home -->

	<section id="search" class="section">
		<header class="imageheader"></header>
		<div class="container">
			<h2 class="headline">Search</h2>
			<form action="/search" method="get">
				<label class="card-title">Search your programmer</label>
				 <input path="search" name="search" value="">
			    <input type="submit" value="Search">
			</form>
		</div>
	</section>
	<!-- guarantee -->
            <!--<c:if test="${!empty(products)}">
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
            </c:if>-->
            
            <!-- search results -->
            <c:if test="${!empty(users)}">
            <br><em>SEARCH RESULTS</em>
    		<section id="products" class="section">
    		<div class="productContainer">
    		<table id="profile">
			  <tr>
			    <th>Developer Name</th>
			    <th></th>
			  </tr>
            <c:forEach var="user" items="${users}">
		   		<form action="/viewuserprofile" method="get" modelAttribute="currentuser">
		   		<tr>
		   		<td><label>${user.firstName} ${user.lastName}</label> <input type="hidden" name="username" value="${user.username}" readonly></td>
				<td><input type="submit" value="View"></td>	
				</tr>
				</form>
            </c:forEach>
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