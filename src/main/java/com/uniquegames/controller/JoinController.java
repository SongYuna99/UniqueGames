package com.uniquegames.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.CompanyDao;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.service.CompanyMemberService;
import com.uniquegames.service.MailSendService;
import com.uniquegames.service.MemberService;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;

@Controller
public class JoinController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CompanyMemberService companyMemberService;
	
	@Autowired
	private MailSendService mailService;

	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
	
	@RequestMapping(value="/joinChoice.do", method=RequestMethod.GET)
	public String joinChoice() {
		return "/join/joinChoice";
	}
	
	
	@RequestMapping(value="/join_individual_proc.do", method=RequestMethod.POST)
	public ModelAndView join_proc(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		int result = memberService.memberJoinResult(memberVo);
		
		if(result==1) {
			mav.addObject("join_individual_result", "success");
			mav.setViewName("/login/login");
		}else {
			System.out.println("����");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/id_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String id_check(String member_id) {
		return memberService.memberIdCheckResult(member_id);
	}
	
	/**�̸��� �ߺ�üũ*/
	@RequestMapping(value="/email_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String email_check(String email1, String email2) {
		String email = email1 + "@" + email2;
		
		int result = memberService.memberEmailCheckResult(email);
		System.out.println("result="+result);
		return String.valueOf(result);
	}
	
	/**�޴���ȭ �ߺ�üũ*/
	@RequestMapping(value="/phone_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String phone_check(String phone1, String phone2, String phone3) {
		String phone_num = phone1+"-"+phone2+"-"+phone3;
		
		System.out.println("phone_num="+ phone_num);
		
		int result = memberService.memberPhoneCheckResult(phone_num);
		System.out.println("result="+result);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("email------->>" + email);
		
		return mailService.joinEmail(email);
	}
	
	/******************************************************************����**********************************************************************/
	@RequestMapping(value="/join_company_proc.do", method=RequestMethod.POST)
	public ModelAndView companyJoin(CompanyVo companyVo) {
		ModelAndView mav = new ModelAndView();
		int result = companyMemberService.companyJoinResult(companyVo);
		
		if(result==1) {
			mav.addObject("join_company_result", "success");
			mav.setViewName("/login/login");
		}else {
			System.out.println("����");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/c_id_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String c_id_check(String company_id) {
		int result = companyMemberService.companyIdCheckResult(company_id);
		
		return String.valueOf(result);
	}
	
	/**�̸��� �ߺ�üũ*/
	@RequestMapping(value="/c_email_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String c_email_check(String email1, String email2) {
		String email = email1 + "@" + email2;
		
		int result = companyMemberService.companyEmailCheckResult(email);
		
		return String.valueOf(result);
	}
	
	
	
	/**�޴���ȭ �ߺ�üũ*/
	@RequestMapping(value="/c_phone_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String c_phone_check(String phone1, String phone2, String phone3) {
		String phone_num = phone1+"-"+phone2+"-"+phone3;
		
		System.out.println("phone_num="+ phone_num);
		
		int result = companyMemberService.companyPhoneCheckResult(phone_num);
		System.out.println("result="+result);
		return String.valueOf(result);
	}
	
	
}
