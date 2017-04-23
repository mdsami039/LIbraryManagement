<%-- 
    Document   : newjsp
    Created on : May 29, 2015, 3:36:07 AM
    Author     : hammad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
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
  <li style="border-left: medium none;"><a href="index2.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
<%--  <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkmail")!="") {%>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <li><a hreg="Logout.jsp">Log Out</a></li>
<%}else{%>
  <li><a href="a.jsp">Login</a></li>
  

<% } %>

   <li><a href="index.jsp">Register</a></li>
   --%>
   
</ul>
</div>
</div>
<div class="content">
<div class="content-in">
<div class="left-panel">
<h2>Book Lists</h2>
<div class="left-content">
<ul>
  <li><a href="#">Books for infants</a></li>
  <li><a href="#">Books for preschool</a></li>
  <li><a href="#">Books for elementary</a></li>
  <li><a href="#">Books for teens</a></li>
<li><a href="#">Books for adults</a></li>
</ul>
</div>
<div class="gap"></div>
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
<h2 class="title"><span>Welcome to The Registration Page </span></span></h2>
<div class="row2">

        <form action="validation.jsp" method="POST">
          
            <table border="1" width="25" cellspacing="3" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Phone No</td>
                        <td><input type="text" name="phoneNo" value="" /></td>
                        
                    </tr>
                     <tr>
                        <td>Password</td>
                        <td><input type="password" name="pwd1" value="" /></td>
                        <td><input type="password" name="pwd2" value=""/></td>
                            
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" name="submit" value="Register" /></td>
                        
                    </tr>
                </tbody>
            </table>

        </form>
</div>
</div>
<div class="vline">
</div>
</div>
</div>
</div>
</div>
<div class="footer">
<ul>
  
  <li style="border-left: medium none;"><a href="index2.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>

   
</ul>
</div>
</div>
</div>        
    </body>
</html>
