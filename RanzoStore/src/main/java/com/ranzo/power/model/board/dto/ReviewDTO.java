package com.ranzo.power.model.board.dto;

import java.util.Date;

public class ReviewDTO {
	private int bno; //게시글 번호
	private String product; //전시명
	private String writer; //작성자id(userid랑 조인)
	private String name; //작성자 이름
	private String subject; // 제목
	private String title; //제목(exhibition테이블 전시코드랑 조인)
	private String content; //내용
	private Date reg_date; //작성일자 
	private int viewcnt; //조회수
	private String show; //화면 표시 여부
	private int rating; //별점
	private int thumb; //좋아요
	private int cnt; //댓글 개수
	private String thumnail;
	
	
	
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public void setTitle(String title) {
		this.title = title;
	}
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTitle() {
		return title;
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

	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ReviewDTO [bno=" + bno + ", product=" + product + ", writer=" + writer + ", name=" + name + ", subject="
				+ subject + ", title=" + title + ", content=" + content + ", reg_date=" + reg_date + ", viewcnt="
				+ viewcnt + ", show=" + show + ", rating=" + rating + ", thumb=" + thumb + ", cnt=" + cnt + "]";
	}

	
}
