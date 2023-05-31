package com.uniquegames.dao;

import com.uniquegames.vo.MemberVo;

public class MemberDao extends DBConn {
	
	
	public int login(MemberVo memberVo) {
		int result=0;
		String sql = "select count(*) from member where member_id=? and password=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, memberVo.getMember_id());
			pstmt.setString(2, memberVo.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**sign up member*/
	public int insert(MemberVo memberVo) {
		int result=0;
		String sql = "insert into member (member_id, password, name, email,"
				+ " phone_num, addr, tel) values (?,?,?,?,?,?,?)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, memberVo.getMember_id());
			pstmt.setString(2, memberVo.getPassword());
			pstmt.setString(3, memberVo.getName());
			pstmt.setString(4, memberVo.getEmail());
			pstmt.setString(5, memberVo.getPhone_num());
			pstmt.setString(6, memberVo.getAddr());
			pstmt.setString(7, memberVo.getTel());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	/**ID checking*/
	public int idCheck(String member_id) {
		int result=0;
		String sql = "select count(*) from member where member_id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**delete Account*/
	public int delete(MemberVo memberVo) {
		int result=0;
		String sql = "delete from member where member_id=? and password=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, memberVo.getMember_id());
			pstmt.setString(2, memberVo.getPassword());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**delete Account Ajax*/
	public int deleteCheck(MemberVo memberVo) {
		int result=0;
		String sql = "delete from member where member_id=? and password=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, memberVo.getMember_id());
			pstmt.setString(2, memberVo.getPassword());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**find-id-check*/
	public String findIdCheck(String name, String phone_num) {
		String result="";
		String sql = "select member_id from member where name=? and phone_num=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			pstmt.setString(2, phone_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result= rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**find-pwd-check*/
	public String findPwdCheck(String member_id, String phone_num) {
		String result="";
		String sql = "select password from member where member_id=? and phone_num=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, member_id);
			pstmt.setString(2, phone_num);
			
			rs = pstmt.executeQuery();
			System.out.println(result);
			if(rs.next()) {
				result= rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MemberVo select(Object member_id) {
		MemberVo memberVo = null;
		String sql = "select member_id, password, name, email, phone_num, addr, tel from member where member_id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, (String) member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberVo = new MemberVo();
				
				memberVo.setMember_id(rs.getString(1));
				memberVo.setPassword(rs.getString(2));
				memberVo.setName(rs.getString(3));
				memberVo.setEmail(rs.getString(4));
				memberVo.setPhone_num(rs.getString(5));
				memberVo.setAddr(rs.getString(6));
				memberVo.setTel(rs.getString(7));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberVo;
	}
	

}
