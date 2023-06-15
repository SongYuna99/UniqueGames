package com.uniquegames.annotation;

import com.uniquegames.model.SessionConstants;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.MemberVo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 *  컨트롤러 메서드의 파라미터에 세션에 저장된 로그인 회원 객체를 자동으로 주입하기 위한
 *  HandlerMethodArgumentResolver를 구현한 클래스. servlet-context에 등록함.
 */
public class LoginMemberArgumentResolver implements HandlerMethodArgumentResolver {

    /** 해당 리졸버가 지원하는 파라미터인지 확인하는 메소드
     * @param parameter 파라미터의 정보를 확인
     * @return true일 때, resolveArgument 메소드 실행
     */
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        //resolveArgument를 실행하기 위한 조건
        //@Login 애노테이션이 존재 && (MemberVo || CompanyVo)타입이여야 한다.
        boolean hasLoginAnnotation = parameter.hasParameterAnnotation(Login.class);
        boolean hasMemberType = parameter.getParameterType().equals(MemberVo.class);;
//        boolean hasCompanyType = CompanyVo.class.isAssignableFrom(parameter.getParameterType());
        return hasLoginAnnotation && hasMemberType;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {

        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        HttpSession session = request.getSession(false);
        if (session.getAttribute(SessionConstants.LOGIN_MEMBER) == null) {
            return null;
        }
        return session.getAttribute(SessionConstants.LOGIN_MEMBER);
    }
}
