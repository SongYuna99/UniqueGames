package com.uniquegames.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uniquegames.vo.CompanyVo;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**company login*/
	public int login(CompanyVo companyVo) {
		return sqlSession.selectOne("mapper.companyMember.login", companyVo);
	}
	
	/**sign up member*/
	public int insert(CompanyVo companyVo) {
		return sqlSession.insert("mapper.companyMember.insert", companyVo);
	}
	/**id checking*/
	public int idCheck(String company_id) {
		return sqlSession.selectOne("mapper.companyMember.idCheck", company_id);
	}
	
	/**find-id-check*/
	public String findIdCheck(CompanyVo companyVo) {
		return sqlSession.selectOne("mapper.companyMember.findId", companyVo);
	}
	
	public int findPwdCheck(CompanyVo companyVo) {
		return sqlSession.selectOne("mapper.companyMember.findPwd", companyVo);
	}
	
	public int update(CompanyVo companyVo) {
		return sqlSession.update("mapper.companyMember.update", companyVo);
	}
	
	public CompanyVo companyPage(String company_id) {
		return sqlSession.selectOne("mapper.companyMember.companyPage", company_id);
	}
	
	public int changeCpassword(CompanyVo companyVo) {
		return sqlSession.update("mapper.companyMember.changeCpassword", companyVo);
	}
	
	public String getGameNameByCID(String company_id) {
		return sqlSession.selectOne("mapper.companyMember.getGameName", company_id);
	}
	
	public int deleteCompany(CompanyVo companyVo) {
		return sqlSession.delete("mapper.companyMember.deleteCompany", companyVo);
	}
	
	public int emailCheck(String email) {
		return sqlSession.selectOne("mapper.companyMember.emailCheck", email);
	}
	
	public int phoneCheck(String phone_num) {
		return sqlSession.selectOne("mapper.companyMember.phoneCheck", phone_num);
	}
	
	/**companyMypage session id information
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
	*/
	
}
