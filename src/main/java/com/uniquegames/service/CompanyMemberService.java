package com.uniquegames.service;

import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;

public interface CompanyMemberService {
	
	int companyLoginResult(CompanyVo companyVo);
	int companyJoinResult(CompanyVo companyVo);
	int companyIdCheckResult(String company_id);
	String companyFindIdResult(CompanyVo companyVo); //select
	int companyFindPwdResult(CompanyVo companyVo);
	int companyUpdateResult(CompanyVo companyVo);
	CompanyVo companyPageResult(String company_id);
	int companyChangeCPassword(String company_id, String cnewpassword);
	String companyGameName(String company_id);
	int companyDeleteResult(CompanyVo companyVo);
	int companyEmailCheckResult(String email);
	int companyPhoneCheckResult(String phone_num);

}
