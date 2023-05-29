package com.uniquegames.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.OrderDao;
import com.uniquegames.vo.OrderVo;

@Controller
public class CartController {
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(int m_id) {
		ModelAndView model = new ModelAndView();
		OrderDao orderDao = new OrderDao();
		ArrayList<OrderVo> cartList = orderDao.getCartList(m_id);

		if (cartList != null) {
			model.addObject("cartList", cartList);
			model.addObject("nothingInCart", false);
		} else {
			model.addObject("nothingInCart", true);
		}
		model.addObject("m_id", m_id);
		model.setViewName("/order/cart");		

		return model;
	}

	@RequestMapping(value = "/cart_delete_all.do", method = RequestMethod.GET)
	public String cart_delete_all(int m_id) {
		String view;
		OrderDao orderDao = new OrderDao();
		int result = orderDao.getCartDeleteAll(m_id);

		if (result != 0) {
			view = "redirect://cart.do?m_id=" + m_id;
		} else {
			view = "/order/error";
		}

		return view;
	}

	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public String error() {
		return "/order/error";
	}
}
