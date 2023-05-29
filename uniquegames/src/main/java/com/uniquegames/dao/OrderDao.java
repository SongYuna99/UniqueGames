package com.uniquegames.dao;

import java.util.ArrayList;
import java.util.List;

import com.uniquegames.vo.OrderVo;

public class OrderDao extends DBConnOrder {
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
			for(int i = 0; i<checkedList.size();i++) {
				pstmt.setInt(1, checkedList.get(i));
				rs = pstmt.executeQuery();

				while (rs.next()) {
					OrderVo cart = new OrderVo();

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
}
