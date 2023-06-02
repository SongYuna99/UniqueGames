package com.uniquegames.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uniquegames.vo.NoticeVo;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NAMESPACE = "com.uniquegames.noticeMapper";

	/**
	 * select - 전체 리스트 조회
	 */
	public ArrayList<NoticeVo> select(int startCount, int endCount) {

		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<NoticeVo> list = sqlSession.selectList(NAMESPACE + ".selectNotice", param);

		return (ArrayList<NoticeVo>) list;
	}

	/**
	 * select - 공지사항 상세 보기
	 */
	public NoticeVo select(String no) {

		return sqlSession.selectOne(NAMESPACE + ".content", no);
	}

	/**
	 * insert - 공지사항 작성
	 */
	public int insert(NoticeVo noticeVo) {

		return sqlSession.insert(NAMESPACE + ".insertNotice", noticeVo);
	}

	/**
	 * update - 공지사항 수정
	 */
	public int update(NoticeVo noticeVo) {

		return sqlSession.update(NAMESPACE + ".updateNotice", noticeVo);
	}

	/**
	 * delete - 공지사항 삭제
	 */
	public int delete(String no) {

		return sqlSession.delete(NAMESPACE + ".delete", no);
	}
	
	/**
	 * deleteList - 공지사항 리스트 선택 삭제
	 */
	public int deleteList(String[] list) {
		
		return sqlSession.delete(NAMESPACE + ".deleteList", list);
	}

	/**
	 * hitCount - 조회수 증가
	 */
	public void hitsCount(String no) {

		sqlSession.update(NAMESPACE + ".hitsCount", no);
	}

	/**
	 * totRowCount - 페이징 처리용 전체 컬럼 수
	 */
	public int totRowCount() {

		return sqlSession.selectOne(NAMESPACE + ".totRowCount");
	}

	/**
	 * 파일 저장
	 */
	public int insertFile(NoticeVo noticeVo) {

		return sqlSession.insert(NAMESPACE + ".insertFile", noticeVo);
	}

	/**
	 * 파일 업데이트
	 */
	public int updateFile(NoticeVo noticeVo) {

		return sqlSession.update(NAMESPACE + ".updateFile", noticeVo);
	}

	/**
	 * 파일 업데이트 - 파일 없을 때 저장
	 */
	public int update_insertFile(NoticeVo noticeVo) {

		return sqlSession.insert(NAMESPACE + ".updateUploadFile", noticeVo);
	}

	/**
	 * 파일 있는지 체크
	 */
	public int fileCheck(NoticeVo noticeVo) {

		return sqlSession.selectOne(NAMESPACE + ".fileCheck", noticeVo);
	}

}
