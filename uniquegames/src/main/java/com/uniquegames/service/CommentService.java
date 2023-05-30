package com.uniquegames.service;

import java.util.ArrayList;

import com.uniquegames.vo.CommentVo;

public interface CommentService {

	public int commentInsert(CommentVo commentVo);
	
	public ArrayList<CommentVo> select(String no);
	
	public void delete(String no);
}
