package com.uniquegames.repository;

import com.uniquegames.vo.OrderVo;

public interface OrderMapper {
	OrderVo getCartList(String m_id);
	int getCartCount(String m_id);
	int getCartDelete(String m_id);
	int getCartDeleteOne(int id);
	OrderVo getOrderList(int id);
	int getOrderAmount(int id);
	int getOrderComplete(String method, int id);
	OrderVo getPaymentDetail(String array, String m_id);
	int getPaymentCount(String m_id);
	int getPaymentAmount(String m_id);
	OrderVo getDonationDetail(String array, String c_id);
	int getExpected(String c_id);
	int getTotalDonation(String c_id);
	OrderVo getDonationRank(String c_id);

}
