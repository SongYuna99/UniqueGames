package com.uniquegames.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uniquegames.vo.OrderVo;

@Repository
public class OrderDao extends DBConn {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** Cart **/
	// getCartList
	public ArrayList<OrderVo> getCartList(int m_id) {
		List<Object> oList = sqlSession.selectList("com.uniquegames.orderMapper.getSelectList", m_id);
		ArrayList<OrderVo> cartList = new ArrayList<OrderVo>();

		for (Object cart : oList) {
			cartList.add((OrderVo) cart);
		}

		return cartList;
	} // getCartList

	// getCartCount
	public int getCartCount(int m_id) {
		return sqlSession.selectOne("com.uniquegames.orderMapper.getCartCount", m_id);
	} // getCartCount

	// getCartDeleteAll
	public int getCartDeleteAll(int m_id) {
		return sqlSession.delete("com.uniquegames.orderMapper.getCartDeleteAll", m_id);
	} // getCartDeleteAll

	// getCartDeleteOne
	public int getCartDeleteOne(int id) {
		return sqlSession.delete("com.uniquegames.orderMapper.getCartDeleteOne", id);
	} // getCartDeleteOne

	/** Order **/
	// getOrderList
	public ArrayList<OrderVo> getOrderList(List<Integer> checkedList) {
		ArrayList<OrderVo> orderList = new ArrayList<OrderVo>();

		for (int id : checkedList) {
			OrderVo order = sqlSession.selectOne("com.uniquegames.orderMapper.getOrderList", id);
			orderList.add(order);
		}

		return orderList;
	} // getCartList

	// getOrderAmount
	public int getOrderAmount(List<Integer> checkedList) {
		int totalAmount = 0;

		for (int id : checkedList) {
			int amount = sqlSession.selectOne("com.uniquegames.orderMapper.getOrderAmount", id);
			totalAmount += amount;
		}

		return totalAmount;
	} // getOrderAmount

	// getOrderComplete
	public int getOrderComplete(List<Integer> checkedList, String method) {
		int result = 0;

		for (int i = 0; i < checkedList.size(); i++) {
			Map<String, String> param = new HashMap<String, String>();
			param.put("id", String.valueOf(checkedList.get(i)));
			param.put("method", method);
			
			result = sqlSession.selectOne("com.uniquegames.orderMapper.getOrderComplete", param);
			
			if(result == 0) {
				i = checkedList.size();
			}
		}

		return result;
	} // getOrderComplete

	// getPaymentDetail
	public ArrayList<OrderVo> getPaymentDetail(int m_id, String array) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("m_id", String.valueOf(m_id));
		param.put(array, array);

		List<Object> oList = sqlSession.selectList("com.uniquegames.orderMapper.getPaymentDetail", param);
		ArrayList<OrderVo> paymentList = new ArrayList<OrderVo>();

		for (Object payment : oList) {
			paymentList.add((OrderVo) payment);
		}

		return paymentList;
	} // getPaymentDetail

	// getPaymentCount
	public int getPaymentCount(int m_id) {
		return sqlSession.selectOne("com.uniquegames.orderMapper.getPaymentCount", m_id);
	} // getPaymentCount

	// getPaymentAmount
	public int getPaymentAmount(int m_id) {
		return sqlSession.selectOne("com.uniquegames.orderMapper.getPaymentAmount", m_id);
	} // getPaymentAmount

	// getDonationDetail
	public ArrayList<OrderVo> getDonationDetail(int c_id, String array) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("c_id", String.valueOf(c_id));
		param.put(array, array);

		List<Object> oList = sqlSession.selectList("com.uniquegames.orderMapper.getDonationDetail", param);
		ArrayList<OrderVo> donationList = new ArrayList<OrderVo>();

		for (Object donation : oList) {
			donationList.add((OrderVo) donation);
		}

		return donationList;
	} // getDonationDetail

	// getExpected
	public int getExpected(int c_id) {
		return sqlSession.selectOne("com.uniquegames.orderMapper.getExpected", c_id);
	} // getExpected

	// getTotalDonation
	public int getTotalDonation(int c_id) {
		return sqlSession.selectOne("com.uniquegames.orderMapper.getTotalDonation", c_id);
	} // getTotalDonation

	// getDonationRank
	public ArrayList<OrderVo> getDonationRank(int c_id) {
		List<Object> oList = sqlSession.selectList("com.uniquegames.orderMapper.getDonationRank", c_id);
		ArrayList<OrderVo> rankList = new ArrayList<OrderVo>();

		for (Object donator : oList) {
			rankList.add((OrderVo) donator);
		}

		return rankList;
	} // getDonationRank
}
