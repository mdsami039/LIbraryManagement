<%-- 
    Document   : UserProfile
    Created on : Jun 2, 2015, 6:30:24 AM
    Author     : hammad
--%>

<%@page import="com.assignment.library.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import ="java.sql.*" %>

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
  <li style="border-left: medium none;"><a href="index.jsp">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
   <%    if ((session.getAttribute("checkMail") != null)&&session.getAttribute("checkMail")!="") {%>
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
<h2 class="title"><span>User Profile <span></span></span></h2>
<div class="row2">

        <form action="UserEdit.jsp" method ="get">
            
<%
    String email=(String)session.getAttribute("checkMail");
    String fname=(String)session.getAttribute("fname");
    String lname=(String)session.getAttribute("lname");
    String phoneNo=(String)session.getAttribute("phoneNo");

    
  
      
  
     String q1="SELECT * FROM user where email=\'"+email+"\'";
     String q2= "SELECT * FROM book";
     Database db=Database.getInstance();
     ResultSet rs1,rs2;
     rs1=db.select(q1);
        
    // rs2=db.select(q2);
     
     %>
   
   
     <%if(rs1.next())
     {%>
      
     <table  width="25%" cellspacing="5" cellpadding="5">
         <thead>
           
         </thead>
         <tbody>
             <tr>
                 <td>First Name</td>
                 <td><%= rs1.getString("f_name") %></td>
               
                
             </tr>
             <tr>
                 <td>Last Name</td>
                 <td><%= rs1.getString("l_name") %></td>
             </tr>
             <tr>
                 <td>Phone No</td>
                 <td><%= rs1.getString("phone") %></td>
             </tr>
             <tr>
                 <td><input type="submit" value="Edit" name="edit" /></td>
                 
             </tr>
             
             
             
         </tbody>
              
       
     </table> 
         
     <%}%>  
     
      
  
    
    
         
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
  

<% } %>

   
   
   
</ul>
</div>
</div>
</div>
</body>
</html>


 
 
 
 
