package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.UserDao;
import com.uniquegames.vo.UserVo;

@Controller
public class MyPageController {
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage() {
		return "/myPage/myPage";
	}
	
	/*
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(String id) {
		
		ModelAndView mav = new ModelAndView();
		UserDao userDao = new UserDao();
		UserVo userVo = userDao.select(id);
		
		if(userVo != null) {
			mav.addObject("userVo", userVo);
			mav.setViewName("/myPage/myPage");
		}else {
			mav.addObject("myPage_result", "fail");
			mav.setViewName("/main/index");
		}
		
		return mav;
	}
	*/
	
}
