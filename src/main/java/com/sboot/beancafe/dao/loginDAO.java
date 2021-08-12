package com.sboot.beancafe.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.sboot.beancafe.vo.MemberVO;

@Mapper
public interface loginDAO {
	//로그인아이디
		public String return_id(String user_id);
		//로그인비밀번호(인코딩하면서 바꿔야함 임시~~~~)
		public String return_pw(String user_id);
		
		//아이디로 멤버객체 반환
		public MemberVO findById(String user_id);
		
		//아이디찾기
		public String findID(@Param("user_name")String user_name,@Param("phoneNumber")String phoneNumber);
		//비밀번호 재설정
		public void rePW(@Param("user_id")String user_id,@Param("user_pw")String user_pw);
		
}
