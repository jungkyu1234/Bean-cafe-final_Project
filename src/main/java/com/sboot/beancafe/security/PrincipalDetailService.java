package com.sboot.beancafe.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sboot.beancafe.dao.loginDAO;
import com.sboot.beancafe.vo.MemberVO;

@Service
public class PrincipalDetailService implements UserDetailsService {
	 @Autowired
	 private loginDAO logindao;
	 
	    @Autowired
	    public PrincipalDetailService(loginDAO logindao) {
	        this.logindao = logindao;
	    }

	  
	    @Override
	    public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
	        MemberVO principal = logindao.findById(user_id);
	        
	      
	        
	        
	        if(principal==null) {
	        	throw new UsernameNotFoundException("해당유저를 찾을수 없습니다");
	        }else {
	        	return new PrincipalDetail(principal); 
	        }
	      
	              
	      
	    }
}
