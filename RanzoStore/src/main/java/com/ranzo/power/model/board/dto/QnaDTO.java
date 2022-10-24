package com.ranzo.power.model.board.dto;


import java.util.Arrays;
import java.util.Date;

public class QnaDTO {
	private int bno; //게시글 번호
	private String writer; //작성자id(userid랑 조인)
	private String 	name; //작성자 이름
	private String title; //제목
	private String content; //내용
	private Date reg_date; //작성일자 
	private int viewcnt; //조회수
	private String reply_state; //답변상태
	private String[] files; //첨부파일 이름 배열
	private String show; //화면 표시 여부
	private String ext; //첨부파일의 확장자(테이블에 없음)

import java.util.Date;

public class QnaDTO {
	private int bno;
	private String product; //제품코드 (빠짐)
	private String writer; // userid (member_tb)
	private String name;
	private String title;
	private String content; 
	private Date reg_date; 
	private int viewcnt;
	private String reply_state;
	private String filename;
	private int filesize;
	private String show;

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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

	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getwriter() {
		return writer;
	}
	public void setwriter(String writer) {
		this.writer = writer;

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

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getReply_state() {
		return reply_state;
	}
	public void setReply_state(String reply_state) {
		this.reply_state = reply_state;
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
	@Override
	public String toString() {
		return "QnaDTO [bno=" + bno + ", writer=" + writer + ", name=" + name + ", title=" + title + ", content="
				+ content + ", reg_date=" + reg_date + ", viewcnt=" + viewcnt + ", reply_state=" + reply_state
				+ ", files=" + Arrays.toString(files) + ", show=" + show + ", ext=" + ext + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "QnaDTO [bno=" + bno + ", product=" + product + ", writer=" + writer + ", name=" + name + ", title="
				+ title + ", content=" + content + ", reg_date=" + reg_date + ", viewcnt=" + viewcnt + ", reply_state="
				+ reply_state + ", filename=" + filename + ", filesize=" + filesize + ", show=" + show + "]";
	}
	public QnaDTO(int bno, String product, String writer, String name, String title, String content, Date reg_date,
			int viewcnt, String reply_state, String filename, int filesize, String show) {
		this.bno = bno;
		this.product = product;
		this.writer = writer;
		this.name = name;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.viewcnt = viewcnt;
		this.reply_state = reply_state;
		this.filename = filename;
		this.filesize = filesize;
		this.show = show;
	}
	public QnaDTO() {
	}

}
