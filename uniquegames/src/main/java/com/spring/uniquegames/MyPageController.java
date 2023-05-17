package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage() {
		return "/myPage/myPage";
	}
}
