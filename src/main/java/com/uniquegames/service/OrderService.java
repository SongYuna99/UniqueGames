package com.uniquegames.service;

import java.util.ArrayList;
import java.util.List;

import com.uniquegames.vo.OrderVo;

public interface OrderService {
	ArrayList<OrderVo> getCartList(int m_id);

	int getCartCount(int m_id);

	int getCartDeleteAll(int m_id);

	int getCartDeleteOne(int id);

	ArrayList<OrderVo> getOrderList(List<Integer> checkedList);

	int getOrderAmount(List<Integer> checkedList);

	int getOrderComplete(List<Integer> checkedList, String method);

	ArrayList<OrderVo> getPaymentDetail(int m_id, String array);

	int getPaymentCount(int m_id);

	int getPaymentAmount(int m_id);

	ArrayList<OrderVo> getDonationDetail(int c_id, String array);

	int getExpected(int c_id);

	int getTotalDonation(int c_id);

	ArrayList<OrderVo> getDonationRank(int c_id);

}
