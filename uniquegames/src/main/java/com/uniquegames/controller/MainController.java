package com.uniquegames.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.uniquegames.dao.LikeInfoDao;
import com.uniquegames.vo.MemberVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.GameDao;
import com.uniquegames.vo.GameVo;

@Controller
public class MainController {
	
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		GameDao gameDao = new GameDao();
		LikeInfoDao likeInfoDao = new LikeInfoDao();
		List<GameVo> gameVo = gameDao.getGameList();
		ArrayList<GameVo> donation = gameDao.select_donation();
		ArrayList<GameVo> ranking = gameDao.select_ranking();
		
		int like_cnt = 0;
        
        HttpSession session = request.getSession();
        MemberVo member = (MemberVo) session.getAttribute("member");
       if (member != null) {
           int mid = member.getId();
           like_cnt = gameDao.select_like(mid);
            for (GameVo vo : gameVo) {
                int gid = vo.getId();
				boolean liked = likeInfoDao.hasLiked(mid, gid);
            }
        }
        
        model.addObject("ranking", ranking);
        model.addObject("donation", donation);
        model.addObject("gameVo", gameVo);
        model.addObject("like_cnt", like_cnt);
        model.setViewName("/main/index");
        
        return model;
	}
	
	@RequestMapping(value="/alllist.do", method=RequestMethod.GET)
	public ModelAndView alllist() {
		ModelAndView model = new ModelAndView();
		GameDao gameDao = new GameDao();
		List<GameVo> gameVo = gameDao.getGameList();
		
		model.addObject("gameVo", gameVo);
		model.setViewName("/main/allList");
		
		return model;
	}
	
	@RequestMapping(value="/topgame.do", method=RequestMethod.GET)
	public ModelAndView topgame() {
		ModelAndView model = new ModelAndView();
		GameDao gameDao = new GameDao();
		ArrayList<GameVo> ranking = gameDao.select_ranking(); 
		
		model.addObject("ranking", ranking);
		model.setViewName("/main/topGame");
		
		return model;
	}
	
}  
