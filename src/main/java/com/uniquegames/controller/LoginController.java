package com.uniquegames.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.CompanyDao;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;


@Controller
public class LoginController {
	
	HttpSession session;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(MemberVo memberVo,CompanyVo companyVo, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		CompanyDao companyDao = new CompanyDao();
		int result = memberDao.login(memberVo);
		int company_result = companyDao.login(companyVo);
		if(result==1) {
			mav.setViewName("redirect:/index.do");
			session = request.getSession();
			
			session.setAttribute("member_id", memberVo.getMember_id());
			session.setMaxInactiveInterval(1*60);
		}else if(company_result==1) {
			mav.setViewName("redirect:/index.do");
			session = request.getSession();
			
			session.setAttribute("company_id", companyVo.getCompany_id());
			session.setMaxInactiveInterval(1*60);
		}else {
			mav.addObject("login_result", "fail");
			mav.setViewName("login/login");
		}
			
		return mav;
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		/*
		String viewName = "";
		String member_id = (String)session.getAttribute("member_id");
		
		if(member_id != null) {
			session.invalidate();
			System.out.println("로그아웃 성공");
			viewName = "redirect:/index.do";
		}else {
			System.out.println("로그아웃 실패");
		}
		return viewName;
		*/
		return "redirect:/index.do";
	}
	
	
	

}
