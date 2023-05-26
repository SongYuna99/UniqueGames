package com.uniquegames.vo;

public class OrderVo {
	// Field
		String orderdate, method, payment_status, gametitle, game_img;
		int id, m_id, c_id, g_id, amount;

		// Method
		public String getOrderdate() {
			return orderdate;
		}

		public void setOrderdate(String orderdate) {
			this.orderdate = orderdate;
		}

		public String getMethod() {
			return method;
		}

		public void setMethod(String method) {
			this.method = method;
		}

		public String getPayment_status() {
			return payment_status;
		}

		public void setPayment_status(String payment_status) {
			this.payment_status = payment_status;
		}

		public String getGametitle() {
			return gametitle;
		}

		public void setGametitle(String gametitle) {
			this.gametitle = gametitle;
		}

		public String getGame_img() {
			return game_img;
		}

		public void setGame_img(String game_img) {
			this.game_img = game_img;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getM_id() {
			return m_id;
		}

		public void setM_id(int m_id) {
			this.m_id = m_id;
		}

		public int getC_id() {
			return c_id;
		}

		public void setC_id(int c_id) {
			this.c_id = c_id;
		}

		public int getG_id() {
			return g_id;
		}

		public void setG_id(int g_id) {
			this.g_id = g_id;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}
}
