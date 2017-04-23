package com.assignment.library;

import com.assignment.library.db.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchHandler{
        
    public SearchHandler(){
    
    }
    public int getAuthorID(String author){
        Database db = Database.getInstance();
        String query = "Select id From Author Where name like '%"+author+"%'";
        int authorID = 0;
        try{
            ResultSet rs = db.select(query);
            while(rs.next())
                authorID = rs.getInt("id");
        }catch(SQLException ex){
            
        }
        return authorID;
    }
            
    public ArrayList<Book> searchBookByAuthor(String author){
        Database db = Database.getInstance();
        int authorID = getAuthorID(author);
        ArrayList<Book> books = new ArrayList<>();
        String query = "Select b.ID, b.title as Title,b.edition, b.publish_year as Year, b.ISBN, p.publisher_name, c.name as Category from Author a, Book b " +
                        "INNER JOIN Publisher p " +
                        "ON b.publisher_ID=p.ID " +
                        "INNER JOIN book_category c " +
                        "ON b.category_ID=c.ID " +
                        "INNER JOIN book_author ba " +
                        "ON b.ID=ba.book_ID " +
                        "where a.id=ba.author_ID AND a.id="+authorID;
        try {
                ResultSet rs = db.select(query);
           // if (!rs.isBeforeFirst() ) {    
           //    return books;
           // }
            
            while(rs.next()){
                books.add(new Book(rs.getInt("id"),rs.getString("title"),rs.getString("edition"), rs.getString("Year"), rs.getString("publisher_name"), rs.getString("ISBN"), rs.getString("Category")));
                
            }
            
            for(Book book : books){
                book.setAuthors(getAuthorsList(book.getID()));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return books;
    }
    
    public ArrayList<Book> searchBookByTitle(String title){
        Database db = Database.getInstance();
        ArrayList<Book> books = new ArrayList<>();
        String query = "Select b.ID, b.title as Title,b.edition, b.publish_year as Year, b.ISBN, p.publisher_name, c.name as Category from Book b " +
                        "INNER JOIN Publisher p " +
                        "ON b.publisher_ID=p.ID " +
                        "INNER JOIN book_category c " +
                        "ON b.category_ID=c.ID " +
                        "where b.title like '%"+title+"%'";
        try {
                ResultSet rs = db.select(query);
           // if (!rs.isBeforeFirst() ) {    
           //    return books;
           // }
            
            while(rs.next()){
                books.add(new Book(rs.getInt("id"),rs.getString("title"),rs.getString("edition"), rs.getString("Year"), rs.getString("publisher_name"), rs.getString("ISBN"), rs.getString("Category")));
            }
            for(Book book : books){
                book.setAuthors(getAuthorsList(book.getID()));
            }
        }catch(SQLException ex){
                 ex.getMessage();
        }
        return books;
    }
    
    public ArrayList<Author> getAuthorsList(int bookID){
        ArrayList<Author> authors = new ArrayList<>();
        String query = "Select a.name,a.last_name, a.ID from Author a, book_author ba Where ba.book_ID = " + bookID + " AND a.ID = ba.author_ID";
        Database db = Database.getInstance();
        try{
            ResultSet rs_authors = db.select(query);
            while(rs_authors.next()){
                authors.add(new Author(rs_authors.getString("name"),rs_authors.getString("last_name"), rs_authors.getInt("ID")));
            }
            
            
        }catch(SQLException ex){
            return null;
        }
        return authors;
    }
}