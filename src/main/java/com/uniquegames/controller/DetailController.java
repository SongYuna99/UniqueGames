package com.uniquegames.controller;

import com.uniquegames.service.CompanyServiceImpl;
import com.uniquegames.vo.IntroVo;
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author jeonb 
 * 회사 소개 페이지 컨트롤러
 * CRUD 메소드 구현
 */
public class DetailController {
//    @ModelAttribute("conditonMap")
//    public Map<String,String> searchConditionMap(){
//        Map<String, String> conditionMap = new HashMap<>();
//        conditionMap.put("제목", "TITLE");
//        conditionMap.put("내용", "CONTENT");
//        return conditionMap;
//    }

    /**
     * 서비스 객체 의존성 주입
     */
    @Autowired
    private CompanyServiceImpl companyServiceImpl;

    /**
     * @param companyId 회사 소개글 인덱스
     * @return 회사 상세페이지 리턴
     */
    @RequestMapping(value = "/{companyId}",method = RequestMethod.GET)
    public String goDetail(@PathVariable int companyId) {
        companyServiceImpl.getIntro(companyId);
        return "detail/detail";
    }

    /**
     * @param companyId 회사 소개글 인덱스
     * @return 회사 소개페이지 리턴
     */
/*    @RequestMapping(value = "/{companyId}", method = RequestMethod.POST)
    public String goCompany(@PathVariable int companyId) {
        companyServiceImpl.getIntro(companyId);
        return "detail/company";
    }*/

    /**
     * @param vo 회사소개 저장객체
     * @return
     * @throws IOException 예외처리
     */
//    @RequestMapping(value = "/insertIntro.do",method = RequestMethod.GET)
//    public String insertIntro(IntroVo vo) throws IOException {
//        System.out.println("글 등록 처리");
//
//        return "detail/company_regi";
//
//    }

    @RequestMapping(value = "/insertIntro.do")
    public String insertIntro(IntroVo vo) throws IOException {
        System.out.println("글 등록 처리");
        //파일 업로드 처리
        MultipartFile uploadFile = vo.getUploadFile();

        if(uploadFile!=null && !uploadFile.isEmpty()){
            String fileName = uploadFile.getOriginalFilename();
            uploadFile.transferTo(new File("C:/Users/jeon/Desktop" + fileName));
        }
//        if(vo.getTitle().equals("")){
//            throw new IllegalArgumentException("제목은 반드시 입력해야 합니다.");
//        }

        if(vo.getName() == null)
            return "detail/company_regi";
        else{
            companyServiceImpl.insertIntro(vo);
            return "redirect:main/allList";
        }

    }
    @RequestMapping(value = "/updateIntro.do")
    public void updateIntro(IntroVo vo){
        companyServiceImpl.updateIntro(vo);
    }

    @RequestMapping(value = "/deleteIntro.do")
    public void deleteIntro(IntroVo vo){
        companyServiceImpl.deleteIntro(vo);
    }

//    @RequestMapping(value = "/searchIntro")
//    public IntroVo searchIntro(IntroVo vo){
//        IntroVo company = new IntroVo();
//        System.out.println("게임 검색");
//        company = companyServiceImpl.getIntro(vo);
//        return company;
//    }

    @RequestMapping(value = "/searchIntroList.do")
    public List<IntroVo> searchIntroList(){
        return companyServiceImpl.getIntroList();
    }
}
