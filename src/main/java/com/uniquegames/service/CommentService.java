package com.uniquegames.service;

import java.util.List;

import com.uniquegames.vo.CommentVo;

public interface CommentService {

	public String commentInsert(CommentVo commentVo);
	
	public List<CommentVo> select(String no);
	
	public String delete(String no);
}
