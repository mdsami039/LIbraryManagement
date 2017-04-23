/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.library;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author umair
 */
public class Book {
    private int ID;
    private String title;
    private String edition;
    private String publish_city;
    private String publish_year;
    private String publisher;
    private int publisherID;
    private String categoryName;
    private int categoryID;
    private String ISBN;
    private int copies;
    private String description;
    private ArrayList<String> comments;
    private ArrayList<Author> authors;

    public ArrayList<Author> getAuthors() {
        return authors;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public ArrayList<String> getComments() {
        return comments;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    
    public String getTitle() {
        return title;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    
    public String getPublisher() {
        return publisher;
    }

   
    public void addAuthor(Author authors) {
        this.authors.add(authors);
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void addComment(String comment) {
        this.comments.add(comment);
    }

   
    public void setTitle(String title) {
        this.title = title;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
    public String AuthorNames(){
        String author_names = "";
        if(authors != null){
            for(int i = 0; i < authors.size(); i++){
               author_names += authors.get(i).getAuthor_name() + (i+1<authors.size()?", ":""); 
            }
        }
        return author_names;
    }

    public int getCopies() {
        return copies;
    }

    public String getDescription() {
        return description;
    }

    public String getEdition() {
        return edition;
    }

    public String getPublish_year() {
        return publish_year;
    }

    public String getPublish_city() {
        return publish_city;
    }

    public void setCopies(int copies) {
        this.copies = copies;
    }

    public void setComments(ArrayList<String> comments) {
        this.comments = comments;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public void setPublish_year(String publish_year) {
        this.publish_year = publish_year;
    }

    public void setAuthors(ArrayList<Author> authors) {
        this.authors = authors;
    }

    public void setPublish_city(String publish_city) {
        this.publish_city = publish_city;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }
    
    
    
    public Book(int ID, String edition,String title, String publish_year,String publish_city, String publisher,String ISBN, String categoryName, String description, ArrayList<Author> authors) {
        this.ID = ID;
        this.title = title;
        this.edition = edition;
        this.publish_year = publish_year;
        this.publish_year = publish_city;
        this.publisher = publisher;
        this.categoryName = categoryName;
        this.authors = authors;
        this.ISBN = ISBN;
        this.description = description;
    }
    
    
    public Book(int ID, String edition, String title, String publish_year, String publisher,String ISBN, String categoryName) {
        this.ID = ID;
        this.title = title;
        this.edition = edition;
        this.publish_year = publish_year;
        this.publisher = publisher;
        this.categoryName = categoryName;
        this.ISBN = ISBN;
    }

    
    
    public Book(int ID,String edition, String title, String publish_year, String publisher,String ISBN, String categoryName, ArrayList<Author> authors) {
        this.ID = ID;
        this.title = title;
        this.edition = edition;
        this.publish_year = publish_year;
        this.publisher = publisher;
        this.categoryName = categoryName;
        this.authors = authors;
        this.ISBN = ISBN;
    }
    
    
    
    public Book(String title,String edition, String publish_year, String publisher,String ISBN, String categoryName, ArrayList<Author> authors) {
        this.title = title;
        this.edition = edition;
        this.publish_year = publish_year;
        this.publisher = publisher;
        this.categoryName = categoryName;
        this.authors = authors;
        this.ISBN = ISBN;
    }
    
   public Book(String title,String edition, String publish_year,String publish_city,int publisherID,String description,String ISBN, int categoryID,int copies) {
        this.title = title;
        this.edition = edition;
        this.publish_year = publish_year;
        this.publisherID = publisherID;
        this.categoryID = categoryID;
        this.publish_city = publish_city;
        this.copies = copies;
        this.ISBN = ISBN;
        this.description = description;
        
    }   
     
    
    
}
