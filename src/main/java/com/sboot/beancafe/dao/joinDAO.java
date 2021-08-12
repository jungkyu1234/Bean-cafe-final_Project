package com.sboot.beancafe.dao;

import org.apache.ibatis.annotations.Mapper;


import com.sboot.beancafe.vo.MemberVO;

@Mapper
public interface joinDAO {
	//회원가입
	public void joinMember(MemberVO member);
	
	//아이디중복확인
	public int idcheck(String user_id);
	public int deleteinfo(String user_id);
}
