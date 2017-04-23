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
public class Publisher {
    String name;
    int id;

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Publisher(String name, int id) {
        this.name = name;
        this.id = id;
    }
    
    
    
}
