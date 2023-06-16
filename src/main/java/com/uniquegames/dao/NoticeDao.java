package com.uniquegames.dao;

public class NoticeDao extends DBConn {

	/**
	 * totRowCount - 페이징 처리용 전체 컬럼 수
	 */
	public int totRowCount(String keyword) {
		int result = 0;
		String sql = "";
		if (keyword.equals("list")) {
			sql = "SELECT COUNT(*) FROM NOTICE";

		} else {
			sql = "SELECT COUNT(*) FROM NOTICE WHERE TITLE LIKE CONCAT('%', ?, '%')";

		}
		getPreparedStatement(sql);

		try {
			if (!keyword.equals("list")) {
				pstmt.setString(1, keyword);

			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);

			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}
	
	/**
	 * 댓글 개수 표시용
	 */
	public int getCmtCount(int no) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM COMMENT WHERE POST_ID = ?";
		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);

			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

}
