package com.uniquegames.service;

import java.util.Map;

import com.uniquegames.vo.MemberVo;

public interface MemberService {
	
	int getLoginResult(MemberVo memberVo);
	//int getLoginResult(Object vo);
	int getJoinResult(MemberVo memberVo);
	String getIdCheckResult(String member_id);
	String getFindIdResult(MemberVo memberVo);
	int getFindPwdResult(MemberVo memberVo);
	int getUpdateResult(MemberVo memberVo);
	int getChangePwdResult(String member_id, String name, String phone_num);
	int getChangeMPassword(String member_id, String mnewpassword);
	MemberVo getMyPageResult(String member_id);

}
