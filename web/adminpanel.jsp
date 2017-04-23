<%-- 
    Document   : adminpanel
    Created on : Jun 3, 2015, 5:45:54 PM
    Author     : umair
--%>

<%@page import="com.assignment.library.UserType"%>
<%@page import="com.assignment.library.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.assignment.library.Author"%>
<%@page import="com.assignment.library.Category"%>
<%@page import="com.assignment.library.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.assignment.library.Book"%>
<%@page import="com.assignment.library.AdminPanelHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>FedUni Books</title>
  <meta name="description" content="FedUni Books">
  <link href="css/style.css" rel="stylesheet" type="text/css">
  <link href="js/admin.js" type="text/javascript"/>
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
  <li style="border-left: medium none;"><a href="index2.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
   <%  
       boolean isAdmin = false;
       boolean isLogin = false;
       if((session.getAttribute("checkMail") != null) && session.getAttribute("checkmail")!="" && session.getAttribute("userType") != null ) {
           isLogin = true;
           if(Integer.parseInt(session.getAttribute("userType").toString()) == 2)
               isAdmin = true;
           else
               response.sendRedirect("admin.jsp");                      
    %>
  <li><a href="UserProfile.jsp">User Profile</a></li>
  <li><a hreg="Logout.jsp">Log Out</a></li>
    <%}else{
    response.sendRedirect("admin.jsp");
    %>
  <li><a href="login.jsp">Login</a></li>
  <li><a href="register.jsp">Register</a></li>

<% } %>

</ul>
</div>
</div>
<div class="content">
<div class="content-in">
<div class="left-panel">
<h2>Admin Panel</h2>
<div class="left-content">
<ul>
  <li><a href="adminpanel.jsp?page=ManageBooks">Manage Books</a></li>
  <li><a href="adminpanel.jsp?page=ManageCat">Manage Categories</a></li>
  <li><a href="adminpanel.jsp?page=ManageUsers">Manage Users</a></li>
  <li><a href="adminpanel.jsp?page=ManageLoans">Manage Loans</a></li>
  <li><a href="adminpanel.jsp?page=ViewStatistics">View Statistics</a></li>
</ul>
</div>
<div class="gap"></div>
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
  <% 
      String type = "ManageBooks";
     if(request.getParameter("page") != null)
        type = request.getParameter("page");
     String pageTitle = "";
     if(type.equals("ManageBooks")){
         pageTitle = "Manage Books";
     }else if(type.equals("ManageCat")){
         pageTitle = "Manage Categories";
     }else if(type.equals("ManageUsers")){
         pageTitle = "Manage Users";
     }else if(type.equals("ManageLoans")){
         pageTitle = "Manage Loans";
     }else if(type.equals("ViewStatistics")){
         pageTitle = "Statistics";
     } 
        
  %>
    <h2 class="title"><span><%= pageTitle %></span></h2>
<div class="row2">
  <% 
        if(type.equals("ManageBooks")){
            String subMenu = "";
            if(request.getParameter("subPage") != null)
                subMenu = request.getParameter("subPage");
            %>
            <div class="topmenu">
                <ul>
                    <li style="border-left: medium none;"><a href="adminpanel.jsp?page=ManageBooks&subPage=ViewList">Books List</a></li>
                    <li><a href="adminpanel.jsp?page=ManageBooks&subPage=AddNew">Add New Book</a></li>
                    <li><a href="#"></a></li>
                </ul>
            </div>
            
            <div>
                <%           
            
                    AdminPanelHandler aph = new AdminPanelHandler();
         
                    if(subMenu.equals("ViewList")){
                   ArrayList<Book> books  = aph.booksList();
                   
                   if(books.size() > 0){
                %>
                    <%= subMenu %>
                    <table border="1">
                        <th>Book ID</th><th>Title</th><th>Date Published</th><th>Publisher</th><th>ISBN</th><th>Category</th><th>Authors</th>
                        <% for(int i = 0; i <books.size(); i++){ %>
                        <tr>
                            <td><%= books.get(i).getID() %></td>
                            <td><%= books.get(i).getTitle() %></td>
                            <td><%= books.get(i).getPublish_year()%></td>
                            <td><%= books.get(i).getPublisher() %></td>
                            <td><%= books.get(i).getISBN() %></td>
                            <td><%= books.get(i).getCategoryName() %></td>
                            <td><%= books.get(i).AuthorNames() %></td>
                        </tr>
                        <% }%>
                    </table>
               <% 
                   }
                } else if(subMenu.equals("AddNew")){
                    ArrayList<String> validate = new ArrayList<String>();
               
                    if(request.getParameter("submitted") != null){
                        String title = request.getParameter("title")!=null?request.getParameter("title"):""; 
                        String edition = request.getParameter("edition")!=null?request.getParameter("edition"):"";
                        String year = request.getParameter("year")!=null?request.getParameter("year"):"";
                        String city = request.getParameter("city")!=null?request.getParameter("city"):"";
                        int pubID = Integer.parseInt(request.getParameter("publisher"));
                        String description = request.getParameter("description")!=null?request.getParameter("description"):"";
                        String ISBN = request.getParameter("ISBN")!=null?request.getParameter("ISBN"):"";
                        int copies = request.getParameter("copies")!=null?Integer.parseInt(request.getParameter("copies")):0;
                        int catID = request.getParameter("category")!=null?Integer.parseInt(request.getParameter("category")):0;
                        
                        if(request.getParameter("passCount")!= null){
                            ArrayList<Integer> selectedAuthorId = new ArrayList<Integer>();
                            for(int i =0; i < Integer.parseInt(request.getParameter("passCount")); i++){
                                   selectedAuthorId.add(Integer.parseInt(request.getParameter("pass"+i)));
                            }
                            if(aph.addBook(new Book(title,edition,year,city,pubID,description,ISBN,catID,copies),selectedAuthorId)){
                                %>
                                <div style="text-align: center;">BOOK ADDED SUCCESSFULLY</div>
                                <%
                            }
                        
                        }
                       // if(aph.addBook()){
                          
                        //}else{
                        
                        
                        //}
                    }
                    ArrayList<Publisher> publishers  = aph.publisherList();
                    ArrayList<Category> categories  = aph.categoriesList();
                    ArrayList<Author> authors  = aph.authorsList();
                    %>
                    <form name="newBook" method="POST" >
                        <div>
                            <span>Title: </span>
                            <span>
                                <input type="text" name="title" value="" />
                            </span>
                        </div>
                        <br/>
                        <div>   
                            <span>Edition: </span>
                            <span>
                                <input type="text" name="edition" value="" />
                            </span>
                        </div>
                        <br/>
                        Published:
                        <div>
                            <span>Year:</span>
                            <span>
                                <input type="text" name="year" value="" />
                            </span>
                            <span>City: </span>
                            <span>
                                <input type="text" name="city" value="" />
                            </span>
                            <span>
                                Publisher:</span> 
                            <span><select name = "publisher">
                                    <% for(int i = 0; i < publishers.size(); i++){ %>
                                        <option value="<%= publishers.get(i).getId() %>"><%= publishers.get(i).getName() %></option>
                                    <% } %>
                                </select>
                            </span>
                        </div>
                        Author(s):
                        <div>
                            <div >
                                <div >
                                    <span>Select Author: 
                                        <select id ="cmbAuthor" name="cmbAuthor">
                                            <% for(int i = 0; i < authors.size(); i++){ %>
                                                <option value="<%= authors.get(i).getAuthor_ID() %>"><%= authors.get(i).getAuthor_name() %> <%= authors.get(i).getAuthor_lname() %></option>
                                            <% } %>        
                                        </select>
                                        <input type="button" name="addAuthor" value="Add" onclick="handleExistingAuthor()"/>       
                                </div>
                                <div> 
                                    <p>OR</p><br/>
                                    
                                    <strong>New Author</strong><br/> 
                                    First Name: <input type="text" name="newAuthorName"/>
                                    <br/>Last Name: <input type="text" name="newAuthorLastName"/>
                                    <br/><input type="button" name="addAuthorNew" value="Add" onclick=""/>
                                    
                                </div>
                            </div>
                            <div>            
                                <table border = "1" id="selectedList">
                                    <tr></tr>
                                </table>
                            </div>
                        </div>        
                        <br/>
                        <div>
                        <div>
                            <span>Description:</span>
                            <span>
                                <input type="text" name="description" value="" />
                            </span>
                        </div>
                        <br/>
                        <div>
                            <span>ISBN:</span>
                            <span>
                                <input type="text" name="ISBN" value="" />
                            </span>
                        </div>
                        <br/>
                        <div>
                            <span>Copies:</span>
                            <span>
                                <input type="text" name="Copies" value="" />
                            </span>
                        </div>
                        <br/>
                        <div>
                            <span>Category:</span>
                            <span>
                                <select name="category">
                                    <% for(int i = 0; i < categories.size(); i++){ %>
                                    <option value="<%= categories.get(i).getId() %>"><%= categories.get(i).getName() %></option>
                                    <% } %>
                                </select>
                                
                            </span>
                        </div>
                                <input type="hidden" name="submitted" value="1"/>
                                <div style="width: 50%; margin: 0 auto;"><input type="submit" value="Add New Book" name="submit"/></div>
                    </div>            
                                
                                
                     <script type="text/javascript">
                            var passList = [];
                            var passIDList = [];

                            function handleExistingAuthor() {
                                    var t = document.getElementById('cmbAuthor');
                                    var passenger = t.options[t.selectedIndex].text;
                                    var passengerID = t.options[t.selectedIndex].value;

                                    var found = 0;
                                    for (var i = 0; i < passList.length; i++) {
                                       if(passList[i] ===  passenger)
                                          found = 1;
                                    }   
                                    if(found === 0){
                                        passList.push(passenger);    
                                        passIDList.push(passengerID);
                                        loadList();   
                                    }

                            }


                                            function newPass() {
                                                var comID = document.getElementById('cmbCompany').value;
                                                var txtName = document.getElementById('txtPassName').value;
                                                var txtPassContact = document.getElementById('txtPassContact').value;
                                                var txtPassEmail = document.getElementById('txtPassEmail').value;    

                                                if (txtName == "") {
                                                    //document.getElementById("cmbSelectPassanger").innerHTML = "";
                                                    return;
                                                } else {
                                                    if (window.XMLHttpRequest) {
                                                        // code for IE7+, Firefox, Chrome, Opera, Safari
                                                        xmlhttp = new XMLHttpRequest();
                                                    } else {
                                                        // code for IE6, IE5
                                                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                                                    }
                                                    xmlhttp.onreadystatechange = function() {
                                                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                                            //document.getElementById("cmbSelectPassanger").innerHTML = xmlhttp.responseText;
                                                            var txtName = document.getElementById('txtPassName').value = "";
                                                            var txtPassContact = document.getElementById('txtPassContact').value = "";
                                                            var txtPassEmail = document.getElementById('txtPassEmail').value = "";  
                                                            loadPassanger(comID);         
                                                            function selectPassenger() {
                                                            var t = document.getElementById('cmbSelectPassanger');
                                                            var passenger = t.options[t.selectedIndex].text;
                                                            var passengerID = t.options[t.selectedIndex].value;

                                                            var found = 0;
                                                            for (var i = 0; i < passList.length; i++) {
                                                              if(passList[i] ==  passenger)
                                                                 found = 1;
                                                              }   

                                                              if(found == 0){
                                                                passList.push(passenger);    
                                                                passIDList.push(passengerID);
                                                                loadList();   
                                                              }

                                            }                          
                                                        }
                                                    }
                                                    xmlhttp.open("GET","add_passenger.php?passName="+txtName+"&passContact="+txtPassContact+"&passEmail="+txtPassEmail+"&companyID="+comID,true);
                                                    xmlhttp.send();
                                                }
                                            }

                                        function loadList(){
                                            var count = passList.length;
                                            var tab = "<table>";
                                               tab = tab + "<th><strong>Selected Author</strong></th><th><strong>Remove</strong></th>";
                                                       
                                    
                                              for (var i = 0; i < passList.length; i++) {
                                                   var pid = "'"+passIDList[i]+"'";
                                                   var pname = "'"+passList[i]+"'";

                                                   tab = tab + "<tr><td>"+passList[i]+"<input type='hidden' name=pass"+i+" value="+pid+"></input></td><td><input type='button' onclick=removeItem("+ pname +","+ pid +") value='X'></input></td></tr>";     
                                              }   

                                              tab = tab + "</table><input type='hidden' name='passCount' value="+count+"></input>";

                                              document.getElementById("selectedList").innerHTML = tab;  
                                        }

                                        function removeItem(itemName,itemValue){
                                           for(var i = passList.length - 1; i >= 0; i--) {
                                            if(passList[i] == itemName) {
                                               passList.splice(i, 1);
                                            }
                                           }

                                           for(var i = passIDList.length - 1; i >= 0; i--) {
                                            if(passIDList[i] == itemValue) {
                                               passIDList.splice(i, 1);
                                            }
                                           }
                                           loadList();
                                        }
                                        </script>
                    </form>          
                    
              <%              
                    }else if(subMenu.equals("Delete")){
                    %>
                    <script>
                    var r = confirm("Are you sure ?");
                    if (r == true) {
                        <% 
                        if(request.getParameter("id")!= null){
                            aph.deleteBook(Integer.parseInt(request.getParameter("id")));
                        }%>
                        window.open('adminpanel.jsp?page=ManageBook&subPage=ViewList','_self')
                    } else {
                        
                    } 
                    </script><%
                } 
               %>
                
            </div>
            
            <%
        }else if(type.equals("ManageCat")){
            String subMenu = "";
            if(request.getParameter("subPage") != null)
                subMenu = request.getParameter("subPage");
            %>
            <div class="topmenu">
                <ul>
                    <li style="border-left: medium none;"><a href="adminpanel.jsp?page=ManageCat&subPage=ViewList">Category List</a></li>
                    <li><a href="adminpanel.jsp?page=ManageCat&subPage=AddNew">Add New Category</a></li>
                    <li><a href="#"></a></li>
                </ul>
            </div>
            
            <div>
                <%           
                    AdminPanelHandler aph = new AdminPanelHandler();
                    if(subMenu.equals("ViewList")){
                        
                    ArrayList<Category> categories  = aph.categoriesList();
                   
                   if(categories.size() > 0){
                %>
                    <%= subMenu %>
                    <table border="1">
                        <th>Category ID</th><th>Category Name</th>
                        <% for(int i = 0; i <categories.size(); i++){ %>
                        <tr>
                            <td><%= categories.get(i).getId() %></td>
                            <td><%= categories.get(i).getName() %></td>
                            <td>
                                <input type="button" value="Edit" onclick="window.open('adminpanel.jsp?page=ManageCat&subPage=Edit&id=<%= categories.get(i).getId() %>','_self')"/>
                                <input type="button" value="Delete" onclick="window.open('adminpanel.jsp?page=ManageCat&subPage=Delete&id=<%= categories.get(i).getId() %>','_self')"/>
                            </td>
                        
                        </tr>
                        <% }%>
                    </table>
               <% 
                   }
                } else if(subMenu.equals("AddNew")){
                    ArrayList<String> validate = new ArrayList<String>();   
                    if(request.getParameter("submitted") != null){
                        String catName = request.getParameter("catName")!=null?request.getParameter("catName"):""; 
                        if(aph.addCategory(new Category(catName))){
                        %>
                            <div style="text-align: center;">CATEGORY ADDED SUCCESSFULLY</div>
                       <%     
                        }
                    }    
               %>
                    <form name="newCategory" method="POST" >
                        <div>
                            <span>Category Name: </span>
                            <span>
                                <input type="text" name="catName" value="" />
                            </span>
                                  <input type="hidden" name="submitted" value="1"/>
                           
                            <input type="submit" value="Add New Category" name="submit"/>
                        </div>
                    </form>
                    <%
                } else if(subMenu.equals("Delete")){
                    %>
                    <script>
                    var r = confirm("Are you sure ?");
                    if (r == true) {
                        <% 
                        if(request.getParameter("id")!= null){
                            aph.deleteCategory(Integer.parseInt(request.getParameter("id")));
                        }%>
                        window.open('adminpanel.jsp?page=ManageCat&subPage=ViewList','_self')
                    } else {
                        
                    } 
                    </script><%
                }else if(subMenu.equals("Edit")){
                    
                    if(request.getParameter("submitted") != null){
                        String catName = request.getParameter("catName")!=null?request.getParameter("catName"):""; 
                        int id  = request.getParameter("id") != null?Integer.parseInt(request.getParameter("id")):0;
                        if(aph.updateCategory(new Category(catName,id))){
                        %>
                            <div style="text-align: center;">CATEGORY UPDATED SUCCESSFULLY</div>
                       <%     
                        }
                    }    
                    
                    if(request.getParameter("id")!= null){
                    
                       %>
                            <form name=editCategory" method="POST" >
                                <div>
                                    <span>Category Name: </span>
                                    <span>
                                        <input type="text" name="catName" value="<%= aph.getCategoryName(Integer.parseInt(request.getParameter("id"))) %>" />
                                    </span>
                                        <input type="hidden" name="submitted" value="1"/>

                                    <input type="submit" value="Add New Category" name="submit"/>
                                </div>
                            </form>    
                        <%
                    }
                }
        }else if(type.equals("ManageUsers")){
            String subMenu = "";
            if(request.getParameter("subPage") != null)
                subMenu = request.getParameter("subPage");
            %>
            <div class="topmenu">
                <ul>
                    <li style="border-left: medium none;"><a href="adminpanel.jsp?page=ManageUsers&subPage=ViewList">User List</a></li>
                    <li><a href="adminpanel.jsp?page=ManageUsers&subPage=AddNew">Add New User</a></li>
                    
                </ul>
            </div>
            
            <div>
                <%           
                    AdminPanelHandler aph = new AdminPanelHandler();
                    if(subMenu.equals("ViewList")){
                        
                    ArrayList<User> users  = aph.usersList();
                   
                   if(users.size() > 0){
                %>
                    <%= subMenu %>
                    <table border="1">
                        <th>User ID</th><th>First Name</th><th>Last Name</th><th>Phone No.</th><th>Email</th>
                        <% for(int i = 0; i <users.size(); i++){ %>
                        <tr>
                            <td><%= users.get(i).getId() %></td>
                            <td><%= users.get(i).getFname() %></td>
                            <td><%= users.get(i).getLname() %></td>
                            <td><%= users.get(i).getPhone() %></td>
                            <td><%= users.get(i).getEmail() %></td>
                            <td>
                                <input type="button" value="Edit" onclick="window.open('adminpanel.jsp?page=ManageUsers&subPage=Edit&id=<%= users.get(i).getId() %>','_self')"/>
                                <input type="button" value="Delete" onclick="window.open('adminpanel.jsp?page=ManageUsers&subPage=Delete&id=<%= users.get(i).getId() %>','_self')"/>
                            </td>
                        
                        </tr>
                        <% }%>
                    </table>
               <% 
                   }
                }else if(subMenu.equals("AddNew")){
                    ArrayList<String> validate = new ArrayList<String>();   
                    if(request.getParameter("submitted") != null){
                        String fName = request.getParameter("userFName")!=null?request.getParameter("userFName"):""; 
                        String lName = request.getParameter("userLName")!=null?request.getParameter("userLName"):""; 
                        String email = request.getParameter("userEmail")!=null?request.getParameter("userEmail"):""; 
                        String phone = request.getParameter("userPhone")!=null?request.getParameter("userPhone"):""; 
                        String pass = request.getParameter("userPassword")!=null?request.getParameter("userPassword"):""; 
                        String cpass = request.getParameter("userCPassword")!=null?request.getParameter("userCPassword"):""; 
                     
                        int utype = request.getParameter("userType")!=null?Integer.parseInt(request.getParameter("userType")):0; 
                        User user = new User(fName,lName,email,phone,pass,new UserType(utype));
                        validate = aph.validateUser(user, cpass);
                        if(validate.size() == 0){
                            if(aph.addUser(user)){
                            %>
                                <div style="text-align: center;">USER ADDED SUCCESSFULLY</div>
                           <%     
                            }
                        }else{
                            %>
                            <p>Please rectify following error</p><br/>
                            <ul>    
                            <%
                            for(String msg : validate){
                            %>
                            <li><%= msg %> </li>
                                
                             <%
                            }%>
                            
                            </ul>
                            <%
                        }
                    }
                    ArrayList<UserType> userTypes = aph.usersTypeList();
                    
               %>
                    <form name="newUser" method="POST" >
                        <div>
                            <div>
                            <span>First Name: </span>
                            <span>
                                <input type="text" name="userFName" value="" />
                            </span>
                            <br/>
                            </div>
                            <div>
                                <br/>
                                <span>Last Name: </span>
                                <span>
                                    <input type="text" name="userLName" value="" />
                                </span>
                            </div>
                            <div>
                                <br/>
                                <span>Phone No.: </span>
                                <span>
                                    <input type="text" name="userPhone" value="" />
                                </span>
                            </div>
                            
                            <div>
                                <br/>
                            <span>Email: </span>
                            <span>
                                <input type="text" name="userEmail" value="" />
                            </span>
                            </div>
 
                            <div>
                            <br/>
                            <span>Password: </span>
                            <span>
                                <input type="password" name="userPassword" value="" />
                            </span>
                            </div>
                            <div>
                            <br/>
                            <span>Confirm Password: </span>
                            <span>
                                <input type="password" name="userCPassword" value="" />
                            </span>
                            </div>
                            <div>
                            <br/>
                            <span>Type: </span>
                            <span>
                                <select name="userType"  >
                                    <% for(int i = 0; i < userTypes.size(); i++){ %>
                                        <option value="<%= userTypes.get(i).getId() %>"><%= userTypes.get(i).getName() %></option>
                                    <% } %>
                                </select>
                            </span>
                            </div>
                             <input type="hidden" name="submitted" value="1"/>
                            <div style="width: 50%; margin: 0 auto;"><input type="submit" value="Add New User" name="submit"/>
                            </div>
                            </div>
                    </form>
                    <%
                }else if(subMenu.equals("Delete")){
                    %>
                    <script>
                    var r = confirm("Are you sure ?");
                    if (r == true) {
                        <% 
                        if(request.getParameter("id")!= null){
                            aph.deleteUser(Integer.parseInt(request.getParameter("id")));
                        }%>
                        window.open('adminpanel.jsp?page=ManageUsers&subPage=ViewList','_self')
                    } else {
                        
                    } 
                    </script><%
                } 
            }
        %>
</div>
</div>
<div class="vline">

</div>
</div>
</div>
</div>
</div>
<div class="footer">
<ul>
  
  <li style="border-left: medium none;"><a href="index2.html">Home</a></li>
  <li><a href="#">About Us</a></li>
  <li><a href="#">Recent articles</a></li>
 
  <li><a href="#">Contact</a></li>
  <li><a href="home.jsp">Login</a></li>
   <li><a href="register.html">Register</a></li>
</ul>
</div>
</div>
</div>



</body></html>