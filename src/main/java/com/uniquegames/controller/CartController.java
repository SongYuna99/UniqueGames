package com.uniquegames.controller;

import com.uniquegames.annotation.Login;
import com.uniquegames.vo.MemberVo;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.model.SessionConstants;
import com.uniquegames.service.OrderServiceImpl;
import com.uniquegames.vo.MemberVo;
import com.uniquegames.vo.OrderVo;

@Controller
public class CartController {
	@Autowired
	OrderServiceImpl orderService;

	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(HttpSession request) {
		MemberVo member = (MemberVo) request.getAttribute(SessionConstants.LOGIN_MEMBER);

		ModelAndView model = new ModelAndView();
		ArrayList<OrderVo> cartList = orderService.getCartList(member.getMember_id());

		if (cartList.size() > 0) {
			model.addObject("cartList", cartList);
			model.addObject("nothingInCart", false);
		} else {
			model.addObject("nothingInCart", true);
		}

		model.setViewName("/order/cart");

		return model;
	}

	@RequestMapping(value = "/cart_delete_one.do", method = RequestMethod.GET)
	public String cart_delete_one(int id) {
		String view;
		int result = orderService.getCartDeleteOne(id);

		if (result != 0) {
			view = "redirect://cart.do";
		} else {
			view = "/order/error";
		}

		return view;
	}

	@RequestMapping(value = "/cart_delete_selected.do")
	public String cart_delete_selected(@RequestParam(value = "checkedList[]") List<Integer> checkedList) {
		int result = 0;

		for (int i = 0; i < checkedList.size(); i++) {
			result = orderService.getCartDeleteOne((int) checkedList.get(i));
			if (result == 0) {
				return "/order/error";
			}
		}
		return "redirect://cart.do";
	}

	@RequestMapping(value = "/cart_delete_all.do", method = RequestMethod.GET)
	public String cart_delete_selected(HttpSession request) {
		MemberVo member = (MemberVo) request.getAttribute(SessionConstants.LOGIN_MEMBER);
		String m_id = member.getMember_id();
		int result = orderService.getCartDeleteAll(m_id);

		if (result == 0) {
			return "/order/error";
		}

		return "redirect://cart.do";
	}

	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public String error() {
		return "/order/error";
	}

}
