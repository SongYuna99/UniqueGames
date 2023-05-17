package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uniquegames.dao.UserDao;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public String login_proc() {
		
		UserDao userDao = new UserDao();
		int result = userDao.loginCheck();
		
		if(result==1)
			return "/main/index";
		else
			return "/login/login_fail";
		
	}
	
	

}
