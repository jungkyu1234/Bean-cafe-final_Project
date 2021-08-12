package com.sboot.beancafe.vo;

import java.sql.Date;

public class MemberVO {
		private String user_id;
	    private String user_pw;
	    private String user_name;
	    private String phoneNumber;
	    private String address;
	    private String detailAddress;
	    private String mail1;
	    private String mail2;
	    private String user_birth_year;
	    private String user_birth_month;
	    private String user_birth_day;
	    private String user_role;
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getUser_pw() {
			return user_pw;
		}
		public void setUser_pw(String user_pw) {
			this.user_pw = user_pw;
		}
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getDetailAddress() {
			return detailAddress;
		}
		public void setDetailAddress(String detailAddress) {
			this.detailAddress = detailAddress;
		}
		public String getMail1() {
			return mail1;
		}
		public void setMail1(String mail1) {
			this.mail1 = mail1;
		}
		public String getMail2() {
			return mail2;
		}
		public void setMail2(String mail2) {
			this.mail2 = mail2;
		}
		public String getUser_birth_year() {
			return user_birth_year;
		}
		public void setUser_birth_year(String user_birth_year) {
			this.user_birth_year = user_birth_year;
		}
		public String getUser_birth_month() {
			return user_birth_month;
		}
		public void setUser_birth_month(String user_birth_month) {
			this.user_birth_month = user_birth_month;
		}
		public String getUser_birth_day() {
			return user_birth_day;
		}
		public void setUser_birth_day(String user_birth_day) {
			this.user_birth_day = user_birth_day;
		}
		public String getUser_role() {
			return user_role;
		}
		public void setUser_role(String user_role) {
			this.user_role = user_role;
		}
		public MemberVO(String user_id, String user_pw, String user_name, String phoneNumber, String address,
				String detailAddress, String mail1, String mail2, String user_birth_year, String user_birth_month,
				String user_birth_day, String user_role) {
			super();
			this.user_id = user_id;
			this.user_pw = user_pw;
			this.user_name = user_name;
			this.phoneNumber = phoneNumber;
			this.address = address;
			this.detailAddress = detailAddress;
			this.mail1 = mail1;
			this.mail2 = mail2;
			this.user_birth_year = user_birth_year;
			this.user_birth_month = user_birth_month;
			this.user_birth_day = user_birth_day;
			this.user_role = user_role;
		}
		@Override
		public String toString() {
			return "MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
					+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", detailAddress=" + detailAddress
					+ ", mail1=" + mail1 + ", mail2=" + mail2 + ", user_birth_year=" + user_birth_year
					+ ", user_birth_month=" + user_birth_month + ", user_birth_day=" + user_birth_day + ", user_role="
					+ user_role + "]";
		}
	
		

}
