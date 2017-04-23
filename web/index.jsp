<%-- 
    Document   : Home
    Created on : Jun 7, 2015, 1:36:22 AM
    Author     : hammad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        
 <div class="main">
<div class="page">
<div class="header">
<div class="banner">
<h1>FedUni Books</h1>
</div>
<div class="topmenu">
<ul>
  <li style="border-left: medium none;"><a href="index.jsp">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
      <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkMail")!="") {%>
  <li><a href="Logout.jsp">Log Out</a></li>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <% if(Integer.parseInt(session.getAttribute("userType").toString()) == 2) {%>
        <li><a href="adminpanel.jsp">Admin Panel</a></li>
  
<%}}else{%>
  <li><a href="login.jsp">Login</a></li>
  

<% } %>

   <li><a href="register.jsp">Register</a></li>
   
   
</ul>
</div>
</div>
<div class="content">
<div class="content-in">
<div class="left-panel">
<h2>Search Book</h2>
<div class="left-content" style="color:#000000;">
    <form action="search.jsp" method="GET">
                <br/><div>
                    <input type="text"  name="searchQuery" value="" size="25"/><input type="submit" value="Search" />
                </div>
                <strong>Search By:</strong> <br/>
                <div>
                    <span><input type="radio" name="SearchType" value="Title"  checked  />Title</span> 
                    <span><input type="radio" name="SearchType" value="Author"/>  Author</span> 
                </div>
    </form>  
</div>
<div class="gap">
    
</div>
<h2>Recent Updates</h2>
<div class="left-content">
<ol>
  <li><span><strong>FedUni Books</strong> is 
one among the world top 10 libraries.</span> <a href="#" class="more">read more...</a></li>
</ol>
</div>
</div>
<div class="right-panel">
<div class="right-panel-in">
<div class="row">
<h2 class="title"><span>Welcome to  <span>FedUni Books</span></span></h2>
<div class="row2">
FedUni Booksbring people together, enrich lives and provide children and adults with opportunities to learn.

The libraries offer families and children fun, learning and free access to 1 million books, CDs and DVDs, and numerous events to help kids read and do their homework.
Libraries are key to successful communities and families.
<ul class="list-home">
  <li><strong>To bring the world of information and imagination to all people of our community.</strong></li>
  <li><strong>To bring the people from dark to light.</strong></li>
</ul>
</div>
</div>
<div class="vline">
<div class="section1">
<h2 class="title"><span>About <span>Us</span></span></h2>
<div class="row" style="padding-left: 40px;">
<p>&nbsp;</p>
<p><strong>FedUni Library System has been serving customers for more than 15 years. The Library System has changed a lot in that time.

In 2000 seven libraries served 55,000 people. Today, it is the state's fourth largest library system with 18 libraries serving 555,000 people.

In 2000 Pierce County Library offered 6,385 books and 6,800 from Tacoma Public Library. Today it offers 1 million books, CDs, DVDs, audiobooks and more. It also offers computers with high-speed Internet access and free Wi-Fi.</p>
<p>&nbsp;</p>
<p align="right"><a href="#" class="more2">read more</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</div>
<div class="section2">
<h2 class="title"><span>Recent <span>Articles</span></span></h2>
<div class="row">
<p>&nbsp;</p>
<p><strong>
Give a child a book this season.</p>
<p>&nbsp;</p>
<p>“Pay It Forward” this holiday season by giving a child a book of their own. With every gift to the 2014-15 Annual Giving Campaign, we’ll give an at-risk child a book they can keep. Inside, there’s a message of encouragement from you! Find out how.</p>
<p>&nbsp;</p>
<p align="right"><a href="#" class="more2">read more</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="footer">
<ul>
  
  <li style="border-left: medium none;"><a href="home.jsp">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
    <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkMail")!="") {%>
    <li><a href="UserProfile.jsp">User Profile</a></li>
    <li><a href="Logout.jsp">Log Out</a></li>
<%}else{%>
  <li><a href="index.jsp">Login</a></li>
   <li><a href="index.jsp">Register</a></li>
  

<% } %>

   
</ul>
</div>
</div>
</div>


<img src="images/footer.gif" class="footer" alt="htmlfiles"></a> 
        
        
        
        
        
        
    </body>
</html>
