package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Controller
public class DeleteAccountController {

	@RequestMapping(value="/deletePwd.do", method=RequestMethod.GET)
	public String deletePwd() {
		return "/deleteAccount/deletePwd";
	}
	/*
	@RequestMapping(value="/deletePwd_proc.do", method=RequestMethod.POST)
	public ModelAndView deletePwd_proc(MemberVo memberVo) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		int result = memberDao.delete(memberVo);
		
		if(result==1) {
			mav.addObject("delete_result", "success");
			mav.addObject("memberVo", memberVo);
			mav.setViewName("/deleteAccount/deletePwd");
		}else {
			System.out.println("½ÇÆÐ");
		}
		
		return mav;
	}
	*/
	@RequestMapping(value="/delete_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String delete_check(MemberVo memberVo) {
		
		
		MemberDao memberDao = new MemberDao();
		JsonObject jlist = new JsonObject();
		
		JsonObject jobj = new JsonObject();
		jobj.addProperty("member_id", memberVo.getMember_id());
		jobj.addProperty("password", memberVo.getPassword());
		
		jlist.add("jlist", jobj);
		
		int result = memberDao.deleteCheck(memberVo);
		
		
		return new Gson().toJson(jlist);
	}
}
