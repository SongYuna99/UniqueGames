package com.uniquegames.repository;

import com.uniquegames.vo.IntroVo;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 * 스프링 마이바티스 방법1
 * 매퍼(xml파일)과 매핑하여 리포지토리로 사용.
 * 기존 DAO필요 X
 */
@Repository
public interface DetailMapper {
    void insertIntro(IntroVo vo);
    IntroVo getIntro(int id);
    IntroVo getIntroTitle(String title);
    void updateIntro(IntroVo vo);
    void deleteIntro(int id);
    List<IntroVo> getIntroList();
}
