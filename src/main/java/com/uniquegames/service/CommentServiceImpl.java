package com.uniquegames.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uniquegames.dao.CommentDao;
import com.uniquegames.repository.NoticeMapper;
import com.uniquegames.vo.CommentVo;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	NoticeMapper noticeMapper;

	/**
	 * 댓글 - 작성
	 */
	@Override
	public int commentInsert(CommentVo commentVo) {

		commentVo.setComment_content(commentVo.getComment_content().replaceAll("\r\n", "<br>"));

		return noticeMapper.insertComment(commentVo);
	}

	/**
	 * 댓글 - 페이지별 댓글 전체 리스트
	 */
	@Override
	public ArrayList<CommentVo> select(String no) {

		return noticeMapper.selectComment(no);
	}
	
	/**
	 * 댓글 - 삭제
	 */
	@Override
	public String delete(String no) {
		String result = "FAIL";
		int dbResult = noticeMapper.deleteComment(no);
		
		if (dbResult == 1) {
			result = "SUCCESS";
		}
		
		return result;
	}

}
