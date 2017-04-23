<%-- 
    Document   : Updating
    Created on : Jun 6, 2015, 7:22:44 PM
    Author     : hammad
--%>

<%@page import="com.assignment.library.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import ="java.sql.*" %>

        <%
            String s = (String)session.getAttribute("checkMail");
            String fname = request.getParameter("nfname");
            String lname = request.getParameter("nlname");
            String phoneNo = request.getParameter("nphone");
           // int  user=(int)session.getAttribute("userType");
            
            
            
         try
            {
       String q1 = "update user set f_name=\'"+fname+"\',l_name='"+lname+"\',phone=\'"+phoneNo+"\' where email=\'"+s+"\';";
    

                
                 
         
               Database db=Database.getInstance();
          
            int i= db.update(q1);
            
            System.out.println(i+" rows updated");         
            if(i>0)
            {
                 response.sendRedirect("UserProfile.jsp");
            }
      //      else{
        //        response.sendRedirect("index.jsp");
          //  }
            
        }
          catch (Exception ex) {
         // Logger.getLogger(Library.class.getName()).log(Level.SEVERE, null, ex);
            }
               
            
            
            %>
        
    </body>
</html>
