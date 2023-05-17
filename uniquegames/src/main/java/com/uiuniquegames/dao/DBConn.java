package com.uiuniquegames.dao;

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
			// 0. 드라이버 준비: 프로젝트에 jdbc 드라이버 임포트
			// 1. 드라이버 로딩
			Class.forName(driver);

			// 2. connection 객체 생성
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// PreparedStatement
	public void getPreparedStatement(String sql) {
		try {
			// 3. PreparedStatement 객체 생성
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