<%-- 
    Document   : response
    Created on : May 31, 2015, 11:14:41 AM
    Author     : umair
--%>


       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>   
                   <form name="Book Search Form" method="GET" action="">
                <div>
                    <input type="text"  name="searchQuery" value="" size="30"/><input type="submit" value="Search" />
                </div>
                <strong>Search By:</strong> <br/>
                <div>
                    <span><input type="radio" name="SearchType" value="Title"  <%if(request.getParameter("SearchType").equals("Title")){%>checked="checked"<% }%> />Title</span> 
                    <span><input type="radio" name="SearchType" value="Author"  <%if(request.getParameter("SearchType").equals("Author")){%>checked="checked"<% }%>/> Author</span> 
                </div>
            <br/>
            
        </form>

    </body>
</html>
