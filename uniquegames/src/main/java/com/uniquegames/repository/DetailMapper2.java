package com.uniquegames.repository;

import com.uniquegames.vo.IntroVo;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;


/**
 *  스프링 마이바티스 방법2
 *  인터페이스의 메소드위에 직접 쿼리를 작성하여 매핑
 *  매퍼(xml파일) 필요x
 */
@Repository
public interface DetailMapper2 {
    @Insert("INSERT INTO intro (name,title, content,upload)"
            + " VALUES ( #{name}, #{title}, #{content},#{upload})")
    void insertIntro(IntroVo vo);
    IntroVo getIntro(int id);
    void updateIntro(IntroVo vo);
    void deleteIntro(int id);
    List<IntroVo> getIntroList();
}
