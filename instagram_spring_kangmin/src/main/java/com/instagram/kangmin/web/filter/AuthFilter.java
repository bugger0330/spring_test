package com.instagram.kangmin.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.instagram.kangmin.domain.user.User;

public class AuthFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		
		HttpSession session = httpServletRequest.getSession();
		
		User user = (User)session.getAttribute("login");
		
		String path = httpServletRequest.getRequestURI();
		
		if(path.contains("/kangmin/auth")) {
			if(user != null) {
				httpServletResponse.sendRedirect("/kangmin/");
				System.out.println("로그인 되어 필터에 걸림");
				return;
			}else if(user == null){
//				httpServletResponse.sendRedirect("/kangmin/auth/signin");
//				return;
			}
		}
		
		
		chain.doFilter(httpServletRequest, httpServletResponse);
		
	}
	
	
	
	
	
	
}
