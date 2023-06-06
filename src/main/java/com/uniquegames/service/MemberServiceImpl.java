package com.uniquegames.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int getLoginResult(MemberVo memberVo) {
		return memberDao.login(memberVo);
	}
	
	/*
	@Override
	public int getLoginResult(Object vo) {
		return 0;
	}
	*/
	@Override
	public int getJoinResult(MemberVo memberVo) {
		
		return memberDao.insert(memberVo);
	}

	@Override
	public String getIdCheckResult(String member_id) {
		int result = memberDao.idCheck(member_id);
		return String.valueOf(result);
	}
	
	@Override
	public String getFindIdResult(MemberVo memberVo) {
		return memberDao.findIdCheck(memberVo);
	}
	 
	@Override
	public int getFindPwdResult(MemberVo memberVo) {
		return memberDao.select(memberVo);
	}

	@Override
	public int getUpdateResult(MemberVo memberVo) {
		return memberDao.update(memberVo);
	}

	@Override
	public int getChangePwdResult(String member_id, String name, String phone_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getChangeMPassword(String member_id, String mnewpassword) {
		return memberDao.changeMpassword(member_id, mnewpassword);
	}

	@Override
	public MemberVo getMyPageResult(String member_id) {
		return memberDao.myPage(member_id);
	}

	

}
