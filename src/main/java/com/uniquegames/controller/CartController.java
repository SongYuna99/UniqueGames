package com.uniquegames.controller;

import com.uniquegames.annotation.Login;
import com.uniquegames.vo.MemberVo;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.service.OrderServiceImpl;
import com.uniquegames.vo.OrderVo;

@Controller
public class CartController {
	@Autowired
	OrderServiceImpl orderService;

	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(@Login MemberVo loginMember) {
		ModelAndView model = new ModelAndView();
		ArrayList<OrderVo> cartList = orderService.getCartList(loginMember.getMember_id());

		if (cartList.size() > 0) {
			model.addObject("cartList", cartList);
			model.addObject("nothingInCart", false);
		} else {
			model.addObject("nothingInCart", true);
		}
		model.addObject("m_id", loginMember.getMember_id());
		model.setViewName("/order/cart");

		return model;
	}

	@RequestMapping(value = "/cart_delete_one.do", method = RequestMethod.GET)
	public String cart_delete_one(int id, String m_id) {
		String view;
		int result = orderService.getCartDeleteOne(id);

		if (result != 0) {
			view = "redirect://cart.do?m_id=" + m_id;
		} else {
			view = "/order/error?m_id" + m_id;
		}

		return view;
	}

	@RequestMapping(value = "/cart_delete_selected.do")
	public String cart_delete_selected(String m_id, @RequestParam(value = "checkedList[]") List<Integer> checkedList) {
		String view;
		int result = 0;

		for (int i = 0; i < checkedList.size(); i++) {
			result = orderService.getCartDeleteOne((int) checkedList.get(i));
			if (result == 0) {
				view = "/order/error?m_id" + m_id;
				return view;
			}
		}
		view = "redirect://cart.do?m_id=" + m_id;

		return view;
	}

	@RequestMapping(value = "/cart_delete_all.do", method = RequestMethod.GET)
	public String cart_delete_selected(String m_id) {
		String view;
		int result = orderService.getCartDeleteAll(m_id);

		if (result != 0) {
			view = "redirect://cart.do?m_id=" + m_id;
		} else {
			view = "/order/error";
		}

		return view;
	}

	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public ModelAndView error(String m_id) {
		ModelAndView model = new ModelAndView();
		model.addObject("m_id", m_id);
		model.setViewName("/order/error");

		return model;
	}

}
