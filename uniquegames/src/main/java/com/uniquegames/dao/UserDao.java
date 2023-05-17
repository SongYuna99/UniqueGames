package com.uniquegames.dao;

public class UserDao extends DBConn{
	
	public int loginCheck() {
		
		int result=0;
		String sql = "select id, pwd from user";
		getPreparedStatement(sql);
	
		try {
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
