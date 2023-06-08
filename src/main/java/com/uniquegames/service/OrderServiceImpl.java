package com.uniquegames.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uniquegames.dao.OrderDao;
import com.uniquegames.vo.OrderVo;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDao orderDao;

	@Override
	public ArrayList<OrderVo> getCartList(int m_id) {
		return orderDao.getCartList(m_id);
	}

	@Override
	public int getCartCount(int m_id) {
		return orderDao.getCartCount(m_id);
	}

	@Override
	public int getCartDeleteAll(int m_id) {
		return orderDao.getCartDeleteAll(m_id);
	}

	@Override
	public int getCartDeleteOne(int id) {
		return orderDao.getCartDeleteOne(id);
	}

	@Override
	public ArrayList<OrderVo> getOrderList(List<Integer> checkedList) {
		return orderDao.getOrderList(checkedList);
	}

	@Override
	public int getOrderAmount(List<Integer> checkedList) {
		return orderDao.getOrderAmount(checkedList);
	}

	@Override
	public int getOrderComplete(List<Integer> checkedList, String method) {
		return orderDao.getOrderComplete(checkedList, method);
	}

	@Override
	public ArrayList<OrderVo> getPaymentDetail(int m_id, String array) {
		return orderDao.getPaymentDetail(m_id, array);
	}

	@Override
	public int getPaymentCount(int m_id) {
		return orderDao.getPaymentCount(m_id);
	}

	@Override
	public int getPaymentAmount(int m_id) {
		return orderDao.getPaymentAmount(m_id);
	}

	@Override
	public ArrayList<OrderVo> getDonationDetail(int c_id, String array) {
		return orderDao.getDonationDetail(c_id, array);
	}

	@Override
	public int getExpected(int c_id) {
		return orderDao.getExpected(c_id);
	}

	@Override
	public int getTotalDonation(int c_id) {
		return orderDao.getTotalDonation(c_id);
	}

	@Override
	public ArrayList<OrderVo> getDonationRank(int c_id) {
		return orderDao.getDonationRank(c_id);
	}

}
