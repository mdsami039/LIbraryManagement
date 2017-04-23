<%-- 
    Document   : search
    Created on : May 31, 2015, 11:01:05 AM
    Author     : umair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "com.assignment.library.Book"%>
<%@page import = "com.assignment.library.SearchHandler"%>
<%@page import = "java.sql.SQLException" %>
<%@page import = "java.sql.ResultSet" %>
 <%@page import = "com.assignment.library.db.Database" %>

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
   <li><a href="register.jsp">Register</a></li>

<% } %>

  
   
   
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
<h2 class="title"><span>Search Books </span></h2>
<div class="row2">
        <div>
            <form name="Book Search Form" method="GET" action="">
                <div>
                    <input type="text"  name="searchQuery" value="" size="30"/><input type="submit" value="Search" />
                </div>
                <strong>Search By:</strong> <br/>
                <div>
                    <span><input type="radio" name="SearchType" value="Title"  checked  />Title</span> 
                    <span><input type="radio" name="SearchType" value="Author"/>  Author</span> 
                </div>
            <br/>
            
        </form>
            
        </div>
        
        <div>
            <% 
                    
               if(request.getParameter("searchQuery") != null){
                String searchQuery = request.getParameter("searchQuery");
                SearchHandler search = new SearchHandler();
                if(request.getParameter("SearchType") != null){
                String type = request.getParameter("SearchType");
                ArrayList<Book> books;
                if(type.equals("Title"))
                    books = search.searchBookByTitle(searchQuery);
                else
                    books = search.searchBookByAuthor(searchQuery);
                if(books.size() < 1){
            %>
            <p><%= books.size() %>
             No Book found with this title</p>
            <% }else{ %>
            <table border="1">
                <th>Title</th><th>ISBN</th><th>Year</th><th>Publisher</th><th>Category</th><th>Authors</th>
                  
            <% for(int i = 0; i < books.size(); i++){%>
                <tr>
                    <td><%= books.get(i).getTitle() %></td>
                    <td><%= books.get(i).getISBN() %></td>
                    <td><%= books.get(i).getPublish_year() %></td>
                    <td><%= books.get(i).getPublisher() %></td>
                    <td><%= books.get(i).getCategoryName() %></td>
                    <td><%= books.get(i).AuthorNames() %></td>
                    
                    <td><input type="button" onclick="window.open('bookdetail.jsp?value=<%= books.get(i).getID() %>','_self')" value="View Detail"</td>
                </tr>
            <% }%>
        </table>
        <% }}} %>    
            
        </div>
</div>
</div>
<div class="vline">

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

        
        
        
        
    </body>
</html>
