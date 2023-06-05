package com.uniquegames.controller;

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
	            // addr 값이 null인 경우 처리
	            memberVo.setAddr1(""); // 대체값 할당
	            memberVo.setAddr2(""); // 대체값 할당
	            
	        } else {
	        	
	        	String[] addrSplit = addr.split("   ");
	            if (addrSplit.length == 1) {
	                // addr1 값만 있는 경우
	            	String addr1=addrSplit[0];
	                memberVo.setAddr1(addr1);
	                memberVo.setAddr2(""); // 대체값 할당
	            } else if (addrSplit.length == 2) {
	                // addr1, addr2 값이 모두 있는 경우
	            	String addr1 = addrSplit[0];
	            	String addr2 = addrSplit[1];
	                memberVo.setAddr1(addr1);
	                memberVo.setAddr2(addr2);
	            } else {
	                // addr 값 형식이 잘못된 경우 또는 다른 처리 방식을 선택할 경우
	                memberVo.setAddr1(""); // 대체값 할당
	                memberVo.setAddr2(""); // 대체값 할당
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
	
	@RequestMapping(value="/companyMyPage.do", method=RequestMethod.GET)
	public ModelAndView companyMyPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		CompanyDao companyDao = new CompanyDao();
		CompanyVo companyVo = companyDao.select(session.getAttribute("company_id"));
		
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
	            // addr 값이 null인 경우 처리
				companyVo.setAddr1(""); // 대체값 할당
				companyVo.setAddr2(""); // 대체값 할당
	            
	        } else {
	        	
	        	String[] addrSplit = addr.split("   ");
	            if (addrSplit.length == 1) {
	                // addr1 값만 있는 경우
	            	String addr1=addrSplit[0];
	            	companyVo.setAddr1(addr1);
	            	companyVo.setAddr2(""); // 대체값 할당
	            } else if (addrSplit.length == 2) {
	                // addr1, addr2 값이 모두 있는 경우
	            	String addr1 = addrSplit[0];
	            	String addr2 = addrSplit[1];
	            	companyVo.setAddr1(addr1);
	            	companyVo.setAddr2(addr2);
	            } else {
	                // addr 값 형식이 잘못된 경우 또는 다른 처리 방식을 선택할 경우
	            	companyVo.setAddr1(""); // 대체값 할당
	            	companyVo.setAddr2(""); // 대체값 할당
	            }
	        }
			//String tel = companyVo.getTel();
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
			System.out.println(memberVo.getEmail());
			System.out.println(memberVo.getAddr());
			System.out.println(memberVo.getPhone_num());
			System.out.println("update실패");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/companyMyPage_proc.do", method=RequestMethod.POST)
	public ModelAndView companyMyPage_proc(CompanyVo companyVo) {
		ModelAndView mav = new ModelAndView();
		CompanyDao companyDao = new CompanyDao();
		int result = companyDao.update(companyVo);
		System.out.println("---------------------------------------"+result);
		if(result == 1) {
			mav.addObject("update_result", "success");
			mav.setViewName("redirect:/index.do");
		}else {
			System.out.println("update실패");
		}
		
		return mav;
	}
	
	
}
