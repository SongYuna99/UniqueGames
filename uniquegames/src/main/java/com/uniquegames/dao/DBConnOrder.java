package com.uniquegames.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnOrder{

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/uniquegames";
	String user = "root";
	String pass = "tiger";
	
	public DBConnOrder() {
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			
		} catch (Exception e) {
			System.out.println("Connected");
			e.printStackTrace();
		}
	}
	
	public void getPreparedStatement(String sql) {
		try {
			
			pstmt = conn.prepareStatement(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
