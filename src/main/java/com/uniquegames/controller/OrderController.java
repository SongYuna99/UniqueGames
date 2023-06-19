package com.uniquegames.controller;

import com.uniquegames.model.SessionConstants;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.service.OrderServiceImpl;
import com.uniquegames.vo.OrderVo;

@Controller
@SessionAttributes(SessionConstants.LOGIN_MEMBER)
public class OrderController {
	@Autowired
	OrderServiceImpl orderServiece;

	List<Integer> list;

	/** order.do **/
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public ModelAndView order(String[] checkedList, HttpSession request) {
		ModelAndView model = new ModelAndView();

		list = new ArrayList<Integer>();
		for (String id : checkedList) {
			list.add(Integer.parseInt(id));
		}

		ArrayList<OrderVo> orderList = orderServiece.getOrderList(list);
		int count = list.size();
		int totalAmount = orderServiece.getOrderAmount(list);

		model.addObject("list", list);
		model.addObject("orderList", orderList);
		model.addObject("count", count);
		model.addObject("totalAmount", totalAmount);
		model.setViewName("/order/order");

		return model;
	}

	@RequestMapping(value = "/order_delete_one.do")
	public ModelAndView order_delete_one(int id) {
		ModelAndView model = new ModelAndView();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i) == id) {
				list.remove(i);
			}
		}

		if (list.size() == 0) {
			model.addObject("nothingInCart", "order");
			model.setViewName("redirect://cart.do");
		} else {

			ArrayList<OrderVo> orderList = orderServiece.getOrderList(list);
			int count = list.size();
			int amount = orderServiece.getOrderAmount(list);

			if (orderList.size() > 0) {
				model.addObject("list", list);
				model.addObject("orderList", orderList);
				model.addObject("count", count);
				model.addObject("amount", amount);
				model.setViewName("/order/order");
			}
		}

		return model;
	}

	/** order_proc.do **/
	@RequestMapping(value = "/order_proc.do", method = RequestMethod.GET)
	public ModelAndView order_complete(String method) {
		ModelAndView model = new ModelAndView();
		int result = orderServiece.getOrderComplete(list, method);

		if (result != 0) {
			model.setViewName("redirect://order_complete.do");
		} else {
			model.setViewName("/order/error");
		}

		return model;
	}

	/** order_proc.do **/
	@RequestMapping(value = "/order_complete.do", method = RequestMethod.GET)
	public String order_complete() {
		return "/order/order_complete";
	}
}
