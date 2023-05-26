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

	/**
	 * 공지사항 - 전체 리스트 조회
	 */
	@Override
	public ArrayList<NoticeVo> getNoticeList(int startCount, int endCount) {
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

	/**
	 * 공지사항 - 전체 컬럼 수(페이징)
	 */
	@Override
	public int getTotRowCount() {

		return noticeDao.totRowCount();
	}

	/**
	 * 공지사항 - 상세 보기
	 */
	@Override
	public NoticeVo getNoticeContent(String no) {
		NoticeVo noticeVo = noticeDao.select(no);

		if (noticeVo != null) {
			noticeDao.hitsCount(no);
			noticeVo.setNotice_hits(noticeVo.getNotice_hits() + 1);
		}

		return noticeVo;
	}

	/**
	 * 공지사항 - 작성
	 */
	@Override
	public int insert(NoticeVo noticeVo) {

		return noticeDao.insert(noticeVo);
	}

	/**
	 * 공지사항 - 수정
	 */
	@Override
	public int update(NoticeVo noticeVo) {

		return noticeDao.update(noticeVo);
	}
	
	/**
	 * 공지사항 - 삭제
	 */
	@Override
	public int delete(String no) {
		
		return noticeDao.delete(no);
	}

}
