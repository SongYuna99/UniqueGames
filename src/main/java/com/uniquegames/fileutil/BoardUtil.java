package com.uniquegames.fileutil;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.uniquegames.dao.NoticeDao;
import com.uniquegames.vo.NoticeVo;

public class BoardUtil {

	/**
	 * 페이징 처리 유틸
	 * 
	 * @param page
	 * @return Map<String, Integer>
	 */
	public static Map<String, Integer> getPagination(String page, String keyword) {
		NoticeDao noticeDao = new NoticeDao();
		Map<String, Integer> result = new HashMap<String, Integer>();

		int startCount = 0;
		int endCount = 0;
		int pageSize = 10; // 한페이지당 게시물 수
		int reqPage = 1; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = 0; // DB에서 가져온 전체 행수

		if (keyword.equals("list")) {
			dbCount = noticeDao.totRowCount("list");

		} else {
			dbCount = noticeDao.totRowCount(keyword);

		}

		// 총 페이지 수 계산
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// 요청 페이지 계산
		if (page != null) {
			reqPage = Integer.parseInt(page);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else {
			startCount = 1;
			endCount = pageSize;
		}

		result.put("startCount", startCount);
		result.put("endCount", endCount);
		result.put("pageSize", pageSize);
		result.put("reqPage", reqPage);
		result.put("pageCount", pageCount);
		result.put("dbCount", dbCount);

		return result;
	}
	
	public static List<NoticeVo> getDateOutput(List<NoticeVo> result) {		
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
	
	public static NoticeVo fileUtil(HttpServletRequest request, NoticeVo noticeVo) throws Exception {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";
		
		if (noticeVo.getFile() != null && !noticeVo.getFile().isEmpty()) {

			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String upload_file = noticeVo.getFile().getOriginalFilename();
			String image_id = uuid + upload_file;

			noticeVo.setUpload_file(upload_file);
			noticeVo.setImage_id(image_id);

			File saveFile = new File(root_path + attach_path + noticeVo.getImage_id());
			noticeVo.getFile().transferTo(saveFile);
		}

		return noticeVo;
	}
}
