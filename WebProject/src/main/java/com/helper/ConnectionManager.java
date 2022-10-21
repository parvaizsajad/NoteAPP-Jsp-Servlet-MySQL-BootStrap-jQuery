package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	private static Connection con=null;
	
	public static Connection getConnection() {
		if(con==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/parvaiz", "root","");
			} catch (ClassNotFoundException | SQLException e) {
				e.getMessage();
			}
		}

		return con;
		
		
	}

}
