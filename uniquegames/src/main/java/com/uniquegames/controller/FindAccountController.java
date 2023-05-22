package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Controller
public class FindAccountController {

	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "/findAccount/findId";
	}
	
	@RequestMapping(value="/findId_proc.do", method=RequestMethod.POST)
	public ModelAndView findId_proc(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		String member_id = memberDao.findId(memberVo);
		
		if(!member_id.equals("")) {
			mav.addObject("member_id", member_id);
			mav.setViewName("/findAccount/findId");
		}
		return mav;
	}
	
	@RequestMapping(value="/findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		return "/findAccount/findPwd";
	}
}
