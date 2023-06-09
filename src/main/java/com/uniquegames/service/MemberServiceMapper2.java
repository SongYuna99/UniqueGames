package com.uniquegames.service;

import com.uniquegames.repository.MemberRepositoryMapper;
import com.uniquegames.vo.IntroVo;
import com.uniquegames.vo.MemberVo;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceMapper2 {

    @Autowired
    MemberRepositoryMapper memberRepositoryMapper;

//    public void insertIntro(IntroVo vo) {
//        memberRepositoryMapper.insertIntro(vo);
//    }
//
//    public void updateIntro(IntroVo vo) {
//        memberRepositoryMapper.updateIntro(vo);
//    }
//
//    public void deleteIntro(int id) {
//        memberRepositoryMapper.deleteIntro(id);
//    }
    public MemberVo findById(String member_id){
        return memberRepositoryMapper.findById(member_id);
    }
    public List<MemberVo> findAll() {
        return memberRepositoryMapper.findAll();
    }

}
