package com.uniquegames.dao;

import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;

public class CompanyDao extends DBConn{

	/**sign up member*/
	public int insert(CompanyVo companyVo) {
		int result=0;
		String sql = "insert into company (company_id, password, name, email, tel, "
				+ " phone_num, addr) values (?,?,?,?,?,?,?)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, companyVo.getCompany_id());
			pstmt.setString(2, companyVo.getPassword());
			pstmt.setString(3, companyVo.getName());
			pstmt.setString(4, companyVo.getEmail());
			pstmt.setString(5, companyVo.getTel());
			pstmt.setString(6, companyVo.getPhone_num());
			pstmt.setString(7, companyVo.getAddr());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	/**id checking*/
	public int idCheck(String company_id) {
		int result=0;
		String sql = "select count(*) from company where company_id=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, company_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result= rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**find-id-check*/
	public String findIdCheck(String name, String phone_num) {
		String result="";
		String sql = "select company_id from company where name=? and phone_num=?";
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
	
	public int login(CompanyVo companyVo) {
		int result=0;
		String sql = "select count(*) from company where company_id=? and password=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, companyVo.getCompany_id());
			pstmt.setString(2, companyVo.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int select(String company_id, String name, String phone_num) {
		int result=0;
		String sql = "select count(*) from company where company_id=? and name=? and phone_num=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, company_id);
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
	
	public int changeCpassword(String company_id, String cnewpassword) {
		int result=0;
		String sql = "update company set password=? where company_id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, cnewpassword);
			pstmt.setString(2, company_id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**companyMypage session id information*/
	public CompanyVo select(Object company_id) {
		CompanyVo companyVo = null;
		String sql = "select company_id, password, name, email, tel, phone_num, addr from company where company_id=?";
		//tel
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, (String)company_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				companyVo = new CompanyVo();
				
				companyVo.setCompany_id(rs.getString(1));
				companyVo.setPassword(rs.getString(2));
				companyVo.setName(rs.getString(3));
				companyVo.setEmail(rs.getString(4));
				companyVo.setTel(rs.getString(5));
				companyVo.setPhone_num(rs.getString(6));
				companyVo.setAddr(rs.getString(7));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return companyVo;
	}
	
	public int update(CompanyVo companyVo) {
		int result=0;
		String sql = "update company set company_id=?, g_id=?, name=?, email=?, addr=?, tel=?, phone_num=? where company_id=? and password=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, companyVo.getCompany_id());
			pstmt.setInt(2, companyVo.getG_id());
			pstmt.setString(3, companyVo.getName());
			pstmt.setString(4, companyVo.getEmail());
			pstmt.setString(5, companyVo.getAddr());
			pstmt.setString(6, companyVo.getTel());
			pstmt.setString(7, companyVo.getPhone_num());
			pstmt.setString(8, companyVo.getCompany_id());
			pstmt.setString(9, companyVo.getPassword());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
