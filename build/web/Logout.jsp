<%-- 
    Document   : Logout
    Created on : Jun 3, 2015, 11:50:39 PM
    Author     : Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
  String email=(String)session.getAttribute("checkMail");
   String fname=(String)session.getAttribute("fname");
    String lname=(String)session.getAttribute("lname");
    String phoneNo=(String)session.getAttribute("phoneNo");
           

session.invalidate();
response.sendRedirect("index.jsp");
%>
    </body>
</html>

