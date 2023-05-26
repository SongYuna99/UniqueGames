package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uniquegames.dao.MemberDao;

@Controller
public class FindAccountController {

	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "/findAccount/findId";
	}
	
	@RequestMapping(value="/findId_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String findId_check(String name, String phone_num) {
		MemberDao memberDao = new MemberDao();
		String result = memberDao.findIdCheck(name, phone_num);
		return result;
	}
	
	@RequestMapping(value="/findPwd_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String findPwd_check(String member_id, String phone_num) {
		MemberDao memberDao = new MemberDao();
		String result = memberDao.findPwdCheck(member_id, phone_num);
		
		return result;
	}
	
	
	
	@RequestMapping(value="/findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		return "/findAccount/findPwd";
	}
}
