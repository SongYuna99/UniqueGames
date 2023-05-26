package com.uniquegames.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Controller
public class MyPageController {
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage() {
		return "/myPage/myPage";
	}
	
	/*
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(String id, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		MemberVo memberVo = memberDao.select(session.getAttribute("member_id"));
		
		if(memberVo != null) {
			mav.addObject("memberVo", memberVo);
			mav.setViewName("/myPage/myPage");
		}else {
			mav.addObject("myPage_result", "fail");
			mav.setViewName("/main/index");
		}
		
		return mav;
	}
	*/
	
}
