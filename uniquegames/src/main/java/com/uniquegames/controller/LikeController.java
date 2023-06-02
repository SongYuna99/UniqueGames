package com.uniquegames.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.LikeInfoDao;

public class LikeController {
	
	private final LikeInfoDao likeInfoDao;
	
	@Autowired
	public LikeController(LikeInfoDao likeInfoDao) {
		this.likeInfoDao = likeInfoDao;
	}
	@RequestMapping(value="/like", method=RequestMethod.POST)
    public ModelAndView handleLikeRequest(@RequestParam("gameId") int gameId, HttpSession session) {
        ModelAndView model = new ModelAndView();
        /*
        MemberVo member = (MemberVo) session.getAttribute("member");
        if (member == null) {
            com.uniquegames.model.setViewName("redirect:/login");
            return com.uniquegames.model;
        }

        int memberId = member.getId();

        boolean hasLiked = likeInfoDao.hasLiked(memberId, gameId);

        if (hasLiked) {
            likeInfoDao.removeLikeInfo(memberId, gameId);
            com.uniquegames.model.addObject("message", "좋아요가 취소되었습니다.");
        } else {
            likeInfoDao.addLikeInfo(memberId, gameId);
            com.uniquegames.model.addObject("message", "좋아요가 추가되었습니다.");
        }
        com.uniquegames.model.setViewName("redirect:/game/details?gameId=" + gameId);*/
        return model;
    }
}
