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
	public int deleteCheck(String member_id, String password) {
		int result=0;
		String sql = "delete from member where member_id=? and password=?";
		getPreparedStatement(sql);
		System.out.println("MemberDao에서 확인하는 패스워드=" + password);
		try {
			pstmt.setString(1, member_id);
			pstmt.setString(2, password);
			
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
	/**mypage session id information*/
	public MemberVo select(Object member_id) {
		MemberVo memberVo = null;
		String sql = "select member_id, password, name, email, phone_num, addr, tel from member where member_id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, (String)member_id);
			
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
	
	/**mypage session id information update*/
	public int update(MemberVo memberVo) {
		int result=0;
		String sql = "update member set email=?, addr=?, phone_num=? where member_id=? and password=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, memberVo.getEmail());
			pstmt.setString(2, memberVo.getAddr());
			pstmt.setString(3, memberVo.getPhone_num());
			pstmt.setString(4, memberVo.getMember_id());
			pstmt.setString(5, memberVo.getPassword());
			
			result = pstmt.executeUpdate();
			System.out.println(memberVo.getMember_id());
			System.out.println(memberVo.getPassword());
			System.out.println(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*********************넘어오는 name값을 받아서 여기 있으면 member로 아니면 company로(도전)****************************************/
	public int selectMode(String name, String phone_num) {
		int result=0;
		String sql = "select count(*) from member where name=? and phone_num=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			pstmt.setString(2, phone_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*********************비밀번호 재설정****************************************/
	public int select(String member_id, String name, String phone_num) {
		int result=0;
		String sql = "select count(*) from member where member_id=? and name=? and phone_num=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, member_id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*********************이메일 중복확인****************************************/
	public int emailCheck(String email1, String email2) {
		int result=0;
		String sql = "select count(*) from member where email1=? and email2=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, email1);
			pstmt.setString(2, email2);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int changeMpassword(String member_id, String mnewpassword) {
		int result=0;
		String sql = "update member set password=? where member_id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, mnewpassword);
			pstmt.setString(2, member_id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

}
