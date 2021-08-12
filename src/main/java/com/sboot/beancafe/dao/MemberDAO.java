package com.sboot.beancafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sboot.beancafe.vo.MemberVO;

@Mapper
public interface MemberDAO {
	public List<MemberVO> getMembers();
}
