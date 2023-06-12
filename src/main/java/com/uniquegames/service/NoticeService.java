package com.uniquegames.service;

import java.util.ArrayList;

import com.uniquegames.vo.NoticeVo;

public interface NoticeService {
	
	public ArrayList<NoticeVo> getNoticeList(int startCount, int endCount);
	
	public NoticeVo getNoticeContent(String stat, String no);
	
	public int insert(NoticeVo noticeVo);
	
	public int update(NoticeVo noticeVo);
	
	public int delete(String no);
	
	public int deleteList(String[] list);
	
	public Object search(String keyWord, int startCount, int endCount);
	
}
