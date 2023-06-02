package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.CompanyDao;
import com.uniquegames.dao.MemberDao;

@Controller
public class FindAccountController {

	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "/findAccount/findId";
	}
	
	@RequestMapping("/findCompany.do")
	public String findCompany() {
		return "/findAccount/findCompany";
	}
	
	@RequestMapping(value="/findId_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String findId_check(String name, String phone_num) {
		String result = "";
		MemberDao memberDao = new MemberDao();
		CompanyDao companyDao = new CompanyDao();
		int name_result = memberDao.selectMode(name, phone_num);
		if(name_result==1) {
			result = memberDao.findIdCheck(name, phone_num);
		}else {
			result = companyDao.findIdCheck(name, phone_num);
		}
		return result;
	}
	
	/*
	@RequestMapping(value="/findPwd_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String findPwd_check(String id, String phone_num) {
		MemberDao memberDao = new MemberDao();
		String result = memberDao.findPwdCheck(id, phone_num);
		
		return result;
	}
	*/
	
	@RequestMapping(value="/findPwd_check.do", method=RequestMethod.POST)
	public ModelAndView findPwd_check(String member_id, String name, String phone_num) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		int result = memberDao.select(member_id, name, phone_num);
		
		if(result == 1) {
			mav.setViewName("/findAccount/newPassword");
		}else {
			mav.addObject("find_result", "fail");
			mav.setViewName("/findAccount/findId");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		return "/findAccount/findPwd";
	}
}
