package com.uniquegames.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uniquegames.dao.CommentDao;
import com.uniquegames.dao.NoticeDao;
import com.uniquegames.service.NoticeService;
import com.uniquegames.vo.CommentVo;
import com.uniquegames.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;

	/**
	 * notice-list.do 공지사항 - 전체 리스트
	 */
	@RequestMapping(value = "/notice_list.do", method = RequestMethod.GET)
	public ModelAndView noticeList(String page) {
		ModelAndView model = new ModelAndView();

		// 페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10; // 한페이지당 게시물 수
		int reqPage = 1; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = noticeService.getTotRowCount(); // DB에서 가져온 전체 행수

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

		ArrayList<NoticeVo> list = noticeService.getSelect(startCount, endCount);
		model.addObject("list", list);
		model.addObject("dbCount", dbCount);
		model.addObject("pageSize", pageSize);
		model.addObject("pageCount", pageCount);
		model.addObject("page", reqPage);

		model.setViewName("/board/board_list");

		return model;
	}

//	/**
//	 * notice-list-user.do ��ü ����Ʈ
//	 */
//	@RequestMapping(value = "/board-list-user.do", method = RequestMethod.GET)
//	public String noticeListUser() {
//		return "/board/board_list_user";
//	}

	/**
	 * notice_write.do 공지사항 - 작성
	 */
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String noticeWrite() {
		return "/board/board_write";
	}

	/**
	 * notice_write_proc.do 공지사항 - 작성 처리
	 */
	@RequestMapping(value = "/notice_write_proc.do", method = RequestMethod.POST)
	public String noticeWriteProc(NoticeVo noticeVo, RedirectAttributes attributes) {

		NoticeDao noticeDao = new NoticeDao();
		int result = noticeDao.insert(noticeVo);

		if (result == 1) {
			attributes.addFlashAttribute("result", "success");
		} else {
			attributes.addFlashAttribute("result", "fail");
		}

		return "redirect:/notice_list.do";
	}

	/**
	 * notice_content.do 공지사항 - 상세 보기
	 */
	@RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
	public ModelAndView noticeContent(String no) {
		ModelAndView model = new ModelAndView();
		NoticeDao noticeDao = new NoticeDao();
		CommentDao commentDao = new CommentDao();

		NoticeVo noticeVo = noticeDao.select(no);

		if (noticeVo != null) {
			noticeDao.hitCount(no);
			noticeVo.setNotice_hits(noticeVo.getNotice_hits() + 1);
		}

		ArrayList<CommentVo> commList = commentDao.select(no);

		model.addObject("noticeVo", noticeVo);
		model.addObject("commList", commList);
		model.setViewName("/board/board_content");

		return model;
	}

	/**
	 * notice_delete.do 공지사항 - 삭제
	 */
	@RequestMapping(value = "/notice_delete.do", method = RequestMethod.POST)
	public String noticeDelete(String no, RedirectAttributes attributes) {

		NoticeDao noticeDao = new NoticeDao();

		int result = noticeDao.delete(no);
		if (result == 1) {
			attributes.addFlashAttribute("result", "complete");
		} else {
			attributes.addFlashAttribute("result", "fail");
		}

		return "redirect:/notice_list.do";
	}

	/**
	 * notice_update.do 공지사항 - 수정
	 */
	@RequestMapping(value = "/notice_update.do", method = RequestMethod.GET)
	public ModelAndView noticeUpdate(String no) {
		ModelAndView model = new ModelAndView();
		NoticeDao noticeDao = new NoticeDao();

		NoticeVo noticeVo = noticeDao.select(no);

		model.addObject("noticeVo", noticeVo);
		model.setViewName("/board/board_update");

		return model;
	}

	/**
	 * notice_update_proc.do 공지사항 - 수정 처리
	 */
	@RequestMapping(value = "/notice_update_proc.do", method = RequestMethod.POST)
	public String noticeUpdateProc(NoticeVo noticeVo, RedirectAttributes attributes) {
		NoticeDao noticeDao = new NoticeDao();

		int result = noticeDao.update(noticeVo);
		if (result == 1) {
			attributes.addFlashAttribute("result", "success");
		} else {
			attributes.addFlashAttribute("result", "fail");
		}

		return "redirect:/notice_content.do?no=" + noticeVo.getPost_id();
	}

	/**
	 * comment_write_proc.do 댓글 - 작성 처리
	 */
	@RequestMapping(value = "comment_write_proc.do", method = RequestMethod.POST)
	public String commentWriteProc(CommentVo commentVo, RedirectAttributes attributes) {
		CommentDao commentDao = new CommentDao();
		
		commentVo.setComment_content(commentVo.getComment_content().replaceAll("\r\n", "<br>"));
		int result = commentDao.insert(commentVo);
		if (result == 1) {
			attributes.addFlashAttribute("cmtresult", "success");
		} else {
			attributes.addFlashAttribute("cmtresult", "fail");
		}

		return "redirect:/notice_content.do?no=" + commentVo.getPost_id();
	}

}
