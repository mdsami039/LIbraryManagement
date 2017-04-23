/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.library;

/**
 *
 * @author umair
 */
public class Author {
    private String author_name;
    private String author_lname;
    private int author_ID;

    public Author(String author_name, String author_lname, int author_ID) {
        this.author_name = author_name;
        this.author_ID = author_ID;
        this.author_lname = author_lname;
    }

    public void setAuthor_lname(String author_lname) {
        this.author_lname = author_lname;
    }

    public String getAuthor_lname() {
        return author_lname;
    }

    
    public int getAuthor_ID() {
        return author_ID;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_ID(int author_ID) {
        this.author_ID = author_ID;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }
    
    
    
}
