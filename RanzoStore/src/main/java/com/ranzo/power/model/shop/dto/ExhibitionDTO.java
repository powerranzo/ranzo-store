package com.ranzo.power.model.shop.dto;

import java.util.Date;

public class ExhibitionDTO {

	private String code;
	private String location; // 전시 지역
	private String gallery; // 전시관
	private String title; // 전시 제목
	private String summary; // 전시 소개/소제목
	private String thumnail;  // 포스터 이미지 링크
	private Date start_date; // 전시 시작일
	private Date end_date; // 전시 종료일
	private int hit; //조회수
	private int sales; //
	private int rn;

	private String code;
	private String location;
	private String gallery;
	private String title;
	private String summary;
	private String thumnail;
	private Date start_date;
	private Date end_date;
	private int hit;
	
	
	public ExhibitionDTO() {
		
	}
	
	public ExhibitionDTO(String code, String location, String gallery, String title, String summary, String thumnail,	
			Date start_date, Date end_date, int hit) {
	
		this.code = code;
		this.location = location;
		this.gallery = gallery;
		this.title = title;
		this.summary = summary;
		this.thumnail = thumnail;
		this.start_date = start_date;
		this.end_date = end_date;
		this.hit = hit;
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

	public Date getstart_date() {
		return start_date;
	}

	public void setstart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getend_date() {
		return end_date;
	}

	public void setend_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}
	
	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}
	
 
	@Override
	public String toString() {
		return "ExhibitionDTO [code=" + code + ", location=" + location + ", gallery=" + gallery + ", title=" + title
				+ ", summary=" + summary + ", thumnail=" + thumnail + ", start_date=" + start_date + ", end_date="
				+ end_date + ", hit=" + hit + ", sales=" + sales + ", rn=" + rn + "]";
	}


	public ExhibitionDTO(String code, String location, String gallery, String title, String summary, String thumnail,
			Date start_date, Date end_date, int hit, int sales, int rn) {
		this.code = code;
		this.location = location;
		this.gallery = gallery;
		this.title = title;
		this.summary = summary;
		this.thumnail = thumnail;
		this.start_date = start_date;
		this.end_date = end_date;
		this.hit = hit;
		this.sales = sales;
		this.rn = rn;
	}
		
	public ExhibitionDTO() {
	}
}
