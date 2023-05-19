package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.UserDao;
import com.uniquegames.vo.UserVo;

@Controller
public class JoinController {

	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
	
	@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
	public ModelAndView join_proc(UserVo userVo) {
		ModelAndView mav = new ModelAndView();
		UserDao userDao = new UserDao();
		int result = userDao.insert(userVo);
		
		if(result==1) {
			mav.addObject("join_result", "succcess");
			mav.setViewName("/login/login");
		}else {
			mav.addObject("join_result", "fail");
			mav.setViewName("/join/join");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/id_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String id_check(String id) {
		String viewName = "";
		
		UserDao userDao = new UserDao();
		int result = userDao.idCheck(id);
		
		return String.valueOf(result);
	}
}
