package com.ranzo.power.model.board.dto;

import java.util.Date;

public class FaqDTO {
	int no;
	String title;
	String content;
	Date reg_date;
	String category;
	String data;
	String show;
	
	
	
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "FaqDTO [no=" + no + ", title=" + title + ", content=" + content + ", reg_date=" + reg_date
				+ ", category=" + category + ", data=" + data + "]";
	}
	public FaqDTO(int no, String title, String content, Date reg_date, String category) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.category = category;
	}
	public FaqDTO() {
	}
	
	
	
}
