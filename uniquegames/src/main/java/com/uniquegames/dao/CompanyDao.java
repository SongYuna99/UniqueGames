package com.uniquegames.dao;

import com.uniquegames.vo.CompanyVo;

public class CompanyDao extends DBConn{

	/**sign up member*/
	public int insert(CompanyVo companyVo) {
		int result=0;
		String sql = "insert into company (company_id, password, name, email,"
				+ " phone_num, addr) values (?,?,?,?,?,?)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, companyVo.getCompany_id());
			pstmt.setString(2, companyVo.getPassword());
			pstmt.setString(3, companyVo.getName());
			pstmt.setString(4, companyVo.getEmail());
			pstmt.setString(5, companyVo.getPhone_num());
			pstmt.setString(6, companyVo.getAddr());
			
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
}
