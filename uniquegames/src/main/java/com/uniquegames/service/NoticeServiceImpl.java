package com.uniquegames.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.uniquegames.dao.NoticeDao;
import com.uniquegames.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	NoticeDao noticeDao = new NoticeDao();

	@Override
	public ArrayList<NoticeVo> getSelect(int startCount, int endCount) {
		ArrayList<NoticeVo> result = noticeDao.select(startCount, endCount);

		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM.dd");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

		String date_output = "";

		LocalDateTime now = LocalDateTime.now();
		int currentYear = now.getYear();
		int currentMonth = now.getMonthValue();
		int currentDay = now.getDayOfMonth();

		for (NoticeVo nvo : result) {
			LocalDateTime dbDateTime = nvo.getNotice_date().toInstant().atZone(ZoneId.systemDefault())
					.toLocalDateTime();
			int dbYear = dbDateTime.getYear();
			int dbMonth = dbDateTime.getMonthValue();
			int dbDay = dbDateTime.getDayOfMonth();

			if (dbYear == currentYear && dbMonth == currentMonth && dbDay == currentDay) {
				// 날짜가 현재 날짜와 일치하는 경우, 시간만 출력
				String formattedTime = dbDateTime.format(timeFormatter);
				date_output = formattedTime;
			} else {
				// 날짜가 현재 날짜와 일치하지 않는 경우, 날짜만 출력
				String formattedDate = dbDateTime.format(dateFormatter);
				date_output = formattedDate;
			}
			// date_output 변수를 사용하여 필요한 작업 수행
			nvo.setDate_output(date_output);
		}

		return result;
	}

	@Override
	public int getTotRowCount() {

		return noticeDao.totRowCount();
	}
}
