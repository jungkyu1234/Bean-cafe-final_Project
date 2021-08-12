package com.sboot.beancafe.security;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.SecurityContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.sboot.beancafe.dao.loginDAO;
import com.sboot.beancafe.vo.MemberVO;

public class onAuthenticationSuccess implements AuthenticationSuccessHandler {

	@Autowired
	private loginDAO logindao;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub

		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		PrincipalDetail member= (PrincipalDetail) principal;
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		
		
		HttpSession session=request.getSession();
		
		session.setAttribute("member", member.getMember());
		response.sendRedirect("/main");
	}

}
