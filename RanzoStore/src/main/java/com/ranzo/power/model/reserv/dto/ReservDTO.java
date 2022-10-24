package com.ranzo.power.model.reserv.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReservDTO {
	private int no; //주문번호
	private String userid;//예매자
	private String code; //전시코드
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date res_date;
	private int adult; //성인수량
	private int teen; //청소년 수량
	private int kids;//어린이 수량
	private int quantity;//총 수량
	private int sub_total; //총가격
	private String title;
	private String gallery;
	private String name;
	private String pay; //상태
	private String thumnail;
	
	
	
		
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGallery() {
		return gallery;
	}
	public void setGallery(String gallery) {
		this.gallery = gallery;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getTeen() {
		return teen;
	}
	public void setTeen(int teen) {
		this.teen = teen;
	}
	public int getKids() {
		return kids;
	}
	public void setKids(int kids) {
		this.kids = kids;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSub_total() {
		return sub_total;
	}
	public void setSub_total(int sub_total) {
		this.sub_total = sub_total;
	}

	@Override
	public String toString() {
		return "ReservDTO [no=" + no + ", userid=" + userid + ", code=" + code + ", res_date=" + res_date + ", adult="
				+ adult + ", teen=" + teen + ", kids=" + kids + ", quantity=" + quantity + ", sub_total=" + sub_total
				+ ", title=" + title + ", gallery=" + gallery + ", name=" + name + ", pay=" + pay + ", thumnail="
				+ thumnail + "]";
	}
	public ReservDTO(int no, String userid, String code, Date res_date, int adult, int teen, int kids, int quantity,
			int sub_total) {
		super();
		this.no = no;
		this.userid = userid;
		this.code = code;
		this.res_date = res_date;
		this.adult = adult;
		this.teen = teen;
		this.kids = kids;
		this.quantity = quantity;
		this.sub_total = sub_total;
	}
	public ReservDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReservDTO(int adult, int teen, int kids, Date res_date) {
		super();
		this.adult = adult;
		this.teen = teen;
		this.kids = kids;
		this.res_date = res_date;
	}
	
	


	
	

	
		
}
