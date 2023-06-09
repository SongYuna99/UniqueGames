package com.uniquegames.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.CompanyDao;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.service.CompanyMemberService;
import com.uniquegames.service.MemberService;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;


@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CompanyMemberService companyMemberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}

	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(MemberVo memberVo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int result = memberService.memberLoginResult(memberVo);
		
		if(result==1) {
			session.setAttribute("member_id", memberVo.getMember_id());
			session.setMaxInactiveInterval(60);
			mav.setViewName("redirect:/index.do");
		}else {
			mav.setViewName("redirect:/login.do");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/company_login_proc.do", method=RequestMethod.POST)
	public ModelAndView company_login_proc(CompanyVo companyVo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int result = companyMemberService.companyLoginResult(companyVo);
		
		if(result==1) {
			session.setAttribute("company_id", companyVo.getCompany_id());
			session.setMaxInactiveInterval(60);
			mav.setViewName("redirect:/index.do");
		}else {
			mav.setViewName("redirect:/login.do");
		}
		
		return mav;
	}
	/*
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		if(member_id != null) {
			session.invalidate();
		}
		return "redirect:/index.do";
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String clogout(HttpSession session) {
		String company_id = (String)session.getAttribute("company_id");
		if(company_id != null) {
			session.invalidate();
		}
		return "redirect:/index.do";
	}
	*/
	
	

}
