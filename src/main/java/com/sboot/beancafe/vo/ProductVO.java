package com.sboot.beancafe.vo;




public class ProductVO {
	private int p_no;
	private String p_name;
	private int p_price;
	private int p_amount;
	private String p_imguri;
	private String p_dis;
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
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
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public String getP_imguri() {
		return p_imguri;
	}
	public void setP_imguri(String p_imguri) {
		this.p_imguri = p_imguri;
	}
	public String getP_dis() {
		return p_dis;
	}
	public void setP_dis(String p_dis) {
		this.p_dis = p_dis;
	}
	public ProductVO(int p_no, String p_name, int p_price, int p_amount, String p_imguri, String p_dis) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_amount = p_amount;
		this.p_imguri = p_imguri;
		this.p_dis = p_dis;
	}
	@Override
	public String toString() {
		return "ProductVO [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_amount=" + p_amount
				+ ", p_imguri=" + p_imguri + ", p_dis=" + p_dis + "]";
	}
	
	
	

}
