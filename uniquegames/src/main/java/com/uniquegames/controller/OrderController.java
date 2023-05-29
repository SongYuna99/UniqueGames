package com.uniquegames.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.OrderDao;
import com.uniquegames.vo.OrderVo;

@Controller
public class OrderController {
	/**	order.do **/
	@RequestMapping(value = "/order.do", method = RequestMethod.POST)
	public ModelAndView order(Integer m_id, @RequestParam(value = "checkedList[]") List<Integer> checkedList) {
		ModelAndView model = new ModelAndView();
		OrderDao orderDao = new OrderDao();
		ArrayList<OrderVo> orderList = orderDao.getOrderList(checkedList);

		if (orderList != null) {
			model.addObject("orderList", orderList);
			model.addObject("nothingInCart", false);
		} else {
			model.addObject("nothingInCart", true);
		}
		model.addObject("m_id", m_id);
		model.setViewName("/order/cart");

		return model;	
	}
	
	
	/**	order_complete.do **/
	@RequestMapping(value = "/order_complete.do", method = RequestMethod.GET)
	public String order_complete() {
		return "/order/order_complete";
	}
}
