package com.uniquegames.controller;

import com.uniquegames.fileutil.FileUtil;
import com.uniquegames.model.SessionConstants;
import com.uniquegames.repository.CompanyRepositoryMapper;
import com.uniquegames.service.CompanyServiceMapper;
import com.uniquegames.service.CompanyServiceMapper2;
import com.uniquegames.service.IndexServiceMapper;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.GameVo;
import com.uniquegames.vo.IntroVo;
import com.uniquegames.vo.MemberVo;
import com.uniquegames.vo.NoticeVo;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author jeonb 
 * 회사 소개 페이지 Mybatis 컨트롤러
 * CRUD 메소드 구현
 */
@Controller
@SessionAttributes({"intro","status","game","gameName","companyVo","list","noticeVo","company"})
@RequestMapping(value = "/detail")
public class DetailMapperController {


    private final CompanyServiceMapper companyServiceMapper;
    private final CompanyServiceMapper2 companyServiceMapper2;
    private final IndexServiceMapper indexServiceMapper;
    CompanyRepositoryMapper companyRepositoryMapper;

    @Autowired
    public DetailMapperController(CompanyServiceMapper companyServiceMapper,
            CompanyServiceMapper2 companyServiceMapper2, IndexServiceMapper indexServiceMapper, CompanyRepositoryMapper companyRepositoryMapper) {
        this.companyServiceMapper = companyServiceMapper; // 매퍼 방식
        this.companyServiceMapper2 = companyServiceMapper2; // 인터페이스 only
        this.indexServiceMapper = indexServiceMapper;
        this.companyRepositoryMapper = companyRepositoryMapper;
    }

    /** goDetail()
     * @return 회사 상세페이지 리턴
     */
    @RequestMapping(value = "/{detailId}.do", method = RequestMethod.GET)
    public String goDetail(@PathVariable("detailId") int detailId, Model model) {
        GameVo gameVo = indexServiceMapper.getGameForIndex(detailId);
        model.addAttribute("game", gameVo);
        CompanyVo companyVo = companyRepositoryMapper.findByIndex(detailId);
        model.addAttribute("companyVo", companyVo);
        // 요청된 detailId에 따라 해당 페이지로 이동
        switch (detailId) {
            case 1:
                return "detail/detail";
            case 2:
                return "detail/detail2";
            case 3:
                return "detail/detail3";
            case 4:
                return "detail/detail4";
            default:
                return "redirect:/";
        }
    }
//    @RequestMapping(value = "/{detailId}.do", method = RequestMethod.POST)
//    public void getCompanyId(@PathVariable("detailId") int detailId,@RequestParam("companyId") String companyId, Model model){
//        CompanyVo companyVo = companyRepositoryMapper.findById(companyId);
//        model.addAttribute("companyVo", companyVo);
//    }

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
//    @RequestMapping(value = "/updateIntro.do")
//    public String updateIntro(@ModelAttribute("intro") IntroVo vo, @ModelAttribute("company") CompanyVo companyVo){
//        companyServiceMapper.updateIntro(vo);
//        return "redirect:getIntroList.do";
//    }
    @RequestMapping(value = "/updateIntro.do", method = RequestMethod.POST)
    public String updateIntro(@ModelAttribute("intro") IntroVo vo, @ModelAttribute("company") CompanyVo companyVo){
        companyServiceMapper.updateIntro(vo);
        return "detail/company_regi";
    }

    @RequestMapping(value = "/deleteIntro.do")
    public String deleteIntro(@ModelAttribute("intro")IntroVo vo,Model model){
        companyServiceMapper.deleteIntro(vo.getId());
        model.addAttribute("status", "");
        return "redirect:getIntroList.do";
    }

    @RequestMapping(value = "/getIntro.do")
    public String getIntro(Model model, IntroVo vo, @ModelAttribute("noticeVo") NoticeVo noticeVo, @ModelAttribute("list") ArrayList<NoticeVo> list){
        model.addAttribute("intro",companyServiceMapper.getIntro(vo.getId()));
        return "detail/company";
    }
    @RequestMapping(value = "/getIntroList.do")
    public String getIntroList(Model model){
        model.addAttribute("companyList", companyServiceMapper.getIntroList());
        return "detail/company_list";
    }

    @RequestMapping(value="/popUp.do", method = RequestMethod.POST)
    public String postPopUp(@RequestParam(value = "gameName",defaultValue = "default") String gameName, Model model){
        model.addAttribute("gameName", gameName);
        return "detail/popup";
    }

    @RequestMapping(value="/popUp.do", method = RequestMethod.GET)
    public String getPopUp(@ModelAttribute("companyVo") CompanyVo companyVo){
        return "detail/popup";
    }
}
