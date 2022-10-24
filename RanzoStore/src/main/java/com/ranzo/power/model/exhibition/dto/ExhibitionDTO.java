package com.ranzo.power.model.exhibition.dto;

import java.sql.Date;

public class ExhibitionDTO {
	String code; //코드
	String location; //전시 지역
	String gallery;//전시관
	String title; //전시 제목
	String summary; //전시 소개/소제목
	String thumnail; //포스터 이미지 링크
	Date start_date; //전시 시작일
	Date end_date; //전시 종료일
	int hit; //조회수
	
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public ExhibitionDTO(String code, String location, String gallery, String title, String summary, String thumnail,
			Date start_date, Date end_date, int hit) {
		super();
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
	public ExhibitionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ExhibitionDTO [code=" + code + ", location=" + location + ", gallery=" + gallery + ", title=" + title
				+ ", summary=" + summary + ", thumnail=" + thumnail + ", start_date=" + start_date + ", end_date="
				+ end_date + ", hit=" + hit + "]";
	}
	
	
}
