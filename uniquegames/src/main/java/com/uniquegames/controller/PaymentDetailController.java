package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentDetailController {
	/** payment_detail.do **/
	@RequestMapping(value = "/payment_detail.do", method = RequestMethod.GET)
	public String payment_detail() {
		return "/order/payment_detail";
	}
}
