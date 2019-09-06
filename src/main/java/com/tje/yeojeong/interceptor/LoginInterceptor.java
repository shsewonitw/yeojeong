package com.tje.yeojeong.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tje.yeojeong.model.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = true;
		
		HttpSession session = request.getSession(false);
		if( session == null ) {
			result = false;
		} else {
			if( session.getAttribute("login_member") == null )
				result = false;
		}
		
		if( !result )
			response.sendRedirect(request.getContextPath() + "/login");
		
		return result;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	
	
	

}
