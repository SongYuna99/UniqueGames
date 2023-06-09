package com.uniquegames.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;

@Repository
public class MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int login(MemberVo memberVo) {
		return sqlSession.selectOne("mapper.member.login", memberVo);
	}

	/*
	public int login(Object vo) {
		int result=0;
		if(vo instanceof MemberVo) {
			MemberVo memberVo = (MemberVo)vo;
			result=sqlSession.selectOne("mapper.member.login", memberVo);
		}else if(vo instanceof CompanyVo) {
			CompanyVo companyVo = (CompanyVo)vo;
			result=sqlSession.selectOne("mapper.member.login", companyVo);
		}
		return result;
	}
	*/
	/**sign up member*/
	public int insert(MemberVo memberVo) {
		return sqlSession.insert("mapper.member.insert", memberVo);

	}
	/**ID checking*/
	public int idCheck(String member_id) {
		return sqlSession.selectOne("mapper.member.idCheck", member_id);
	}
	
	/**find-id-check*/
	public String findIdCheck(MemberVo memberVo) {
		return sqlSession.selectOne("mapper.member.findId", memberVo);
	}
	
	/*********************비밀번호 재설정****************************************/
	public int select(MemberVo memberVo) {
		return sqlSession.selectOne("mapper.member.select", memberVo);
	}
	
	/**mypage session id information update*/
	public int update(MemberVo memberVo) {
		return sqlSession.update("mapper.member.update", memberVo);
	}
	
	public int changeMpassword(String member_id, String mnewpassword) {
		MemberVo memberVo = new MemberVo();
		memberVo.setMember_id(member_id);
		memberVo.setMnewpassword(mnewpassword);
		return sqlSession.update("mapper.member.changeMpassword", memberVo);
	}
	
	/**mypage session id information
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
	*/
	
	public MemberVo myPage(String member_id) {
		return sqlSession.selectOne("mapper.member.myPage", member_id);
	}
	
	/**delete Account Ajax*/
	public int delete(MemberVo memberVo) {
		return sqlSession.delete("mapper.member.delete", memberVo);
	}
	
	/**email check*/
	public int emailCheck(String email) {
		return sqlSession.selectOne("mapper.member.emailCheck", email);
	}
	
	/**phone check*/
	public int phoneCheck(String phone_num) {
		return sqlSession.selectOne("mapper.member.phoneCheck", phone_num);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*********************넘어오는 name값을 받아서 여기 있으면 member로 아니면 company로(도전)
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
	****************************************/
	
	
	

	/**delete Account
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
	*/
	

}
