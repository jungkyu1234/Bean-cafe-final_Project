package com.sboot.beancafe.vo;

import java.util.Date;




public class Order2VO {
	private int order_num;
	private String or_id;
	private String or_name;
	private String or_tel;
	private String or_msg;
	private Date or_date;
	private String or_addr;
	
	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getOr_id() {
		return or_id;
	}

	public void setOr_id(String or_id) {
		this.or_id = or_id;
	}

	public String getOr_name() {
		return or_name;
	}

	public void setOr_name(String or_name) {
		this.or_name = or_name;
	}

	public String getOr_tel() {
		return or_tel;
	}

	public void setOr_tel(String or_tel) {
		this.or_tel = or_tel;
	}

	public String getOr_msg() {
		return or_msg;
	}

	public void setOr_msg(String or_msg) {
		this.or_msg = or_msg;
	}

	public Date getOr_date() {
		return or_date;
	}

	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}

	public String getOr_addr() {
		return or_addr;
	}

	public void setOr_addr(String or_addr) {
		this.or_addr = or_addr;
	}

	public Order2VO() { }
	
	public Order2VO(int order_num, String or_id, String or_name, String or_tel, String or_msg,
					Date or_date, String or_addr) {
		super();
		this.order_num=order_num;
		this.or_id=or_id;
		this.or_name=or_name;
		this.or_tel=or_tel;
		this.or_msg=or_msg;
		this.or_date=or_date;
		this.or_addr=or_addr;
	}
}

