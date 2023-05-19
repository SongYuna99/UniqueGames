package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FindAccountController {

	@RequestMapping(value="findId.do", method=RequestMethod.GET)
	public String findId() {
		return "/findAccount/findId";
	}
	
	@RequestMapping(value="findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		return "/findAccount/findPwd";
	}
}
