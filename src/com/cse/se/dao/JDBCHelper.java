package com.cse.se.dao;





import java.sql.Connection;
import java.sql.DriverManager;





public class JDBCHelper {
	
	
	
	public static Connection getConnection() throws Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost/SERS","root","password");
			return con;
		}
		catch(Exception e){
			throw(e);
		}
	}
	
	public static boolean closeConnection(Connection con) throws Exception{
		if(null!=con){
			con.close();
			return true;
		}
		else{
			return false;
		}
	}

}
