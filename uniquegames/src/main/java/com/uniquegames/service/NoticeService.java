package com.uniquegames.service;

import java.util.ArrayList;
import java.util.Map;

import com.uniquegames.vo.NoticeVo;

public interface NoticeService {
	
	public ArrayList<NoticeVo> getNoticeList(int startCount, int endCount);
	
	public int getTotRowCount();
	
	public NoticeVo getNoticeContent(String no);
	
	public int insert(NoticeVo noticeVo);
	
	public int update(NoticeVo noticeVo);
	
	public int delete(String no);
}
