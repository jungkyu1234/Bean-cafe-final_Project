package com.sboot.beancafe.vo;


public class Order1VO {
	private int order_num;
	private String p_name;
	private int p_price;
	private int p_quantity;
	private int p_tprice;
	
	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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

	public int getP_quantity() {
		return p_quantity;
	}

	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}

	public int getP_tprice() {
		return p_tprice;
	}

	public void setP_tprice(int p_tprice) {
		this.p_tprice = p_tprice;
	}

	public Order1VO() { }
	
	public Order1VO(int order_num, String p_name, int p_price, int p_quantity, int p_tprice) {
		super();
		this.order_num=order_num;
		this.p_name=p_name;
		this.p_price=p_price;
		this.p_quantity=p_quantity;
		this.p_tprice=p_tprice;
	}
}

