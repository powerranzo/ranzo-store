package com.ranzo.power.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger=LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("관리자 인터셉터 호출");
		HttpSession session=request.getSession();
		String admin=(String)session.getAttribute("admin");
		if(session.getAttribute("userid")==null) {
			response.sendRedirect(request.getContextPath()
					+"/member/login.do?message=nologin");
			return false;
		}else if(admin!=null && admin.equals("y")) {
			return true;
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer= response.getWriter();
			String script = "<script>"
					+ "alert('관리자 로그인이 필요한 서비스입니다.');"
					+ "	history.back();"
					+ "</script>";
			writer.print(script);
			return  false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

}
