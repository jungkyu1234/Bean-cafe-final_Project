package com.sboot.beancafe.vo;

public class ResponseDataVO {

	private String code;
	private String status;
	private String message;
	private Object item;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getItem() {
		return item;
	}
	public void setItem(Object item) {
		this.item = item;
	}
	@Override
	public String toString() {
		return "ResponseDataVO [code=" + code + ", status=" + status + ", message=" + message + ", item=" + item + "]";
	}

	
}

