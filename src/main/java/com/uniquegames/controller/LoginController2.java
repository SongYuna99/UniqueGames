package com.uniquegames.controller;


import com.uniquegames.model.SessionConstants;
import com.uniquegames.repository.MemberRepositoryMapper;
import com.uniquegames.service.MemberServiceMapper2;
import com.uniquegames.vo.MemberVo;
import java.util.Date;
import java.util.Enumeration;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
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

	private final MemberServiceMapper2 memberServiceMapper2;
	@Autowired
	MemberRepositoryMapper memberRepositoryMapper;

	/**
	 * @param memberServiceMapper2
	 */
	@Autowired
	public LoginController2(MemberServiceMapper2 memberServiceMapper2) {
		this.memberServiceMapper2 = memberServiceMapper2;
	}

	@RequestMapping(value="/login2.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login2";
	}

	/**
	 * @param member MemberVo 객체 매핑
	 * @param bindingResult 
	 * @param request 세션 생성, request 객체 호출
	 * @param redirectURL 로그인 성공 시 메인페이지(인덱스) 리다이렉트
	 * @return
	 */
	@RequestMapping(value = "/login2.do", method = RequestMethod.POST)
	public String loginOk(@Validated @ModelAttribute MemberVo member, BindingResult bindingResult, HttpServletRequest request, @RequestParam(defaultValue = "/") String redirectURL){
		/*BindingResult newBindingResult = memberService.loginValidCheck(member, bindingResult);

		if(newBindingResult!=null && newBindingResult.hasErrors()){
			return "member/login";
		}else{*/

			HttpSession session = request.getSession(); // 세션이 있으면 있는 세션 반환, 없으면 신규 세션을 생성하여 반환

			MemberVo loginMember = memberRepositoryMapper.findById(member.getMember_id());
			if(Objects.equals(loginMember.getMember_id(), member.getMember_id())&& Objects.equals(
					member.getPassword(), loginMember.getPassword())){

			session.setAttribute(SessionConstants.LOGIN_MEMBER, loginMember);   // 세션에 로그인 회원 정보 보관
				return "redirect:"+redirectURL;
			}
		log.info("Session Attribute Value: {}", session.getAttribute(SessionConstants.LOGIN_MEMBER));

		return "redirect:login2.do";
//		}
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
