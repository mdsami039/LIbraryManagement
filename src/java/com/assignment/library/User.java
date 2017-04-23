package com.assignment.library;

/**
 *
 * @author umair
 */
public class User {
    private String fname;
    private String lname;
    private String phone;
    private String email;
    private int Id;
    private String password;
    private UserType userType;
    
    
    public User(String fname, String lname, String email,String phone, String pass,UserType userType){
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.phone = phone;
        this.password = pass;
        this.userType = userType;
    }

    public User(int id, String fname, String lname, String email, String phone,UserType userType){
        this.Id = id;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.phone = phone;
        this.userType = userType;
    }
    
    public User(int id, String fname, String lname, String email, String phone){
        this.Id = id;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }
     
    
    public UserType userType(){
        return this.userType;
    }
            
    public  void userType(UserType type){
        this.userType = type;
    }
            
    
    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    
    public String getEmail() {
        return email;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getPhone() {
        return phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
 
}
