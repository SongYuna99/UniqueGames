package com.uniquegames.controller;

import javax.servlet.http.HttpSession;

import com.uniquegames.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.LikeInfoDao;

@Controller
public class LikeController {

    private final LikeInfoDao likeInfoDao;

    @Autowired
    public LikeController(LikeInfoDao likeInfoDao) {
        this.likeInfoDao = likeInfoDao;
    }

    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public ModelAndView handleLikeRequest(@RequestParam("gameId") int gameId, HttpSession session) {
        ModelAndView model = new ModelAndView();
        MemberVo member = (MemberVo) session.getAttribute("member");
        if (member == null) {
            model.setViewName("redirect:/login");
            return model;
        }

        int memberId = member.getId();

        boolean hasLiked = likeInfoDao.hasLiked(memberId, gameId);

        if (hasLiked) {
            likeInfoDao.removeLikeInfo(memberId, gameId);
            model.addObject("message", "좋아요가 취소되었습니다.");
        } else {
            likeInfoDao.addLikeInfo(memberId, gameId);
            model.addObject("message", "좋아요가 추가되었습니다.");
        }

        model.setViewName("redirect:/game/details?gameId=" + gameId);
        return model;
    }
}