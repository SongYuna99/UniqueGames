package com.uniquegames.service;

import java.util.ArrayList;

import com.uniquegames.vo.NoticeVo;

public interface NoticeService {
	
	public ArrayList<NoticeVo> getSelect(int startCount, int endCount);
	
	public int getTotRowCount();
}
