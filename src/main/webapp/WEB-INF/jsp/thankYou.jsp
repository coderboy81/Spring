<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Thank You</title>
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
			<p>User registered successfully!<br>
			A registration confirmation email is sent to you.
			</p>
		</div>
	</section>
	<!-- guarantee -->
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


	

	<%@ include file="footer.jsp"%>
		<!-- container -->
	</footer>
	<!-- footer -->




</body>
</html>