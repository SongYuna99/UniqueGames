package com.uniquegames.service;

import com.uniquegames.dao.IntroDao;
import com.uniquegames.vo.IntroVo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    IntroDao introDao;

    @Override
    public void insertIntro(IntroVo vo) {
        introDao.insertIntro(vo);
    }

    @Override
    public void updateIntro(IntroVo vo) {
        introDao.updateIntro(vo);
    }

    @Override
    public void deleteIntro(IntroVo vo) {
        introDao.deleteIntro(vo);
    }

    @Override
    public IntroVo getIntro(int companyId) {
        return introDao.getIntro(companyId);
    }

    @Override
    public List<IntroVo> getIntroList() {
        return introDao.getGameList();
    }
}
