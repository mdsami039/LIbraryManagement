<%-- 
    Document   : UserEdit
    Created on : Jun 6, 2015, 2:00:11 AM
    Author     : hammad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.regex.Pattern" %>
<%@page import="java.util.regex.Matcher" %>
<%@ page import="java.sql.*"%>
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
  <li style="border-left: medium none;"><a href="index.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
   <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkmail")!="") {%>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <li><a href="Logout.jsp">Log Out</a></li>
<%}else{%>
  <li><a href="login.jsp">Login</a></li>
  

<% } %>

   
   
   
   
   
   
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

        <form name="editform" action="Update.jsp">
        
       
       <%
           String email = (String)session.getAttribute("checkMail");
           String fname=(String)session.getAttribute("fname");
           String lname=(String)session.getAttribute("lname");
           String phoneNo=(String)session.getAttribute("phoneNo");
           //int user=(int)session.getAttribute("userType");
           
         %>
         <table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">
            <tr><td colspan=2 style="font-weight:bold;" align="center">Edit User</td></tr>
            <tr><td colspan=2 align="center" height="10px"></td></tr>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="nfname" value="<%= fname %>"></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="nlname" value="<%= lname %>"></td>
                
            </tr>
            <tr>
                <td>Phone No</td>
                <td><input type ="text" name="nphone" value="<%= phoneNo %>"></td>
            <tr>
                <td><td><input type="submit" value="Update" name="submit" /></td>
                
            </tr>
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
  
  <li style="border-left: medium none;"><a href="index.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
  
   <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkmail")!="") {%>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <li><a hreg="Logout.jsp">Log Out</a></li>
<%}else{%>
  <li><a href="a.jsp">Login</a></li>
  <li><a href="Logout.jsp">Log Out</a></li>
  

<% } %>

   
   
   
</ul>
</div>
</div>
</div>
    </body>
</html>
