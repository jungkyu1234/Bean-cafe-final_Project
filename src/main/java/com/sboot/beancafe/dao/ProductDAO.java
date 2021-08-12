package com.sboot.beancafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sboot.beancafe.vo.CartVO;
import com.sboot.beancafe.vo.MemberVO;
import com.sboot.beancafe.vo.Order1VO;
import com.sboot.beancafe.vo.Order2VO;
import com.sboot.beancafe.vo.ProductVO;

@Mapper //mapping를 위해 xml에서 정의한다
public interface ProductDAO {
	//상품출력
	public List<ProductVO> getAllproduct();
	public List<ProductVO> getCoffee();
	public List<ProductVO> getGoods();
	public List<ProductVO> getMailing();
	public ProductVO getProductinfo(String p_name);
	
	//상품관리
	public int insertProduct(int p_no, String p_name, int p_price, int p_amount, String p_imguri,String description);
	public int updateProduct(int p_no, String p_name, int p_price, int p_amount, String p_imguri,String description);
	public int deleteProduct(String p_name);
	public ProductVO getInfo(String p_name);

	//admin.회원관리
	public List<MemberVO> memberList();
	
	//admin.주문관리
	public List<Order2VO> getOrdermem();
    public List<Order1VO> getOrderpro(int order_num);
    public Order1VO getOrdernum(int order_num);
    public Order2VO getmsg(int order_num);
    public int updatemsg(@Param("order_num") int order_num, @Param("or_msg") String or_msg);
	
    
    //order
    public List<Order2VO> getOrderlist(@Param("or_name")String or_name, @Param("or_tel") String or_tel);
    public List<Order1VO> getOrderplist(int Order_num);
    
    
    
    
    
    
    
    
    
    
    
	//장바구니 추가하기
	public void insertCart(@Param("p_imguri")String p_imguri,@Param("p_name")String p_name,
			@Param("p_price")int p_price,@Param("id")String id,@Param("order_num")int order_num);

	// 아이디로 장바구니 목록 가져오기
	public List<CartVO> getCart(String id);
	
	//장바구니 삭제
	public void delete(int order_num);
}
