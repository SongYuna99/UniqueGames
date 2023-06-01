package com.uniquegames.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.uniquegames.dao.OrderDao;
import com.uniquegames.vo.OrderVo;

@Controller
public class PaymentDetailController {
	/** payment_detail.do **/
	@RequestMapping(value = "/payment_detail.do", method = RequestMethod.GET)
	public ModelAndView payment_detail(int m_id) {
		ModelAndView model = new ModelAndView();
		model.addObject("m_id", m_id);
		model.setViewName("/order/payment_detail");
		
		return model;
	}

	/** payment_detail_data.do **/
	@RequestMapping(value = "/payment_detail_data.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String payment_detail_data(int m_id, String array) {
		OrderDao orderDao = new OrderDao();
		ArrayList<OrderVo> list = orderDao.getPaymentDetail(m_id, array);

		// list 객체의 데이터를 JSON 형태로 생성
		JsonObject jlist = new JsonObject();
		JsonArray jarray = new JsonArray();

		if (list.size() == 0) {
			jlist.addProperty("nothing", true);
		} else {
			jlist.addProperty("nothing", false);
		}
		jlist.addProperty("count", orderDao.getPaymentCount(m_id));
		jlist.addProperty("totalAmount", orderDao.getPaymentAmount(m_id));
		jlist.addProperty("m_id", m_id);

		for (OrderVo payment : list) {
			JsonObject jobj = new JsonObject();

			jobj.addProperty("rno", payment.getRno());
			jobj.addProperty("orderdate", payment.getOrderdate());
			jobj.addProperty("gametitle", payment.getGametitle());
			jobj.addProperty("amount", payment.getAmount());

			jarray.add(jobj);
		}
		jlist.add("jlist", jarray);

		return new Gson().toJson(jlist);
	}
}
