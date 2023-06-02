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
	/*
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage() {
		return "/myPage/myPage";
	}
	*/
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		MemberVo memberVo = memberDao.select(session.getAttribute("member_id"));
		
		if(memberVo != null) {
			String email1 = memberVo.getEmail().split("@")[0];
			String email2 = memberVo.getEmail().split("@")[1];
			String addr1 = memberVo.getAddr().split(" ")[0];
			String addr2 = memberVo.getAddr().split(" ")[1];
			String phone2 = memberVo.getPhone_num().split("-")[1];
			String phone3 = memberVo.getPhone_num().split("-")[2];
			memberVo.setEmail1(email1);
			memberVo.setEmail2(email2);
			memberVo.setAddr1(addr1);
			memberVo.setAddr2(addr2);
			memberVo.setPhone2(phone2);
			memberVo.setPhone3(phone3);
			mav.addObject("memberVo", memberVo);
			mav.setViewName("/myPage/myPage");
		}else {
			mav.addObject("myPage_result", "fail");
			mav.setViewName("/main/index");
		}
		
		return mav;
	}
	
	//마이페이지 update
	@RequestMapping(value="/myPage_proc.do", method=RequestMethod.POST)
	public ModelAndView myPage_proc(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		int result = memberDao.update(memberVo);
		
		if(result == 1) {
			mav.addObject("update_result", "success");
			mav.setViewName("redirect:/index.do");
		}else {
			System.out.println("update실패");
		}
		
		return mav;
	}
	
	
}
