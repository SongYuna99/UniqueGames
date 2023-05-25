package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	/*
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(MemberVo memberVo) {
		
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		int result = memberDao.loginCheck(memberVo);
		
		if(result==1) {
			mav.addObject("login_result", "success");
			mav.setViewName("main/index");
		}else {
			mav.addObject("login_result", "fail");
			mav.setViewName("login/login");
		}
			
		return mav;
	}
	*/
	
	

}
