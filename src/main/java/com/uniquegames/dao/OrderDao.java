package com.uniquegames.dao;

import java.util.ArrayList;
import java.util.List;

import com.uniquegames.vo.OrderVo;

public class OrderDao extends DBConn{
	// http://localhost:9000/uniquegames/cart.do?m_id=1
	/** Cart **/
	// getCartList
	public ArrayList<OrderVo> getCartList(int m_id) {
		ArrayList<OrderVo> cartList = new ArrayList<OrderVo>();

		if (getCartCount(m_id) != 0) {
			StringBuffer sql = new StringBuffer(100);
			sql.append("SELECT ID, G_ID, GAME_IMG, GAMETITLE, AMOUNT ");
			sql.append("FROM ORDERS WHERE PAYMENT_STATUS = 'NOT' AND M_ID = ?");
			getPreparedStatement(sql.toString());

			try {
				pstmt.setInt(1, m_id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					OrderVo cart = new OrderVo();

					cart.setId(rs.getInt(1));
					cart.setG_id(rs.getInt(2));
					cart.setGame_img(rs.getString(3));
					cart.setGametitle(rs.getString(4));
					cart.setAmount(rs.getInt(5));

					cartList.add(cart);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			cartList = null;
		}

		return cartList;
	} // getCartList

	// getCartCount
	public int getCartCount(int m_id) {
		int result = 0;
		StringBuffer sql = new StringBuffer(100);
		sql.append("SELECT COUNT(G_ID) FROM ORDERS ");
		sql.append("WHERE PAYMENT_STATUS = 'NOT' AND M_ID = ? ");

		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getCartCount

	// getCartDeleteAll
	public int getCartDeleteAll(int m_id) {
		int result = 0;
		StringBuffer sql = new StringBuffer(100);
		sql.append("DELETE FROM ORDERS ");
		sql.append("WHERE PAYMENT_STATUS = 'NOT' AND M_ID = ? ");
		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, m_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getCartDeleteAll

	// getCartDeleteOne
	public int getCartDeleteOne(int id) {
		int result = 0;
		StringBuffer sql = new StringBuffer(100);
		sql.append("DELETE FROM ORDERS ");
		sql.append("WHERE ID = ? ");
		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getCartDeleteOne

	/** Order **/
	// getOrderList
	public ArrayList<OrderVo> getOrderList(List<Integer> checkedList) {
		ArrayList<OrderVo> orderList = new ArrayList<OrderVo>();

		StringBuffer sql = new StringBuffer(100);
		sql.append("SELECT ID, G_ID, GAME_IMG, GAMETITLE, AMOUNT ");
		sql.append("FROM ORDERS WHERE ID = ?");
		getPreparedStatement(sql.toString());

		try {
			for (int i = 0; i < checkedList.size(); i++) {
				pstmt.setInt(1, checkedList.get(i));
				rs = pstmt.executeQuery();

				while (rs.next()) {
					OrderVo cart = new OrderVo();

					cart.setRno(i + 1);
					cart.setId(rs.getInt(1));
					cart.setG_id(rs.getInt(2));
					cart.setGame_img(rs.getString(3));
					cart.setGametitle(rs.getString(4));
					cart.setAmount(rs.getInt(5));

					orderList.add(cart);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderList;
	} // getCartList

	// getOrderAmount
	public int getOrderAmount(ArrayList<Integer> list) {
		int result = 0;

		StringBuffer sql = new StringBuffer(100);
		sql.append("SELECT AMOUNT FROM ORDERS WHERE ID = ?");
		getPreparedStatement(sql.toString());

		try {
			for (int i = 0; i < list.size(); i++) {
				pstmt.setInt(1, list.get(i));
				rs = pstmt.executeQuery();

				while (rs.next()) {
					result += rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getOrderAmount

	// getOrderComplete
	public int getOrderComplete(ArrayList<Integer> list, String method) {
		int result = 0;

		StringBuffer sql = new StringBuffer(100);
		sql.append("UPDATE ORDERS SET PAYMENT_STATUS = 'COMPLETE', ");
		sql.append("ORDER_DATE = NOW(), METHOD = ?");
		sql.append("WHERE ID = ?");
		getPreparedStatement(sql.toString());

		try {
			for (int i = 0; i < list.size(); i++) {
				pstmt.setString(1, method);
				pstmt.setInt(2, list.get(i));
				result = pstmt.executeUpdate();

				if (result == 0) {
					i = list.size();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getOrderComplete

	// getPaymentDetail
	public ArrayList<OrderVo> getPaymentDetail(int m_id, String array) {
		ArrayList<OrderVo> paymentList = new ArrayList<OrderVo>();

		StringBuffer sql = new StringBuffer(100);
		if (array.equals("orderdate_desc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY ORDER_DATE DESC) AS RNO, ");
		} else if (array.equals("orderdate_asc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY ORDER_DATE ASC) AS RNO, ");
		} else if (array.equals("amount_desc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY AMOUNT ASC) AS RNO, ");
		} else if (array.equals("amount_asc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY AMOUNT DESC) AS RNO, ");
		}
		sql.append("DATE_FORMAT(ORDER_DATE, '%y-%m-%d') ORDER_DATE, GAMETITLE, AMOUNT FROM ORDERS ");
		sql.append("WHERE M_ID = ? AND PAYMENT_STATUS = 'COMPLETE' ");
		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVo payment = new OrderVo();

				payment.setRno(rs.getInt(1));
				payment.setOrderdate(rs.getString(2));
				payment.setGametitle(rs.getString(3));
				payment.setAmount(rs.getInt(4));

				paymentList.add(payment);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return paymentList;
	} // getPaymentDetail

	// getPaymentCount
	public int getPaymentCount(int m_id) {
		int result = 0;
		StringBuffer sql = new StringBuffer(100);
		sql.append("SELECT COUNT(*) FROM ORDERS WHERE M_ID = ? ");
		sql.append("AND PAYMENT_STATUS = 'COMPLETE'");
		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getPaymentCount

	// getPaymentAmount
	public int getPaymentAmount(int m_id) {
		int result = 0;
		StringBuffer sql = new StringBuffer(100);
		sql.append("SELECT SUM(AMOUNT) FROM ORDERS WHERE M_ID = ? ");
		sql.append("AND PAYMENT_STATUS = 'COMPLETE'");
		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // getPaymentAmount
	
	// getPaymentDetail
	public ArrayList<OrderVo> getDonationDetail(int c_id, String array) {
		ArrayList<OrderVo> donationList = new ArrayList<OrderVo>();

		StringBuffer sql = new StringBuffer(100);
		if (array.equals("orderdate_desc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY DATE_FORMAT(ORDER_DATE, '%y-%m') DESC) AS RNO, ");
		} else if (array.equals("orderdate_asc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY DATE_FORMAT(ORDER_DATE, '%y-%m') ASC) AS RNO, ");
		} else if (array.equals("amount_desc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY SUM(AMOUNT) DESC) AS RNO, DATE_FORMAT(ORDER_DATE, '%y-%m') ORDER_DATE, ");
		} else if (array.equals("amount_asc")) {
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY SUM(AMOUNT) ASC) AS RNO, DATE_FORMAT(ORDER_DATE, '%y-%m') ORDER_DATE, ");
		}
		sql.append("DATE_FORMAT(ORDER_DATE, '%y-%m') ORDER_DATE, GAMETITLE, SUM(AMOUNT) AMOUNT FROM ORDERS ");
		sql.append("WHERE C_ID = ? AND PAYMENT_STATUS = 'COMPLETE' ");
		sql.append("GROUP BY DATE_FORMAT(ORDER_DATE, '%y-%m'), GAMETITLE ");
		getPreparedStatement(sql.toString());

		try {
			pstmt.setInt(1, c_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVo donation = new OrderVo();

				donation.setRno(rs.getInt(1));
				donation.setOrderdate(rs.getString(2));
				donation.setGametitle(rs.getString(3));
				donation.setAmount(rs.getInt(4));

				donationList.add(donation);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return donationList;
	} // getPaymentDetail
}
