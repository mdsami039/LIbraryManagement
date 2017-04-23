<%@page import="com.assignment.library.db.Database"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*,java.util.*,java.util.Date" %>
<html>
<head><title>Book Details</title></head>
<!DOCTYPE html>
<html>
<head>
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:100%;
    width:200px;
    float:left;
    padding:5px;	      
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>

<body>
<div id="header">
<h1>Book Detail</h1>
</div>
<div id="nav">

<%
   
    String insertComment=null;
    if(request.getParameter("comment") != null)
    {
        if(request.getParameter("comment").length() > 0){
        insertComment="insert into comment values (null,\""+request.getParameter("comment")+"\","+request.getParameter("value")+","+session.getAttribute("Id")+")";
          //insertComment= "insert into comment values (null,\"test test\",1,1)";
        }
        }
        
  //String query="select * from book where id="+request.getParameter("value");
  String query="select b.id,b.title,p.publisher_name,b.publish_year,b.isbn,b.description,c.name from book b,publisher p,book_category c where b.publisher_id=p.id and b.category_id=c.id and b.id="+request.getParameter("value");
  String queryauthor="select * from author where id="+request.getParameter("value");
  String queryComment="select u.f_name,c.description from user u,comment c where u.id=c.user_id and c.book_id="+request.getParameter("value");
  //String queryAvailableBook="select total-(select sum(returnFlag) from loan where bookid=1 and returnflag=1) from book_inventory where bookid=1 ;
  
    String queryTotalAvailableBook="select copies-(select count(returnFlag) from loan where book_id="+request.getParameter("value")+" and returnFlag=0) from book where id="+request.getParameter("value");
  String queryReturnBook="select count(*) from loan where user_id="+session.getAttribute("Id")+" and book_id="+request.getParameter("value")+" and returnFlag = 0";
   int totalAvailableBook;
   int returnBook;
  
  Database db=Database.getInstance();
   try{
       //insert comment when string is not null
       if(insertComment != null)
       {
          db.update(insertComment);
       }
       ResultSet rs=db.select(query);
       
       
       //ResultSetMetaData rsmd=rs.getMetaData();       
       int id;
       String title;
       String publishername;
       String publishDate;
       String isbn;
       String description;
       String categoryname;
               
               
               
          while (rs.next()) {
             
             id=rs.getInt(1);
             title=rs.getString(2);
             publishername=rs.getString(3);
             publishDate=rs.getString(4);
             isbn=rs.getString(5);
             description=rs.getString(6);
             categoryname=rs.getString(7);
              
              %>
              

              <b> Title: </b> <%=title%> </br>
             <b>Publisher:</b> <%=publishername%> </br>
             <b>Published Date:</b> <%=publishDate%><br>
                <b>ISBN: </b> <%=isbn%><br>
                <b> Description: </b> <%=description%><br>
            <b> Category : </b> <%=categoryname%> <br>
            <b> Author(s): </b>



              
              <%     
              
          }
          ResultSet rsauthor=db.select(queryauthor);
          while (rsauthor.next()) {
             
             
          
          %>
<%=rsauthor.getString(2)%> <br>
<%
          }
%>
</div>          
          
<div id="section">
<h2>Comments From Users </h2>
<table><thead>
<tr>
    <td>  <b>  Commented By   </b>  </td>  <td> <b>  Comments </b> </td>   
</tr>
    </thead>
    <tbody>

          <%
          ResultSet rs2=db.select(queryComment);
          String username;
          String bookComment;
          
          while (rs2.next()) {
             
             username=rs2.getString(1);
             bookComment =rs2.getString(2);
             //publishDate=rs.getDate(4);
             
          %>
          
          <tr><td>
                  <%= username %></td>
              
              <td>  <%= bookComment %></td>
          </tr>
          
          <% 
     
     
          }
       
  
%>


<tr>
<form action="bookdetail.jsp?value=<%= request.getParameter("value") %> " method="POST">
      
            <table>
                <tbody>
                    
                    <tr>
                        <td><b>Comment</b></td>
                        <td><input type="text" name="comment" value="" /></td>
                    
                    <%
                    if(null != session.getAttribute("Id")){
                     out.println("<td><input type=\"submit\" name=\"submit\" value=\"Submit\" /></td>");
                                }
                                %>
                                </tr>
                </tbody>
            </table>

</form>

<% totalAvailableBook=0;

         ResultSet rs3=db.select(queryTotalAvailableBook);
         while (rs3.next()){
         
         totalAvailableBook=rs3.getInt(1);
         
         
         }

 returnBook=0;

         ResultSet rs4=db.select(queryReturnBook);
         while (rs4.next()){
         
         returnBook=rs4.getInt(1);
         
         
         }



%>
</tr>
<tr>
<form action="bookReturnLoan.jsp?value=<%= request.getParameter("value") %> " method="POST">   
                    <tr>
                        <td><b> Book Availability</b></td>
                        <td><input type="text" name="totalAvailableBook" value="<% String max=(totalAvailableBook > 0)?"Available":"NotAvailable";  %><%=max%>" /></td>
                    
                    <% 
                    if(returnBook == 0 && totalAvailableBook > 0 && (session.getAttribute("Id") != null))
                    {
                        out.println("<td><input type=\"submit\" name=\"loan\" value=\"loan\" /></td>");
                                }
                    
                    
                     if(returnBook > 0 && (session.getAttribute("Id") != null))
                    {
                        out.println("<td><input type=\"submit\" name=\"return\" value=\"return\" /></td>");
                                }
                                %>
          </tr>

             

        </form>
    
                    <%
                    
                     }
   catch(SQLException ie){
          out.println(ie.getMessage());
   }
   

                    
                   
%>
</tr>
</table>
</div>
</body>
</html>
