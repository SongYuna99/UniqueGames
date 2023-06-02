//package com.uniquegames.config;
//
//import com.uniquegames.annotation.LoginMemberArgumentResolver;
////import com.uniquegames.interceptor.LoginCheckInterceptor;
//import java.util.List;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.method.support.HandlerMethodArgumentResolver;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//
//@Configuration
//public class WebConfig extends WebMvcConfigurerAdapter {
//
//    private static final String[] whitelist = {"/css/**", "/js/**", "/img/**",
//            "/", "/login", "/logout", "/findPassword", "/register", "/registerOk", "/register/check"
//    };
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
////        InterceptorRegistration registration = registry.addInterceptor(new LoginCheckInterceptor());
//        registratio?n.addPathPatterns("/**");
////        registration.excludePathPatterns(whitelist);
//    }
//
//
//    @Override
//    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
//        resolvers.add(new LoginMemberArgumentResolver());
//    }
//}
