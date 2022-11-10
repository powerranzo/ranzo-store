package com.ranzo.power.model.admin.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PopupDTO {
	public int no;
	public String title;
	public String img_src;
	public int img_width;
	public int img_height;
	public int pos_width;
	public int pos_height;
	public String filename;
	public long filesize;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date start_date; 
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date end_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date reg_date;
	public String show;
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
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public int getImg_width() {
		return img_width;
	}
	public void setImg_width(int img_width) {
		this.img_width = img_width;
	}
	public int getImg_height() {
		return img_height;
	}
	public void setImg_height(int img_height) {
		this.img_height = img_height;
	}
	public int getPos_width() {
		return pos_width;
	}
	public void setPos_width(int pos_width) {
		this.pos_width = pos_width;
	}
	public int getPos_height() {
		return pos_height;
	}
	public void setPos_height(int pos_height) {
		this.pos_height = pos_height;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFilesize() {
		return filesize; 
	} 
	public void setFilesize(long filesize) {
		this.filesize = filesize;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	@Override
	public String toString() {
		return "PopupDTO [no=" + no + ", title=" + title + ", img_src=" + img_src + ", img_width=" + img_width
				+ ", img_height=" + img_height + ", pos_width=" + pos_width + ", pos_height=" + pos_height
				+ ", filename=" + filename + ", filesize=" + filesize + ", start_date=" + start_date + ", end_date="
				+ end_date + ", reg_date=" + reg_date + ", show=" + show + "]";
	}
	
	public PopupDTO(int no, String title, String img_src, int img_width, int img_height, int pos_width, int pos_height,
			String filename, long filesize, Date start_date, Date end_date, Date reg_date, String show) {
		this.no = no;
		this.title = title;
		this.img_src = img_src;
		this.img_width = img_width;
		this.img_height = img_height;
		this.pos_width = pos_width;
		this.pos_height = pos_height;
		this.filename = filename;
		this.filesize = filesize;
		this.start_date = start_date;
		this.end_date = end_date;
		this.reg_date = reg_date;
		this.show = show;
	}
	public PopupDTO() {
	}
	
	
}

