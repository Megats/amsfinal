package db.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con;
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_c8e7bb0380bec6d";
	private static final String DB_USER = "bc9d7cd553bc3e";
	private static final String DB_PASSWORD = "04fae99b";

	public static Connection getConnection() {
		
		try {
			Class.forName(DB_DRIVER);
			try {
				con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
				System.out.println("Connected");
			}
			catch(SQLException ex) {
				ex.printStackTrace();
			}
			
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);
			System.out.println("Failed to connect database");
		}
		return con;
	}
	
}
