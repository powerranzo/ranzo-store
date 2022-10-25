package com.ranzo.power.model.board.dto;


import java.util.Arrays;
import java.util.Date;

public class QnaDTO {
	private int bno; //게시글 번호
	private String writer; //작성자id(userid랑 조인)
	private String name; //작성자 이름
	private String title; //제목
	private String content; //내용
	private Date reg_date; //작성일자 
	private int viewcnt; //조회수
	private String reply_state; //답변상태
	private String[] files; //첨부파일 이름 배열
	private String show; //화면 표시 여부
	private String ext; //첨부파일의 확장자(테이블에 없음)
	private String product; //제품코드 (빠짐)
	private String fileName;
	private int filesize;
	
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
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "QnaDTO [bno=" + bno + ", writer=" + writer + ", name=" + name + ", title=" + title + ", content="
				+ content + ", reg_date=" + reg_date + ", viewcnt=" + viewcnt + ", reply_state=" + reply_state
				+ ", files=" + Arrays.toString(files) + ", show=" + show + ", ext=" + ext + ", product=" + product
				+ ", fileName=" + fileName + ", filesize=" + filesize + "]";
	}
	public QnaDTO(int bno, String writer, String name, String title, String content, Date reg_date, int viewcnt,
			String reply_state, String[] files, String show, String ext, String product, String fileName,
			int filesize) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.name = name;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.viewcnt = viewcnt;
		this.reply_state = reply_state;
		this.files = files;
		this.show = show;
		this.ext = ext;
		this.product = product;
		this.fileName = fileName;
		this.filesize = filesize;
	}
	public QnaDTO() {
	
	}


}
