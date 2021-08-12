package com.sboot.beancafe.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class onAuthenticationFailiure implements AuthenticationFailureHandler {

	private String user_id;
	private String user_pw;
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String id=request.getParameter(user_id);
		String pw=request.getParameter(user_pw);
		String msg=null;
	    if(exception instanceof BadCredentialsException) {
            msg = "비밀번호가 존재하지 않습니다";
        } else if(exception instanceof InternalAuthenticationServiceException) {
            msg = "아이디가 존재하지 않습니다.";
        } 


		request.setAttribute("msg", msg);
		//request.getRequestDispatcher("/login?error").forward(request, response);

		
	}

}
