/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.library.db;



import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author umair
 */
public class Database {
    
    private static Database database = null;
    Statement statement;
    private Connection conn; 
    private Database(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/library", "root","");
            statement = conn.createStatement();
            
        }catch(ClassNotFoundException ex){
            System.out.print(ex.getMessage());
        }catch(SQLException ex){
        
            System.out.print(ex.getMessage());
        }
        
    }
    
    public static  Database getInstance(){
        if(database==null){
            database = new Database();
        }
        return database;
    }
    
    public PreparedStatement createPreparedStatement(String Query) throws SQLException{
        return statement.getConnection().prepareStatement(Query);
    }
    
    public ResultSet select(String query) throws SQLException{
        return statement.executeQuery(query);
    }
    
    public int insertReturnID(String query) throws SQLException {
        return statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
    }
    
    public int update(String query) throws SQLException{
        return statement.executeUpdate(query);
    }
    
}
