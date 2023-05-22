package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Controller
public class JoinController {

	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
	
	@RequestMapping(value="/joinChoice.do", method=RequestMethod.GET)
	public String joinChoice() {
		return "/join/joinChoice";
	}
	
	@RequestMapping(value="/companyJoin.do", method=RequestMethod.GET)
	public String companyJoin() {
		return "join/companyJoin";
	}
	
	@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
	public ModelAndView join_proc(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		int result = memberDao.insert(memberVo);
		
		if(result==1) {
			mav.addObject("join_result", "succcess");
			mav.setViewName("/login/login");
		}else {
			System.out.println("½ÇÆÐ");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/id_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String id_check(String id) {
		String viewName = "";
		
		MemberDao memberDao = new MemberDao();
		int result = memberDao.idCheck(id);
		
		return String.valueOf(result);
	}
}
