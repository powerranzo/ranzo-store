package com.ranzo.power.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< Updated upstream
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("로그인 인터셉터 호출");
		HttpSession session=request.getSession();
		if(session.getAttribute("userid")==null) {
			response.sendRedirect(request.getContextPath()
					+"/member/login.do?message=nologin");
			return false;
		}
		else {
			return true;
		}
	}

=======
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	//메인 액션이 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션 객체 생성
		HttpSession session=request.getSession();
		//세션이 없으면(로그인되지 않은 상태)
		if(session.getAttribute("userid") == null) {
			response.sendRedirect(request.getContextPath()
					+"/member/login.do?message=nologin");
			return false; //메인 액션으로 가지 않음
		}else {//로그인 했으면
			return true; //메인 액션으로 이동
		}
	}
	
	//메인 액션이 실행된 후
>>>>>>> Stashed changes
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
