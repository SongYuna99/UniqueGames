package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.UserDao;
import com.uniquegames.vo.UserVo;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(UserVo userVo) {
		
		ModelAndView mav = new ModelAndView();
		UserDao userDao = new UserDao();
		int result = userDao.loginCheck(userVo);
		
		if(result==1) {
			mav.addObject("login_result", "success");
			mav.setViewName("main/index");
		}else {
			mav.addObject("login_result", "fail");
			mav.setViewName("login/login");
		}
			
		return mav;
	}

	
	

}
