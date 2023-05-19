package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index() {
		return "/main/index";
	}
	@RequestMapping(value="/alllist.do", method=RequestMethod.GET)
	public String alllist() {
		return "/main/allList";
	}
	@RequestMapping(value="/topgame.do", method=RequestMethod.GET)
	public String topgame() {
		return "/main/topGame";
	}
}
