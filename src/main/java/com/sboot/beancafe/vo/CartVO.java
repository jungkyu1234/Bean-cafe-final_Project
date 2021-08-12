package com.sboot.beancafe.vo;

public class CartVO {

	private String p_imguri;
	private String p_name;
	private int p_price;
	private int order_num;
	private String id;
	public String getP_imguri() {
		return p_imguri;
	}
	public void setP_imguri(String p_imguri) {
		this.p_imguri = p_imguri;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public CartVO(String p_imguri, String p_name, int p_price, int order_num, String id) {
		super();
		this.p_imguri = p_imguri;
		this.p_name = p_name;
		this.p_price = p_price;
		this.order_num = order_num;
		this.id = id;
	}
	
	
	
}