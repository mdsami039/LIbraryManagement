<%-- 
    Document   : login
    Created on : May 31, 2015, 6:33:09 PM
    Author     : hammad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LogValidation.jsp" method="POST">
            <center>
                <table border="1" width="25%" cellspacing="5" cellpadding="5">
                    <thead>
                        <tr>
                            <th colspan="2">Admin Login </th>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="" /></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password" value="" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Login" name="login" /></td>
                            <td><input type="reset" value="Reset" name="reset"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a href="index.jsp">Create an Account</a> </td>
                                        
                         </tr> 
                     
                            
                        </tbody>
                </table>

            
        </form>
        
        
    </body>
</html>
