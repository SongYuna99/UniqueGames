package com.uniquegames.controller;

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
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CompanyMemberService companyMemberService;
	
	//show information about member user
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVo memberVo = memberService.memberMyPageResult((String)session.getAttribute("member_id"));
		
		if(memberVo != null) {
			String password = memberVo.getPassword();
			String email1 = memberVo.getEmail().split("@")[0];
			String email2 = memberVo.getEmail().split("@")[1];
			String email3 = memberVo.getEmail().split("@")[1];
			String tel = memberVo.getTel();
			String phone1 = memberVo.getPhone_num().split("-")[0];
			String phone2 = memberVo.getPhone_num().split("-")[1];
			String phone3 = memberVo.getPhone_num().split("-")[2];
			String addr = memberVo.getAddr();
			
			if (addr == null) {
	            // addr ???? null?? ??? ???
	            memberVo.setAddr1(""); // ????? ???
	            memberVo.setAddr2(""); // ????? ???
	        }else {
	        	String[] addrSplit = addr.split("   ");
	            if (addrSplit.length == 1) {
	                // addr1 ???? ??? ???
	            	String addr1=addrSplit[0];
	                memberVo.setAddr1(addr1);
	                memberVo.setAddr2("");
	            } else if (addrSplit.length == 2) {
	                // addr1, addr2 ???? ??? ??? ???
	            	String addr1 = addrSplit[0];
	            	String addr2 = addrSplit[1];
	                memberVo.setAddr1(addr1);
	                memberVo.setAddr2(addr2);
	            } else {
	                // addr ?? ?????? ????? ??? ??? ??? ??? ????? ?????? ???
	                memberVo.setAddr1(""); // ????? ???
	                memberVo.setAddr2(""); // ????? ???
	            }
	        }
			
			memberVo.setEmail1(email1);
			memberVo.setEmail2(email2);
			memberVo.setEmail3(email3);
			memberVo.setTel(tel);
			memberVo.setPhone1(phone1);
			memberVo.setPhone2(phone2);
			memberVo.setPhone3(phone3);
			mav.addObject("memberVo", memberVo);
			mav.setViewName("/myPage/myPage");
		}else {
			mav.addObject("myPage_result", "fail");
			mav.setViewName("/login/login");
		}
		
		return mav;
	}
	
	//mypage actual update
	@RequestMapping(value="/myPage_proc.do", method=RequestMethod.POST)
	public ModelAndView myPage_proc(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		int result = memberService.memberUpdateResult(memberVo);

		if(result == 1) {
			mav.addObject("update_result", "success");
			mav.setViewName("redirect:/");
		}else {
			System.out.println("update????");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/companyMyPage.do", method=RequestMethod.GET)
	public ModelAndView companyMyPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		CompanyVo companyVo = companyMemberService.companyPageResult((String)session.getAttribute("company_id"));
		String Gname = companyMemberService.companyGameName((String)session.getAttribute("company_id"));
		
		if(companyVo != null) {
			
			String password = companyVo.getPassword();
			String email1 = companyVo.getEmail().split("@")[0];
			String email2 = companyVo.getEmail().split("@")[1];
			String email3 = companyVo.getEmail().split("@")[1];
			String tel = companyVo.getTel();
			String phone1 = companyVo.getPhone_num().split("-")[0];
			String phone2 = companyVo.getPhone_num().split("-")[1];
			String phone3 = companyVo.getPhone_num().split("-")[2];
			String addr = companyVo.getAddr();
			
			if (addr == null) {
	            // addr ???? null?? ??? ???
				companyVo.setAddr1(""); // ????? ???
				companyVo.setAddr2(""); // ????? ???
	            
	        } else {
	        	
	        	String[] addrSplit = addr.split("   ");
	            if (addrSplit.length == 1) {
	                // addr1 ???? ??? ???
	            	String addr1=addrSplit[0];
	            	companyVo.setAddr1(addr1);
	            	companyVo.setAddr2(""); // ????? ???
	            } else if (addrSplit.length == 2) {
	                // addr1, addr2 ???? ??? ??? ???
	            	String addr1 = addrSplit[0];
	            	String addr2 = addrSplit[1];
	            	companyVo.setAddr1(addr1);
	            	companyVo.setAddr2(addr2);
	            } else {
	                // addr ?? ?????? ????? ??? ??? ??? ??? ????? ?????? ???
	            	companyVo.setAddr1(""); // ????? ???
	            	companyVo.setAddr2(""); // ????? ???
	            }
	        }
			
			companyVo.setGame(Gname);
			companyVo.setEmail1(email1);
			companyVo.setEmail2(email2);
			companyVo.setEmail3(email3);
			companyVo.setTel(tel);
			companyVo.setPhone1(phone1);
			companyVo.setPhone2(phone2);
			companyVo.setPhone3(phone3);
			
			mav.addObject("companyVo", companyVo);
			mav.setViewName("/myPage/companyMyPage");
		}else {
			
			mav.addObject("myPage_result", "fail");
			mav.setViewName("/login/login");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/companyMyPage_proc.do", method=RequestMethod.POST)
	public ModelAndView companyMyPage_proc(CompanyVo companyVo) {
		ModelAndView mav = new ModelAndView();
		int result = companyMemberService.companyUpdateResult(companyVo);
		
		if(result == 1) {
			mav.addObject("update_result", "success");
			mav.setViewName("redirect:/");
		}else {
			System.out.println("update????");
		}
		
		return mav;
	}
	
	
}
