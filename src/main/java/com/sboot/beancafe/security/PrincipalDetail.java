package com.sboot.beancafe.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import com.sboot.beancafe.vo.MemberVO;

public class PrincipalDetail implements UserDetails {

	private MemberVO member;
	
	
    public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public PrincipalDetail(MemberVO member) {
        this.member = member;
    }

    @Override
    public String getPassword() {
        return member.getUser_pw();
    }

    @Override
    public String getUsername() {
        return member.getUser_id();
    }
    public String getRole() {
    	return member.getUser_role();
    }
    //계정이 만료되지 않았는지 리턴 (true: 만료안됨)
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    //계정이 잠겨있는지 않았는지 리턴. (true:잠기지 않음)
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    //비밀번호가 마료되지 않았는지 리턴한다. (true:만료안됨)
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    //계정이 활성화(사용가능)인지 리턴 (true:활성화)
    @Override
    public boolean isEnabled() {
        return true;
    }

    //계정이 갖고있는 권한 목록은 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

    	Collection<GrantedAuthority> collectors = new ArrayList<GrantedAuthority>();
       // collectors.add(new SimpleGrantedAuthority(member.getUser_role()));
        collectors.add(() -> {
            return member.getUser_role();//"ROLE_USER";
        });
        return collectors;
    }
}
