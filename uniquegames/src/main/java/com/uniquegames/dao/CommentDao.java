package com.uniquegames.dao;

import java.util.ArrayList;

import com.uniquegames.vo.CommentVo;

public class CommentDao extends DBConnBoard {

	/**
	 * 댓글 조회
	 */
	public ArrayList<CommentVo> select(String no) {
		ArrayList<CommentVo> result = new ArrayList<CommentVo>();

		String sql = "SELECT COMMENT_ID, POST_ID, MEMBER_ID, COMMENT_CONTENT, CAST( DATE_FORMAT( COMMENT_DATE, '%Y-%m-%d %H:%i:%s' ) AS CHAR(19) ) AS COMMENT_DATE FROM COMMENT "
				+ " WHERE POST_ID = ? ORDER BY COMMENT_DATE ASC";
		getPreparedStatment(sql);

		try {

			pstmt.setString(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVo coVo = new CommentVo();

				coVo.setComment_id(rs.getInt(1));
				coVo.setPost_id(rs.getInt(2));
				coVo.setMember_id(rs.getString(3));
				coVo.setComment_content(rs.getString(4));
				coVo.setComment_date(rs.getString(5));

				result.add(coVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 댓글 작성
	 */
	public int insert(CommentVo commentVo) {
		int result = 0;

		String sql = "INSERT INTO COMMENT (POST_ID, MEMBER_ID, COMMENT_CONTENT) VALUES (?, ?, ?)";
		getPreparedStatment(sql);

		try {

			pstmt.setInt(1, commentVo.getPost_id());
			pstmt.setString(2, commentVo.getMember_id());
			pstmt.setString(3, commentVo.getComment_content());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	/**
	 * 댓글 삭제
	 */
	public int delete(String no) {
		int result = 0;
		
		String sql = "DELETE FROM COMMENT WHERE COMMENT_ID = ?";
		getPreparedStatment(sql);
		
		try {
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
