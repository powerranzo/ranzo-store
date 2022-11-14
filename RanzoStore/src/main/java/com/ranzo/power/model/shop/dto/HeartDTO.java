package com.ranzo.power.model.shop.dto;

import java.util.Date;

public class HeartDTO {
	private int no;
	private String userid; // 찜한 사람
	private String product; // 찜한 전시
	private Date reg_date; // 찜한 날
	private int heart;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	@Override
	public String toString() {
		return "HeartDTO [no=" + no + ", userid=" + userid + ", product=" + product + ", reg_date=" + reg_date
				+ ", heart=" + heart + "]";
	}
	public HeartDTO(int no, String userid, String product, Date reg_date, int heart) {
		this.no = no;
		this.userid = userid;
		this.product = product;
		this.reg_date = reg_date;
		this.heart = heart;
	}
	public HeartDTO() {
	}
	
	
}
