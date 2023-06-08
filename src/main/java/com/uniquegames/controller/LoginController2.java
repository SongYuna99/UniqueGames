package com.uniquegames.controller;


import com.uniquegames.model.SessionConstants;
import com.uniquegames.repository.CompanyRepositoryMapper;
import com.uniquegames.repository.MemberRepositoryMapper;
import com.uniquegames.service.MemberServiceMapper2;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 세션 적용 로그인 컨틀롤러
 */
@Slf4j
@Controller
public class LoginController2 {

	@Autowired
	MemberRepositoryMapper memberRepositoryMapper;

	@Autowired
	CompanyRepositoryMapper companyRepositoryMapper;

	@RequestMapping(value="/login2.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login2";
	}

	/**
	 * @param member MemberVo 객체 매핑
	 * @param request 세션 생성, request 객체 호출
	 * @param redirectURL 로그인 성공 시 메인페이지(인덱스) 리다이렉트
	 * @return
	 */
	@RequestMapping(value = "/login2.do", method = RequestMethod.POST)
	public String loginOk(@Validated @ModelAttribute MemberVo member,@Validated @ModelAttribute
			CompanyVo company,  HttpServletRequest request, @RequestParam(defaultValue = "/") String redirectURL)
			{

			HttpSession session = request.getSession(); // 세션이 있으면 있는 세션 반환, 없으면 신규 세션을 생성하여 반환
			MemberVo loginMember = memberRepositoryMapper.findById(member.getMember_id());
			CompanyVo loginMemberCom = companyRepositoryMapper.findById(company.getCompany_id());
			/* 일반 회원 로그인일 시 세션처리 */
			if(loginMember!=null&& Objects.equals(loginMember.getMember_id(), member.getMember_id())&& Objects.equals(
					loginMember.getPassword(), member.getPassword())){
			session.setAttribute(SessionConstants.LOGIN_MEMBER, loginMember);   // 세션에 로그인 회원 정보 보관
			}
			/* 기업 회원 로그인일 시 세션처리 */
			else if(loginMemberCom!=null&& Objects.equals(loginMemberCom.getCompany_id(), company.getCompany_id())&& Objects.equals(
					loginMemberCom.getPassword(),company.getPassword() )){
			session.setAttribute(SessionConstants.LOGIN_MEMBER, loginMemberCom);   // 세션에 로그인 회원 정보 보관
		}

		return "redirect:"+redirectURL;
	}
	
	@RequestMapping(value="/logout2.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/index.do";
	}


	@RequestMapping("/session-info")
	public String sessionInfo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "세션이 없습니다.";
		}
		// 세션 id와 저장된 객체 정보 출력
		System.out.println(session.getId() + ", " + session.getAttribute("loginMember"));

		//세션 데이터 출력
		Enumeration<String> attributeNames = session.getAttributeNames();
		while (attributeNames.hasMoreElements()) {
			String name = attributeNames.nextElement();
			log.info("session name={}, value={}", name, session.getAttribute(name));
		}

		log.info("sessionId={}", session.getId());
		log.info("getMaxInactiveInterval={}", session.getMaxInactiveInterval());
		log.info("creationTime={}", new Date(session.getCreationTime()));
		log.info("lastAccessedTime={}", new Date(session.getLastAccessedTime()));
		log.info("isNew={}", session.isNew());

		return "세션 출력";

	}

}
