package com.uniquegames.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConn {
	// Field
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/uniquegames";
	/*String url = "jdbc:mysql://localhost:3306/uniquegames";*/
	String user = "unique_games";
	String pass = "1234";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// Constructor
	public DBConn(){
		try {
			// 0. ����̹� �غ�: ������Ʈ�� jdbc ����̹� ����Ʈ
			// 1. ����̹� �ε�
			Class.forName(driver);

			// 2. connection ��ü ����
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// PreparedStatement
	public void getPreparedStatement(String sql) {
		try {
			// 3. PreparedStatement ��ü ����
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