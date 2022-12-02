<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <title>ABC Community Portal</title>
  <link rel="stylesheet" href="<spring:theme code='styleSheet'/>" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%@ include file="header.jsp"%>

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
  
   

<%@ include file="footer.jsp"%>


</body>
</html>
