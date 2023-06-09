package com.uniquegames.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.service.CompanyMemberService;
import com.uniquegames.service.MemberService;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;

@Controller
public class DeleteAccountController {
	
	@Autowired
	private MemberService memberSerivce;
	
	@Autowired
	private CompanyMemberService companyMemberService;

	
	@RequestMapping(value="/deletePwd.do", method=RequestMethod.GET)
	public ModelAndView deletePwd(String member_id) {
		ModelAndView mav = new ModelAndView();
		MemberVo memberVo = memberSerivce.memberMyPageResult(member_id);
		mav.addObject("memberVo", memberVo);
		mav.setViewName("/deleteAccount/deletePwd");
		
		return mav;
	}
	
	@RequestMapping(value="/delete_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String delete_check(MemberVo memberVo) {
		int result = memberSerivce.memberDeleteResult(memberVo);
		return String.valueOf(result);
	}
	
	/**************************¹ýÀÎ****************************************/
	@RequestMapping(value="/deleteCompany.do", method=RequestMethod.GET)
	public ModelAndView deleteCompany(String company_id) {
		ModelAndView mav = new ModelAndView();
		CompanyVo companyVo = companyMemberService.companyPageResult(company_id);
		
		mav.addObject("companyVo", companyVo);
		mav.setViewName("/deleteAccount/deleteCompany");
		
		return mav;
	}
	
	@RequestMapping(value="/company_delete_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String company_delete_check(CompanyVo companyVo) {
		int result = companyMemberService.companyDeleteResult(companyVo);
		return String.valueOf(result);
	}
	
}
