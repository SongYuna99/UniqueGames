package com.uniquegames.service;

import com.uniquegames.vo.MemberVo;

public interface MemberService {
	
	int getLoginResult(MemberVo memberVo);
	int getJoinResult(MemberVo memberVo);
	String getIdCheckResult(String member_id);
	String getFindIdResult(MemberVo memberVo);
	String getFindPwdResult(String member_id, String phone_num);
	int getUpdateResult(MemberVo memberVo);
	int getChangePwdResult(String member_id, String name, String phone_num);
	int getChangePassword(String member_id, String mnewpassword);
	

}
