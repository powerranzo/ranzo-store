package com.ranzo.power.model.board.dto;

import java.util.Arrays;
import java.util.Date;

public class ReviewDTO {
	private int bno; //게시글 번호
	private String product; //전시명
	private String writer; //작성자id(userid랑 조인)
	private String name; //작성자 이름
	private String subject; 
	private String content; //내용
	private Date reg_date; //작성일자 
	int viewcnt; //조회수
	private String[] files; //첨부파일 이름 배열
	private String show; //화면 표시 여부
	private String ext; //첨부파일의 확장자(테이블에 없음)
	private int rating; //별점
	private int thumb; //좋아요
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getsubject() {
		return subject;
	}
	public void setsubject(String subject) {
		this.subject = subject;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getThumb() {
		return thumb;
	}
	public void setThumb(int thumb) {
		this.thumb = thumb;
	}
	@Override
	public String toString() {
		return "ReviewDTO [bno=" + bno + ", product=" + product + ", writer=" + writer + ", name=" + name + ", subject="
				+ subject + ", content=" + content + ", reg_date=" + reg_date + ", viewcnt=" + viewcnt + ", files="
				+ Arrays.toString(files) + ", show=" + show + ", ext=" + ext + ", rating=" + rating + ", thumb=" + thumb
				+ "]";
	}

}
