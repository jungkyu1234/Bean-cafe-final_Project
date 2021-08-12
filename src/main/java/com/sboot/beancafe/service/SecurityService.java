package com.sboot.beancafe.service;

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
public class SecurityService implements UserDetailsService {
	
	@Autowired
	private loginDAO logindao;
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		MemberVO member=logindao.findById(user_id);
		//UserPrincipalVO userprincipalVO=new UserPrincipalVO();
		
		if(member==null) {
			throw new UsernameNotFoundException(user_id);
		}
//		if(member !=null) {
//			userprincipalVO.setUsername(user_id);
//			userprincipalVO.setPassword(member.getUser_pw());
//			List<GrantedAuthority> authorities=new ArrayList<GrantedAuthority>();
//			authorities.add(new SimpleGrantedAuthority(member.getUser_role()));
//			
//			userprincipalVO.setAuthorities(authorities);
//			
//		}
//		return userprincipalVO;
		return User.builder()
				.username(member.getUser_id())
				.password(member.getUser_pw())
				.roles(member.getUser_role())
				.build();
	
	}

}
