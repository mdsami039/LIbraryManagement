<%@page import="com.assignment.library.db.Database"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*,java.util.*,java.util.Date,java.util.Calendar" %>
<html>
<head><title>Book</title></head>
<body>
   
<%
    if(null != session.getAttribute("Id")){
  String query="";
  if(request.getParameter("loan") != null )
{
     Calendar return_date=Calendar.getInstance();
     //alendar cal = Calendar.getInstance();
     return_date.setTime(new Date());
     return_date.add(Calendar.DATE,14);
     //Date d=new Date();
     java.sql.Date issue_date= new java.sql.Date(new Date().getTime());
     Date d= return_date.getTime();
     java.sql.Date return_date_final= new java.sql.Date(d.getTime());
             //out.println(d1);

     
 query ="insert into loan values (null, "+session.getAttribute("Id")+","+request.getParameter("value")+",\""+issue_date+"\",\""+return_date_final+"\", 0)";
  
}
if( request.getParameter("return") != null )
 {
      query ="update loan set returnFlag=1 where user_id="+session.getAttribute("Id")+" and book_id="+request.getParameter("value");
 }
   Database db=Database.getInstance();

       int x=db.update(query);
       
       
               
          if( x > 0) {
             
              %>
              <a href="book.jsp">Success.Please return to Book Page</a>
              <%          
          }       
   

    }
    else
    {
        
        response.sendRedirect( "book.jsp" );
      
    }
   
%>

</body>
</html>