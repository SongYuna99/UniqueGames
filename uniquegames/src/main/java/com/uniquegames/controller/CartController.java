package com.uniquegames.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/cart_delete_one.do", method = RequestMethod.GET)
	public String cart_delete_one(int id, int m_id) {
		String view;
		OrderDao orderDao = new OrderDao();
		int result = orderDao.getCartDeleteOne(id);

		if (result != 0) {
			view = "redirect://cart.do?m_id=" + m_id;
		} else {
			view = "/order/error?m_id" + m_id;
		}

		return view;
	}

	@RequestMapping(value = "/cart_delete_selected.do")
	public String cart_delete_selected(Integer m_id, @RequestParam(value = "checkedList[]") List<Integer> checkedList) {
		String view;
		OrderDao orderDao = new OrderDao();
		int result = 0;
		
		for (int i = 0; i < checkedList.size(); i++) {
			result = orderDao.getCartDeleteOne((int)checkedList.get(i));
			if (result == 0) {
				view = "/order/error?m_id" + m_id;
				return view;
			}
		}
		view = "redirect://cart.do?m_id=" + m_id;
		
		return view;
	}

	@RequestMapping(value = "/cart_delete_all.do", method = RequestMethod.GET)
	public String cart_delete_selected(int m_id) {
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
	public ModelAndView error(int m_id) {
		ModelAndView model = new ModelAndView();
		model.addObject("m_id", m_id);
		model.setViewName("/order/error");
		
		return model;
	}

}
