package com.ranzo.power.model.shop.dto;

import java.util.Date;

public class ExhibitionDTO {

	private String code;
	private String location;
	private String gallery;
	private String title;
	private String summary;
	private String thumnail;
	private Date startDate;
	private Date endDate;
	private int hit;
	
	
	public ExhibitionDTO() {
		
	}
	
	public ExhibitionDTO(String code, String location, String gallery, String title, String summary, String thumnail,	
			Date startDate, Date endDate, int hit) {
		super();
		this.code = code;
		this.location = location;
		this.gallery = gallery;
		this.title = title;
		this.summary = summary;
		this.thumnail = thumnail;
		this.startDate = startDate;
		this.endDate = endDate;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
		
}
