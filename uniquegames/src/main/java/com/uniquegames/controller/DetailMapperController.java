package com.uniquegames.controller;

import com.uniquegames.fileutil.FileUtil;
import com.uniquegames.service.CompanyServiceMapper;
import com.uniquegames.service.CompanyServiceMapper2;
import com.uniquegames.vo.IntroVo;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
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
@SessionAttributes({"intro","test_id"})
@RequestMapping(value = "/detail")
public class DetailMapperController {

    /**
     * 서비스 객체 의존성 주입
     */
    private final CompanyServiceMapper companyServiceMapper;
    private final CompanyServiceMapper2 companyServiceMapper2;

    @Autowired
    public DetailMapperController(CompanyServiceMapper companyServiceMapper,
            CompanyServiceMapper2 companyServiceMapper2) {
        this.companyServiceMapper = companyServiceMapper;
        this.companyServiceMapper2 = companyServiceMapper2;
    }

    /**
     * @param companyId 회사 소개글 인덱스
     * @return 회사 상세페이지 리턴
     */
    @RequestMapping(value = "/{companyId}",method = RequestMethod.GET)
    public String goDetail(@PathVariable int companyId, Model model) {
        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail";
    }

    @RequestMapping(value = "/insertIntro.do")
    public String insertIntro(IntroVo vo, HttpServletRequest request) throws IOException {
        //파일 업로드 처리 - spring 파일업로드 기능
       /* MultipartFile uploadFile = vo.getUploadFile();
        String root_path = request.getSession().getServletContext().getRealPath("/");
        String attach_path = "\\resources\\upload\\";

        if(uploadFile!=null && !uploadFile.isEmpty()){
            String fileName = uploadFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String upload = uuid + "_" + fileName;
            uploadFile.transferTo(new File(root_path+attach_path + upload));
            vo.setUpload(upload);
        }*/
        FileUtil fileUtil = new FileUtil(vo, request);
        IntroVo introVo = fileUtil.getUpload();
        if(introVo.getTitle() == null)
            return "detail/company_regi";
        else{
            companyServiceMapper.insertIntro(introVo);
            return "redirect:getIntroList.do";
        }

    }
    @RequestMapping(value = "/updateIntro.do")
    public String updateIntro(@ModelAttribute("intro") IntroVo vo){
        companyServiceMapper.updateIntro(vo);
        return "redirect:getIntroList.do";
    }

    @RequestMapping(value = "/deleteIntro.do")
    public String deleteIntro(int id){
        companyServiceMapper.deleteIntro(id);
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
