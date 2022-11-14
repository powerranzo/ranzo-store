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
	private String title; //전시제목
	private String gallery; //갤러리 
	private String name;  //예매자 이름
	private String pay; //상태
	private String thumnail; 
	private String zipcode;
	private String addr1;
	private String addr2;
	private String hp;
	
	private String r_name; //배송받는 사람 정보
	private String r_zipcode;
	private String r_addr1;
	private String r_addr2;
	private String r_hp;
	private int edit; //배송지 변경 여부
	private String filterDate; //검색날짜
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private String strDate; //시작날짜
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private String endDate; //끝날짜
	private Date reg_date;
	
	private int adult_price;
	private int teen_price;
	private int kids_price;
	
	public ReservDTO() {

	}

	public ReservDTO(int adult, int teen, int kids, Date res_date) {
		super();
		this.adult = adult;
		this.teen = teen;
		this.kids = kids;
		this.res_date = res_date;
	}
	


	public int getAdult_price() {
		return adult_price;
	}

	public void setAdult_price(int adult_price) {
		this.adult_price = adult_price;
	}

	public int getTeen_price() {
		return teen_price;
	}

	public void setTeen_price(int teen_price) {
		this.teen_price = teen_price;
	}

	public int getKids_price() {
		return kids_price;
	}

	public void setKids_price(int kids_price) {
		this.kids_price = kids_price;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getStrDate() {
		return strDate;
	}

	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public ReservDTO(String filterDate) {
		super();
		this.filterDate = filterDate;
	}

	
	public String getFilterDate() {
		return filterDate;
	}

	public void setFilterDate(String filterDate) {
		this.filterDate = filterDate;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGallery() {
		return gallery;
	}

	public void setGallery(String gallery) {
		this.gallery = gallery;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_zipcode() {
		return r_zipcode;
	}

	public void setR_zipcode(String r_zipcode) {
		this.r_zipcode = r_zipcode;
	}

	public String getR_addr1() {
		return r_addr1;
	}

	public void setR_addr1(String r_addr1) {
		this.r_addr1 = r_addr1;
	}

	public String getR_addr2() {
		return r_addr2;
	}

	public void setR_addr2(String r_addr2) {
		this.r_addr2 = r_addr2;
	}

	public String getR_hp() {
		return r_hp;
	}

	public void setR_hp(String r_hp) {
		this.r_hp = r_hp;
	}

	public int getEdit() {
		return edit;
	}

	public void setEdit(int edit) {
		this.edit = edit;
	}

	public ReservDTO(int no, String userid, String code, Date res_date, int adult, int teen, int kids, int quantity,
			int sub_total, String title, String gallery, String name, String pay, String thumnail, String zipcode,
			String addr1, String addr2, String hp, String r_name, String r_zipcode, String r_addr1, String r_addr2,
			String r_hp, int edit, String filterDate, String strDate, String endDate) {
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
		this.title = title;
		this.gallery = gallery;
		this.name = name;
		this.pay = pay;
		this.thumnail = thumnail;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.hp = hp;
		this.r_name = r_name;
		this.r_zipcode = r_zipcode;
		this.r_addr1 = r_addr1;
		this.r_addr2 = r_addr2;
		this.r_hp = r_hp;
		this.edit = edit;
		this.filterDate = filterDate;
		this.strDate = strDate;
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "ReservDTO [no=" + no + ", userid=" + userid + ", code=" + code + ", res_date=" + res_date + ", adult="
				+ adult + ", teen=" + teen + ", kids=" + kids + ", quantity=" + quantity + ", sub_total=" + sub_total
				+ ", title=" + title + ", gallery=" + gallery + ", name=" + name + ", pay=" + pay + ", thumnail="
				+ thumnail + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", hp=" + hp
				+ ", r_name=" + r_name + ", r_zipcode=" + r_zipcode + ", r_addr1=" + r_addr1 + ", r_addr2=" + r_addr2
				+ ", r_hp=" + r_hp + ", edit=" + edit + ", filterDate=" + filterDate + ", strDate=" + strDate
				+ ", endDate=" + endDate + "]";
	}

	
}
