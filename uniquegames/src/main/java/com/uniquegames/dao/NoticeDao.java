package com.uniquegames.dao;

import java.util.ArrayList;

import com.uniquegames.vo.NoticeVo;

public class NoticeDao extends DBConnBoard {

	/**
	 * select - 전체 리스트 조회
	 */
	public ArrayList<NoticeVo> select(int startCount, int endCount) {
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();

		String sql = "SELECT * FROM (SELECT @ROWNUM:= @ROWNUM + 1 AS RNO, POST_ID, TITLE, CONTENT, COMPANY_ID, NOTICE_HITS, CAST( DATE_FORMAT( NOTICE_DATE, '%Y-%m-%d %H:%i:%s' ) AS CHAR(19) ) AS NOTICE_DATE\r\n" + 
				" FROM (SELECT POST_ID, TITLE, CONTENT, COMPANY_ID, NOTICE_HITS, NOTICE_DATE FROM NOTICE ORDER BY NOTICE_DATE DESC) SUB, (SELECT @ROWNUM:=0) TMP) T1 \r\n" + 
				" WHERE RNO between ? AND ?";

		getPreparedStatment(sql);

		try {
			
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				NoticeVo noticeVo = new NoticeVo();
				noticeVo.setRno(rs.getInt(1));
				noticeVo.setPost_id(rs.getInt(2));
				noticeVo.setTitle(rs.getString(3));
				noticeVo.setContent(rs.getString(4));
				noticeVo.setCompany_id(rs.getString(5));
				noticeVo.setNotice_hits(rs.getInt(6));
				noticeVo.setNotice_date(rs.getTimestamp(7));

				list.add(noticeVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * select - 공지사항 상세 보기
	 */
	public NoticeVo select(String no) {
		NoticeVo result = new NoticeVo();

		String sql = "SELECT POST_ID, COMPANY_ID, TITLE, CONTENT, NOTICE_HITS, CAST( DATE_FORMAT( NOTICE_DATE, '%Y-%m-%d %H:%i:%s' ) AS CHAR(19) ) AS NOTICE_DATE "
				+ " FROM NOTICE WHERE POST_ID = ?";
		getPreparedStatment(sql);

		try {

			pstmt.setString(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result.setPost_id(rs.getInt(1));
				result.setCompany_id(rs.getString(2));
				result.setTitle(rs.getString(3));
				result.setContent(rs.getString(4));
				result.setNotice_hits(rs.getInt(5));
				result.setNotice_date(rs.getTimestamp(6));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * insert - 공지사항 작성
	 */
	public int insert(NoticeVo noticeVo) {
		int result = 0;

		String sql = "INSERT INTO NOTICE (COMPANY_ID, TITLE, CONTENT, NOTICE_HITS, NOTICE_DATE) "
				+ " VALUES ('test', ?, ?, 0, NOW())";
		getPreparedStatment(sql);

		try {

			pstmt.setString(1, noticeVo.getTitle());
			pstmt.setString(2, noticeVo.getContent());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * update - 공지사항 수정
	 */
	public int update(NoticeVo noticeVo) {
		int result = 0;

		String sql = "UPDATE NOTICE SET TITLE = ?, CONTENT = ? WHERE POST_ID = ?";
		getPreparedStatment(sql);

		try {

			pstmt.setString(1, noticeVo.getTitle());
			pstmt.setString(2, noticeVo.getContent());
			pstmt.setInt(3, noticeVo.getPost_id());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * delete - 공지사항 삭제
	 */
	public int delete(String no) {
		int result = 0;

		String sql = "DELETE FROM NOTICE WHERE POST_ID = ?";
		getPreparedStatment(sql);

		try {

			pstmt.setString(1, no);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * hitCount - 조회수 증가
	 */
	public void hitsCount(String no) {

		String sql = "UPDATE NOTICE SET NOTICE_HITS = NOTICE_HITS + 1 WHERE POST_ID = ?";
		getPreparedStatment(sql);

		try {

			pstmt.setString(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * totRowCount - 페이징 처리용 전체 컬럼 수
	 */
	public int totRowCount() {
		int result = 0;
		
		String sql = "select count(*) from notice";
		getPreparedStatment(sql);
		
		try {
			
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
