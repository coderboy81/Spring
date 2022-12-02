<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
</head>
<body>
<header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home"><img src="images/Black And White Modern Vintage Retro Brand Logo.png" alt="Logo - ABC"></a>
            </div><!-- branding -->
            <ul class="navbar">
                <li><a href="/goToUserHome">user home</a></li>
                <li><a href="/updateProfile">update profile</a></li>
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
			  	 onclick="window.location.href='/updateProfile';">Edit</button></th>
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

<section id="guarantee" class="section">
    <header class="imageheader"></header>
    <div class="container">
        <h2 class="headline">Our Guarantee &amp; Ideals</h2>
        <p>We’re committed to creating products that <em>defy convention</em>, and inspire our customers with pride and trust. In fact, we guarantee <a href="#products">every product</a> we sell. If you’re not 100 percent happy with your purchase, you can return it during the first 60 days, <em>no questions asked</em>.</p>
        <p>Philanthropy is extremely important to us. In fact, <em>each employee volunteers</em> for organization of his or her choice, on the clock, for two hours each week. We know that doing good, breeds more doing good, and we’re happy to <em>promote a cycle</em> of volunteerism that just keeps on giving.</p>
    </div>
</section><!-- guarantee -->



<section id="search" class="section">
    <header class="imageheader"></header>
    <div class="container">
        <h2 class="headline">Search Products</h2>
        <form action="search" method="get">
            <label class="card-title">Search your product</label>
            <input type="search" name="search">
            <input type="submit" value="Search">
        </form>
    </div>
</section><!-- guarantee -->




<footer class="footer">
    <div class="container">
        <nav class="nav" role="navigation">
            <div class="container nav-elements">
                <div class="branding">
                    <a href="#home"><img src="images/Black And White Modern Vintage Retro Brand Logo.png" alt="Logo - ABC"></a>
                    <p class="address">100 Main Street<br>
                        Seattle, WA 98144
                    </p>
                </div>
            </div>
        </nav>
        <p class="legal">ABC Community Portal is a fictitious brand created by lynda.com solely for the purpose of training. All products and people associated with ABC Community Portal are also fictitious. Any resemblance to real brands, products, or people is purely coincidental. Information provided about the product is also fictitious and should not be construed to be representative of actual products on the market in a similar product category.</p>
    </div><!-- container -->
</footer><!-- footer -->

</body>
</html>
