/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.library;

import com.assignment.library.db.Database;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author umair
 */
public class AdminPanelHandler {
    
    
    public ArrayList<Publisher> publisherList(){
        Database db = Database.getInstance();
        
        SearchHandler sh = new SearchHandler();
        ArrayList<Publisher> publishers = new ArrayList<>();
        String query = "Select * From Publisher";
        try {
                ResultSet rs = db.select(query);
            
            while(rs.next()){
                publishers.add(new Publisher(rs.getString("publisher_name"),rs.getInt("id")));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return publishers;
    }
     
    public String getCategoryName(int id){
        Database db = Database.getInstance();
        try{
            String query = "SELECT name from book_category WHERE id="+id;
            ResultSet rs = db.select(query);
            while(rs.next()){
                return rs.getString("name");
            }
        }catch(SQLException ex){
            return " ";
        }
        return " ";
        
    }
    public boolean updateCategory(Category category){
        Database db = Database.getInstance();
        try{
            String insertTableSQL = "UPDATE book_category SET name=\'"+category.getName()+"\' WHERE id=\'"+category.getId()+"\'";
            db.update(insertTableSQL);
            return true;
        }catch(SQLException ex){
            return false;
        }
     }
     
    public boolean addCategory(Category category){
        Database db = Database.getInstance();
        try{
            String insertTableSQL = "INSERT INTO book_category "
		+ "(name) VALUES(\'"+category.getName()+"\')";
            db.update(insertTableSQL);
            return true;
        }catch(SQLException ex){
            return false;
        }
     }
    
    
    public ArrayList<String> validateUser(User user, String cpass){
        ArrayList<String> validate = new ArrayList<String>();
        if(user.getFname().length() < 3){
            validate.add("First name should have minimum 3 characters");
        }
        if(user.getLname().length() < 3){
            validate.add("Last name should have minimum 3 characters");
        }
        if(user.getPhone().length() < 5){
            validate.add("Phone Number should have minimum 3 characters");
        }
        if(user.getPassword().length() < 8){
            validate.add("Password should have minimum 8 characters");
        }
        
        if(!user.getPassword().equals(cpass)){
            validate.add("Password and Confirm Password didnt match");
        }
        return validate;
    }
    
    public boolean addUser(User user){
        Database db = Database.getInstance();
        try{
            String insertTableSQL = "INSERT INTO user "
		+ "(f_name,l_name,email,phone,user_type,password) VALUES(\'"+user.getFname()+"\',\'"+user.getLname()+"\',\'"+user.getEmail()+"\',\'"+user.getPhone()+"\',\'"+user.userType().getId()+"\',\'"+user.getPassword()+"\')";
            db.update(insertTableSQL);
            return true;
        }catch(SQLException ex){
            return false;
        }
     }
    
    public boolean addBook(Book book,ArrayList<Integer> authorIDs){
        Database db = Database.getInstance();
        
        try{
            String insertTableSQL = "INSERT INTO book "
		+ "(title, edition, publisher_ID, publish_city, publish_year,ISBN,description,category_ID,copies) VALUES"
		+ "(\'"+book.getTitle()+"\',\'"+book.getEdition()+"\',\'"+book.getPublisherID()+"\',\'"+book.getPublish_city()+"\',\'"
                        +book.getPublish_year()+"\',\'"+book.getISBN()+"\',\'"+book.getDescription()+"\',\'"+book.getCategoryID()+"\',\'"
                        +book.getCopies()+"\')";
                db.update(insertTableSQL);
            ResultSet rs = db.select("select last_insert_id() as last_id from book");
            int bookid = 0;
            while(rs.next())
                bookid = rs.getInt("last_id");
                for (Integer authorID : authorIDs) {
                String query = "INSERT INTO book_author(book_ID, author_ID) VALUES(\'"+bookid+"\',\'" + authorID + "\')";
                db.update(query);
            }
            
            return true;
            /*PreparedStatement preparedStatement = db.createPreparedStatement(insertTableSQL);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getEdition());
            preparedStatement.setInt(3, book.getPublisherID());
            preparedStatement.setString(4, book.getPublish_city());
            preparedStatement.setString(5, book.getPublish_year());
            preparedStatement.setString(6, book.getISBN());
            preparedStatement.setString(7, book.getDescription());
            preparedStatement.setInt(8, book.getCategoryID());
            preparedStatement.setInt(9, book.getCopies());
            ResultSet executeQuery = preparedStatement.executeQuery(insertTableSQL);
             */
            
        }catch(SQLException ex){
        
        }
        
        return false;
    }
            
    public ArrayList<UserType> usersTypeList(){
        Database db = Database.getInstance();
        
        ArrayList<UserType> users = new ArrayList<>();
        String query = "Select * From user_type";
        try {
                ResultSet rs = db.select(query);
            
            while(rs.next()){
                users.add(new UserType(rs.getInt("id"),rs.getString("type_name")));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return users;
    }
    
    public boolean deleteCategory(int id){
        Database db = Database.getInstance();
        String sql = "DELETE FROM book_category " +
                   "WHERE id = \'"+id + "\'";
        try{
            db.update(sql);
            return true;
        }catch(SQLException ex){
            return false;
        }
    }
   
    public boolean deleteUser(int id){
        Database db = Database.getInstance();
        String sql = "DELETE FROM user " +
                   "WHERE id = \'"+id + "\'";
        try{
            db.update(sql);
            return true;
        }catch(SQLException ex){
            return false;
        }
    }
   
    public boolean deleteBook(int id){
        Database db = Database.getInstance();
        String sql = "DELETE FROM book " +
                   "WHERE id = \'"+id + "\'";
        try{
            db.update(sql);
            return true;
        }catch(SQLException ex){
            return false;
        }
    }
    
    public ArrayList<User> usersList(){
        Database db = Database.getInstance();
        
        ArrayList<User> users = new ArrayList<>();
        String query = "Select * From user";
        try {
                ResultSet rs = db.select(query);
            
            while(rs.next()){
                users.add(new User(rs.getInt("id"),rs.getString("f_name"),rs.getString("l_name"),rs.getString("email"),rs.getString("phone"), new UserType(rs.getInt("user_type"))));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return users;
    }
   
    public ArrayList<Category> categoriesList(){
        Database db = Database.getInstance();
        
        SearchHandler sh = new SearchHandler();
        ArrayList<Category> categories = new ArrayList<>();
        String query = "Select * From book_category";
        try {
                ResultSet rs = db.select(query);
            
            while(rs.next()){
                categories.add(new Category(rs.getString("name"),rs.getInt("id")));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return categories;
    }
   
     public ArrayList<Author> authorsList(){
        Database db = Database.getInstance();
        
        SearchHandler sh = new SearchHandler();
        ArrayList<Author> authors = new ArrayList<>();
        String query = "Select * From author";
        try {
                ResultSet rs = db.select(query);
            
            while(rs.next()){
                authors.add(new Author(rs.getString("name"),rs.getString("last_name"),rs.getInt("id")));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return authors;
    }
   
    public ArrayList<Book> booksList(){
        Database db = Database.getInstance();
        
        SearchHandler sh = new SearchHandler();
        ArrayList<Book> books = new ArrayList<>();
        String query = "Select b.ID, b.title as Title,b.edition, b.publish_year as Year, b.ISBN, p.publisher_name, c.name as Category from Book b " +
                        "INNER JOIN Publisher p " +
                        "ON b.publisher_ID=p.ID " +
                        "INNER JOIN book_category c " +
                        "ON b.category_ID=c.ID ";
        try {
                ResultSet rs = db.select(query);
            
            ArrayList<Integer> ids = new ArrayList<>();
            while(rs.next()){
                books.add(new Book(rs.getInt("id"),rs.getString("edition"),rs.getString("title"), rs.getString("Year"), rs.getString("publisher_name"), rs.getString("ISBN"), rs.getString("Category")));
            }
            for(int i = 0; i < books.size(); i++){
                books.get(i).setAuthors(sh.getAuthorsList(books.get(i).getID()));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return books;
    }
}
