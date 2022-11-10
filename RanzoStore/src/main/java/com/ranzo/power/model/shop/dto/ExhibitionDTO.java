package com.ranzo.power.model.shop.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ExhibitionDTO {

	private String code;
	private String location; // 전시 지역
	private String gallery; // 전시관
	private String title; // 전시 제목
	private String summary; // 전시 소개/소제목
	private String thumnail;  // 포스터 이미지 링크
	private String product_info; // 상세이미지 링크
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date start_date; // 전시 시작일
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date end_date; // 전시 종료일
	private int hit; //조회수
	private int sales; //
	private int rn;
	private String show;
	private String keyword;
	private String searchDate;
	
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	
	public ExhibitionDTO(String code, String location, String gallery, String title, String summary, String thumnail,
			String product_info, Date start_date, Date end_date, int hit, int sales, int rn, String show) {
		this.code = code;
		this.location = location;
		this.gallery = gallery;
		this.title = title;
		this.summary = summary;
		this.thumnail = thumnail;
		this.product_info = product_info;
		this.start_date = start_date;
		this.end_date = end_date;
		this.hit = hit;
		this.sales = sales;
		this.rn = rn;
		this.show = show;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public ExhibitionDTO() {
		
	}
	@Override
	public String toString() {
		return "ExhibitionDTO [code=" + code + ", location=" + location + ", gallery=" + gallery + ", title=" + title
				+ ", summary=" + summary + ", thumnail=" + thumnail + ", product_info=" + product_info + ", start_date="
				+ start_date + ", end_date=" + end_date + ", hit=" + hit + ", sales=" + sales + ", rn=" 
				+ rn + ", show=" + show + "]";
	}

}
