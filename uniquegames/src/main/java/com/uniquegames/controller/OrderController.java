package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	/**	order.do **/
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String order() {
		return "/order/order";
	}
	
	
	/**	order_complete.do **/
	@RequestMapping(value = "/order_complete.do", method = RequestMethod.GET)
	public String order_complete() {
		return "/order/order_complete";
	}
}
