package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeleteAccountController {

	@RequestMapping(value="/deletePwd.do", method=RequestMethod.GET)
	public String deletePwd() {
		return "/deleteAccount/deletePwd";
	}
}
