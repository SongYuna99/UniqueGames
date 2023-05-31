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
}
