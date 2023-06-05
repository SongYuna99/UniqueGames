package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.CompanyDao;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Controller
public class FindAccountController {

	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "/findAccount/findId";
	}
	
	@RequestMapping(value="/findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		return "/findAccount/findPwd";
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
			mav.addObject("member_id", member_id);
			mav.setViewName("/findAccount/newPassword");
		}else {
			mav.addObject("find_result", "fail");
			mav.setViewName("/findAccount/findId");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/cfindPwd_check.do", method=RequestMethod.POST)
	public ModelAndView cfindPwd_check(String company_id, String name, String phone_num) {
		ModelAndView mav = new ModelAndView();
		CompanyDao companyDao = new CompanyDao();
		int result= companyDao.select(company_id, name, phone_num);
		
		if(result == 1) {
			mav.addObject("company_id", company_id);
			mav.setViewName("/findAccount/cnewPassword");
		}else {
			mav.addObject("find_result", "fail");
			mav.setViewName("/findAccount/findCompany");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/mChangePassword.do", method=RequestMethod.POST)
	public ModelAndView Mnewpassword(String member_id, String mnewpassword) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		int result = memberDao.changeMpassword(member_id, mnewpassword);
		
		if(result==1) {
			mav.addObject("changePassword_result", "success");
			mav.setViewName("/login/login");
		}else {
			System.out.println("비밀번호 변경 실패");
		}
		return mav;
	}
	
	@RequestMapping(value="/myPageChangePassword.do", method=RequestMethod.GET)
	public ModelAndView MyPageChangePassword(String member_id) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		MemberVo memberVo = memberDao.select(member_id);
		
		mav.addObject("member_id", memberVo.getMember_id());
		mav.addObject("password", memberVo.getPassword());
		mav.setViewName("/findAccount/newPassword");
		return mav;
	}
	
	@RequestMapping(value="/cChangePassword.do", method=RequestMethod.POST)
	public String Cnewpassword(String company_id, String cnewpassword) {
		String viewName="";
		CompanyDao companyDao = new CompanyDao();
		int result = companyDao.changeCpassword(company_id, cnewpassword);
		
		if(result==1) {
			viewName="redirect:/login.do";
		}else {
			System.out.println("비밀번호 변경 실패");
		}
		return viewName;
	}
	
	@RequestMapping(value="/CompanyPageChangePassword.do", method=RequestMethod.GET)
	public ModelAndView CompanyPageChangePassword(String company_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("company_id", company_id);
		mav.setViewName("/findAccount/cnewPassword");
		return mav;
	}
	
	
}
