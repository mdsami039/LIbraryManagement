<%-- 
    Document   : register
    Created on : May 29, 2015, 3:46:10 AM
    Author     : hammad
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.util.regex.Pattern" %>
<%@page import="java.util.regex.Matcher" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.assignment.library.db.Database"%>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        
        <%
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String email=request.getParameter("email");
            String pwd1=request.getParameter("pwd1");
            String pwd2=request.getParameter("pwd2");
            String phoneNo=request.getParameter("phoneNo");
            
            String nfname="";
            String nlname="";
            String nemail="";
            String npwd="";
            String nphoneNo="";
                           
 
             Pattern p1,p2,p3;
             Matcher m1,m2,m3;          
         
             
            p1=Pattern.compile("[a-zA-Z]*" );
            m1=p1.matcher(fname);
            p3=Pattern.compile("^[0-9]+$");
            m3=p3.matcher(phoneNo);
            
            
            if(fname.equals("")||(!m1.matches()))
            {
               %>
              <p>Enter the proper first Name</p>
                           <% 
              
            }
            else{
                nfname=fname;
            }
            
           
            m2=p1.matcher(lname);
            if(lname.equals("")&&(!m1.matches()))
            {
                 %>
              <p>Enter the proper last Name</p>
                           <% 
            } 
            else{
                nlname =lname;
                    }
                        
                    
             p2=Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
	       + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
             m2=p2.matcher(email);
           if(email.equals("")&&(!m2.matches()))
            {  
                %>
              <p>Enter the valid Email </p>
                           <% 
               
             }
           else{
               nemail=email;
           }
                     
           
           if(pwd1.equals(pwd2))
           {
              
                npwd=pwd1;
           }
           else{               
              %>
              <p>Enter the same passwords</p>
                           <% 
           }
           
           if((phoneNo.equals(""))&&(!m3.matches()))
           {
              %>
              <p>Enter a valid 5 digit phone No</p>
                           <%  
           }
           else{
               nphoneNo=phoneNo;
               }
          
         try{
// String q1 = "INSERT INTO User VALUES ("+null+","+nfname+","+nlname+","+","+nemail+","+npwd+","+nphoneNo+");";
   String q1=String.format
("insert into user values(null,\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%d\');",nfname,nlname,nemail,npwd,nphoneNo,1); 
          
 
 
          
         Database db=Database.getInstance();
          
            int i= db.update(q1);
            
            System.out.println(i+" rows inserted");         
            if(i>0)
            {
                 response.sendRedirect("login.jsp");
            }
            else{
                response.sendRedirect("register.jsp");
            }
            
        }
          catch (SQLException ex) {
         // Logger.getLogger(Library.class.getName()).log(Level.SEVERE, null, ex);
            }
               
         
        
            
          %>
          
</body>
