package com.uniquegames.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnBoard {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/uniquegames?useSSL=false";
	String user = "root";
	String password = "mysql";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public DBConnBoard() {
		try {

			Class.forName(driver);

			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getPreparedStatment(String sql) {

		try {

			pstmt = conn.prepareStatement(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {

			if (rs != null)
				rs.close();

			if (pstmt != null)
				pstmt.close();

			if (conn != null)
				conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
