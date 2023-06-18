package com.uniquegames.controller;

import com.uniquegames.fileutil.FileUtil;
import com.uniquegames.model.SessionConstants;
import com.uniquegames.service.CompanyServiceMapper;
import com.uniquegames.service.CompanyServiceMapper2;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.IntroVo;
import com.uniquegames.vo.MemberVo;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author jeonb 
 * 회사 소개 페이지 Mybatis 컨트롤러
 * CRUD 메소드 구현
 */
@Controller
@SessionAttributes({"intro","status"})
@RequestMapping(value = "/detail")
public class DetailMapperController {


    private final CompanyServiceMapper companyServiceMapper;
    private final CompanyServiceMapper2 companyServiceMapper2;

    @Autowired
    public DetailMapperController(CompanyServiceMapper companyServiceMapper,
            CompanyServiceMapper2 companyServiceMapper2) {
        this.companyServiceMapper = companyServiceMapper; // 매퍼 방식
        this.companyServiceMapper2 = companyServiceMapper2; // 인터페이스 only
    }

    /** goDetail()
     * @return 회사 상세페이지 리턴
     */
    @RequestMapping(value = {"/detail1.do", "/detail2.do", "/detail3.do", "/detail4.do"}, method = RequestMethod.GET)
    public String goDetail(HttpServletRequest request) {
        String requestPath = request.getRequestURI().replaceFirst("/uniquegames/","");//최상단 컨텍스트(uniquegames)를 제외한 현재 요청 경로를 가져옴

        // 요청 경로에 따라 처리
        if (requestPath.equals("detail/detail1.do")) {
            return "detail/detail";
        } else if (requestPath.equals("detail/detail2.do")) {
            return "detail/detail2";
        } else if (requestPath.equals("detail/detail3.do")) {
            return "detail/detail3";
        } else if (requestPath.equals("detail/detail4.do")) {
            return "detail/detail4";
        }

        return "redirect:/";
    }


    /**
     * @param vo 회사 소개 저장객체
     * @param request 현재 url을 가져오기 위한 객체
     * @return 이름 또는 제목이 null이면 회사등록 페이지 리턴. 아니면 회사 목록 페이지 리턴
     * @throws IOException 입출력 예외 처리
     */
    @RequestMapping(value = "/insertIntro.do")
    public String insertIntro(IntroVo vo, HttpServletRequest request,Model model) throws IOException {

        FileUtil fileUtil = new FileUtil(vo, request);
        IntroVo introVo = fileUtil.getUpload();
        HttpSession session = request.getSession();
        Object loginMemberObj = session.getAttribute(SessionConstants.LOGIN_MEMBER);
        boolean isMemberVo = loginMemberObj instanceof MemberVo;
        if(!isMemberVo){
            if(introVo.getTitle() == null || introVo.getName() == null){

                CompanyVo company = (CompanyVo) session.getAttribute(SessionConstants.LOGIN_MEMBER);
                model.addAttribute("company",company);
                return "detail/company_regi";
            }
            else{

                companyServiceMapper2.insertIntro(introVo);
                model.addAttribute("status", "writeOnce");
                return "redirect:getIntroList.do";

            }
        }
        return "redirect:/";
    }
    @RequestMapping(value = "/updateIntro.do")
    public String updateIntro(@ModelAttribute("intro") IntroVo vo){
        companyServiceMapper.updateIntro(vo);
        return "redirect:getIntroList.do";
    }

    @RequestMapping(value = "/deleteIntro.do")
    public String deleteIntro(IntroVo vo){
        companyServiceMapper.deleteIntro(vo.getId());
        return "redirect:getIntroList.do";
    }

    @RequestMapping(value = "/getIntro.do")
    public String getIntro(Model model, IntroVo vo){
        model.addAttribute("intro",companyServiceMapper.getIntro(vo.getId()));
        return "detail/company";
    }
    @RequestMapping(value = "/getIntroList.do")
    public String getIntroList(Model model){
        model.addAttribute("companyList", companyServiceMapper.getIntroList());
        return "detail/company_list";
    }
}
