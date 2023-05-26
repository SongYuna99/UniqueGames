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
	/**	cart.do **/
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(int m_id) {
		ModelAndView model = new ModelAndView();
		OrderDao orderDao = new OrderDao();
		ArrayList<OrderVo> cartList = orderDao.getCartList(m_id);

		model.addObject("cartList", cartList);
		model.addObject("count", orderDao.getCartCount(m_id));
		model.addObject("totalAmount", orderDao.getTotalAmount(m_id));
		model.addObject("m_id", cartList.get(0).getId());
		model.setViewName("/order/cart");

		return model;
	}
	
	/**	cart_delete_all.do **/
	@RequestMapping(value = "/cart_delete_all.do", method = RequestMethod.GET)
	public ModelAndView cart_delete_all(int m_id) {
		ModelAndView model = new ModelAndView();
		OrderDao orderDao = new OrderDao();
		int result = orderDao.getCartDeleteAll(m_id);
		
		if(result == 1) {
			model.setViewName("/order/cart");			
		}
		else {
			model.setViewName("/order/error");
		}
		
		return model;
	}
}
