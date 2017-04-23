<%-- 
    Document   : login
    Created on : May 31, 2015, 6:33:09 PM
    Author     : Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>FedUni Books</title>
  <meta name="description" content="FedUni Books">
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
  <li style="border-left: medium none;"><a href="index2.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
   <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkmail")!="") {%>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <li><a hreg="Logout.jsp">Log Out</a></li>
<%}else{%>
  <li><a href="a.jsp">Login</a></li>
  

<% } %>

   <li><a href="index.jsp">Register</a></li>
   
   
   
   
   
</ul>
</div>
</div>
<div class="content">
<div class="content-in">
<div class="left-panel">

<div class="left-content">

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
<h2 class="title"><span>Welcome to  <span>FedUni Books</span></span></h2>
<div class="row2">
      <form action="LogValidation.jsp" method="POST">
            <center>
                <table border="1"  width="25%" cellspacing="5" cellpadding="5">
                    <thead>
                        <tr>
                            <th colspan="2">User Login </th>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><stron><span>Email</span></strong></td>
                            <td><input type="text" name="email" value="" /></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="pass" value="" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Login" name="login" /></td>
                            <td><input type="reset" value="Reset" name="reset"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a href="index.jsp">Create an Account</a> </td>
                                       
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
  
   <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkmail")!="") {%>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <li><a hreg="Logout.jsp">Log Out</a></li>
<%}else{%>
  <li><a href="a.jsp">Login</a></li>
  

<% } %>

   <li><a href="index.jsp">Register</a></li>
   
   
</ul>
</div>
</div>
</div>

</body></html>
