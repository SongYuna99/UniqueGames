package com.uniquegames.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uniquegames.vo.CommentVo;

@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NAMESPACE = "com.uniquegames.noticeMapper";

	/**
	 * 댓글 조회
	 */
	public ArrayList<CommentVo> select(String no) {

		List<CommentVo> list = sqlSession.selectList(NAMESPACE + ".selectComment", no);

		return (ArrayList<CommentVo>) list;
	}

	/**
	 * 댓글 작성
	 */
	public int insert(CommentVo commentVo) {

		return sqlSession.insert(NAMESPACE + ".insertComment", commentVo);
	}

	/**
	 * 댓글 삭제
	 */
	public int delete(String no) {

		return sqlSession.delete(NAMESPACE + ".deleteComment", no);
	}
}

