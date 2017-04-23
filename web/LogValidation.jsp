<%-- 
    Document   : LogValidation
    Created on : Jun 2, 2015, 3:55:22 AM
    Author     : hammad
--%>
<%@page import="com.assignment.library.db.Database"%>
<%@page import ="java.sql.*" %>
<%@page import="java.io.IOException"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    
        <%         
            
            
            
            try{
            String checkEmail=request.getParameter("email");
            String checkPwd=request.getParameter("pass");
            int userType= 0;//Integer.parseInt(request.getParameter("user_type").toString());
            String fname="";
            String lname="";
            String phoneNo="";
            int userId;
            
            
            
            
             
             
         
   String query= "SELECT * FROM user WHERE email=\'" +checkEmail +"\' AND password=\'"+checkPwd+"\'";
     // String q2="select * from user where email=\"mdsami039@gmail.com\" and password=\"123\"";
       //   String q2="select * from user";
  
              
            //     String q1="select *from user where email= '"+checkEmail+ "' and password='"+checkPwd+"'";z
                 Database db=Database.getInstance();
                   
                 ResultSet rs;
                 rs=db.select(query);
                 
                 
                 
                 if(rs.next())
                 {
                     fname=rs.getString("f_name");
                     lname=rs.getString("l_name");
                     phoneNo=rs.getString("phone");
                     userType=rs.getInt("user_type");
                     userId = rs.getInt("id");
                     session.setMaxInactiveInterval(2000);
                     session.setAttribute("checkMail",checkEmail);
                     session.setAttribute("fname",fname);
                     session.setAttribute("lname", lname);
                     session.setAttribute("phoneNo", phoneNo);
                     session.setAttribute("userType",userType);
                     session.setAttribute("userType",userType);
                     session.setAttribute("Id",userId);
                     
                     response.sendRedirect("index.jsp");
                                    
                     
                     
                 }
                else
              {
                     response.sendRedirect("login.jsp");
                }
             
            
      }
         catch (SQLException ex) {
             
       
         }
            
            
            
            
            
            
        %>
    

