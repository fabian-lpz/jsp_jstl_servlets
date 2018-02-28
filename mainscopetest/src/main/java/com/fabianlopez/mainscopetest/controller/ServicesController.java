package com.fabianlopez.mainscopetest.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.fabianlopez.mainscopetest.entities.User;

public class ServicesController {
	private Connection conexion;
	private Statement  statement;
	private User user;
	
	public ServicesController() {
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conexion = DriverManager.getConnection("jdbc:mysql://localhost/test?user=root");
			System.out.println("Successfully connected...");
		}
		catch(ClassNotFoundException cnfe)
		{
			System.out.println("Error: "+cnfe);
		}
		catch(SQLException sqle)
		{
			System.out.println("Error: "+sqle);
		}
		catch(InstantiationException ie)
		{
			System.out.println("Error: "+ie);
		}
		catch(IllegalAccessException ie)
		{
			System.out.println("Error: "+ie);
		}
	}
	
	public User listUsers(String username, String password) throws SQLException{
		String strQuery="";
		ResultSet tr=null;
		user = new User();
		
		strQuery = "SELECT * FROM users WHERE username='"+username+"' AND password='"+password+"'";
		
		try{
			statement = conexion.createStatement();
			
			tr = statement.executeQuery(strQuery);
			
			
			if(tr.next())
			{
				user.setIdUser(tr.getInt(1));
				user.setUsername(tr.getString(2));
				user.setPassword(tr.getString(3));
				
			}else {
				return null;
			}
			
			statement.close();
			
			System.out.println(conexion.nativeSQL(strQuery));
		}
		catch(SQLException sqle){
			System.out.println(sqle);
			throw new SQLException("ERROR IN SELECT");
		}
		return user;
	}
	
	public String create(String table, String values) {
		String strInsert="";
		String result="";
				
		strInsert = "INSERT INTO "+table+" VALUES("+values+")";
		
		try
		{
			statement = conexion.createStatement();
			
			statement.executeUpdate(strInsert);
			
			statement.close();
			
			System.out.println(conexion.nativeSQL(strInsert));
			
			result = "CORRECT";
		}
		catch(SQLException sqle)
		{
			System.out.println("Error al abrir la BD...\n"+sqle);
			result = "ERROR";
		}
		
		return result;
	}
	
	public String update(String table, String values) {
		String strInsert="";
		String result="";
				
		strInsert = "UPDATE "+table+" SET "+values+"";
		System.out.println(strInsert);
		try
		{
			statement = conexion.createStatement();
			
			statement.executeUpdate(strInsert);
			
			statement.close();
			
			System.out.println(conexion.nativeSQL(strInsert));
			
			result = "CORRECT";
		}
		catch(SQLException sqle)
		{
			System.out.println("Error al abrir la BD...\n"+sqle);
			result = "ERROR";
		}
		
		return result;
	}
	
	public String deleteClient(String id) {
		String result = "";
		
		String query = "DELETE FROM clients WHERE id_client='"+id+"'";
		
		try{
			statement = conexion.createStatement();
			
			statement.executeUpdate(query);
			
			statement.close();
			
			System.out.println(conexion.nativeSQL(query));
			result = "CORRECT";
		}
		catch(SQLException sqle){
			System.out.println(sqle);
			result = "ERROR";
		}
		
		return result;
	}
	
	public String deleteContact(String id) {
		String result = "";
		
		String query = "DELETE FROM contacts WHERE id_contact='"+id+"'";
		
		try{
			statement = conexion.createStatement();
			
			statement.executeUpdate(query);
			
			statement.close();
			
			System.out.println(conexion.nativeSQL(query));
			result = "CORRECT";
		}
		catch(SQLException sqle){
			System.out.println(sqle);
			result = "ERROR";
		}
		
		return result;
	}
}
