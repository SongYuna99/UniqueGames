package com.uniquegames.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.OrderDao;
import com.uniquegames.service.OrderServiceImpl;
import com.uniquegames.vo.OrderVo;

@Controller
public class OrderController {
	@Autowired
	OrderServiceImpl orderServiece;
	
	List<Integer> list;

	/** order.do **/
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public ModelAndView order(String m_id, String[] checkedList) {
		ModelAndView model = new ModelAndView();

		list = new ArrayList<Integer>();
		for (String id : checkedList) {
			list.add(Integer.parseInt(id));
		}

		ArrayList<OrderVo> orderList = orderServiece.getOrderList(list);
		int count = list.size();
		int amount = orderServiece.getOrderAmount(list);

		model.addObject("m_id", m_id);
		model.addObject("list", list);
		model.addObject("orderList", orderList);
		model.addObject("count", count);
		model.addObject("amount", amount);
		model.setViewName("/order/order");

		return model;
	}

	@RequestMapping(value = "/order_delete_one.do")
	public ModelAndView order_delete_one(int id, String m_id) {
		ModelAndView model = new ModelAndView();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i) == id) {
				list.remove(i);
			}
		}

		if (list.size() == 0) {
			model.addObject("nothingInCart", "order");
			model.setViewName("redirect://cart.do?m_id=" + m_id);
		} else {

			ArrayList<OrderVo> orderList = orderServiece.getOrderList(list);
			int count = list.size();
			int amount = orderServiece.getOrderAmount(list);

			model.addObject("m_id", m_id);
			if (orderList != null) {
				model.addObject("list", list);
				model.addObject("orderList", orderList);
				model.addObject("count", count);
				model.addObject("amount", amount);
				model.setViewName("/order/order");
			}
		}

		return model;
	}

	/** order_complete.do **/
	@RequestMapping(value = "/order_complete.do", method = RequestMethod.POST)
	public String order_complete(String method) {
		int result = orderServiece.getOrderComplete(list, method);
		String view = "";

		if (result != 0) {
			view = "/order/order_complete";
		} else {
			view = "/order/error";
		}

		return view;
	}
}
