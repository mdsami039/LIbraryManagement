<%@page import="com.assignment.library.db.Database"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*,java.util.*,java.util.Date" %>
<html>
<head><title>Book</title>
    <style>
#header {
    background-color:black;
    text-align:center;
    color:white;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
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
</head>
<body>
    <div id="header" > <h1>Library Book Listing</h1> </div>
    <div >
        <center>
            
        <table >
            <thead>
            <tr>
                  <td>
                      <b>Category</b>
                  </td>
                  <td>
                      <b>Title</b>
                  </td>
                  <td>   
                      <b> More Detail </b>
                  </td>
              </tr>
              </thead>
      <tbody>
    
<%
  String query="select b.id,b.title,p.publisher_name,b.publish_year,b.isbn,b.description,c.name from book b,publisher p,book_category c where b.publisher_id=p.id and b.category_ID=c.id order by c.name;";
  
   Database db=Database.getInstance();
   try{
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
              <tr>
                  <td>
                      <%=categoryname%>
                  </td>
                  <td>
                     <%=title%>
                  </td>
                   <td>
                      <a href="bookdetail.jsp?value=<%=id%>" >Detail</a>
                  </td>
              </tr>
              
              <%          
          }
       
     
     
 
       

   
   }
   catch(SQLException ie){
          ie.getMessage();
   }
   

%>
      </tbody>
    </table>
            </center>

    </div>
</body>
</html>