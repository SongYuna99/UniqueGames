package com.uniquegames.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConn {
	// Field
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521";
	String user = "scott";
	String pass = "tiger";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// Constructor
	public DBConn(){
		try {

			Class.forName(driver);


			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// PreparedStatement
	public void getPreparedStatement(String sql) {
		try {
			// 3. PreparedStatement
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// close
	public void close() {
		try {
			// 6. close
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}