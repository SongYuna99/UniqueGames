package com.uniquegames.dao;

import com.uniquegames.vo.UserVo;

public class UserDao extends DBConn {
	
	public int loginCheck(UserVo userVo) {
		
		int result=0;
		String sql = " select count(*) from user where id=? and password=? ";
		getPreparedStatement(sql);
	
		try {
			
			pstmt.setString(1, userVo.getId());
			pstmt.setString(2, userVo.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insert(UserVo userVo) {
		int result=0;
		String sql = "insert into user (id, password, name, gender, email, tel, phone_number, addr, udate) "
				+ "values (?,?,?,?,?,?,?,?,default)";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, userVo.getId());
			pstmt.setString(2, userVo.getPassword());
			pstmt.setString(3, userVo.getName());
			pstmt.setString(4, userVo.getGender());
			pstmt.setString(5, userVo.getEmail());
			pstmt.setString(6, userVo.getTel());
			pstmt.setString(7, userVo.getPhone_number());
			pstmt.setString(8, userVo.getAddr());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int idCheck(String id) {
		int result=0;
		String sql = "select count(*) from user where id=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public UserVo select(String id) {
		UserVo userVo = new UserVo();
		String sql = "select id, name, email1, email2, addr1, addr2, tel, phone1, phone2, phone3 from user "
				+ "where id=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				userVo.setId(rs.getString(1));
				userVo.setName(rs.getString(2));
				userVo.setEmail1(rs.getString(3));
				userVo.setEmail2(rs.getString(4));
				userVo.setAddr1(rs.getString(5));
				userVo.setAddr2(rs.getString(6));
				userVo.setTel(rs.getString(7));
				userVo.setPhone1(rs.getString(8));
				userVo.setPhone2(rs.getString(9));
				userVo.setPhone3(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userVo;
	}

}
