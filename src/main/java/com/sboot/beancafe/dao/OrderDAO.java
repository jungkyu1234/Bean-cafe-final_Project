package com.sboot.beancafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sboot.beancafe.vo.Order1VO;
import com.sboot.beancafe.vo.Order2VO;

@Mapper
public interface OrderDAO {
	public List<Order2VO> getOrdermem();
	public List<Order1VO> getOrderpro(int order_num);
	public Order1VO getOrdernum(int order_num);
	public Order2VO getmsg(int order_num);
	public int updatemsg(@Param("order_num") int order_num, @Param("or_msg") String or_msg);

}
