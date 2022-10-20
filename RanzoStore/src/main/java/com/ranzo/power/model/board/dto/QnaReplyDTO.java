package com.ranzo.power.model.board.dto;

import java.util.Date;

public class QnaReplyDTO {
	private int rno; //댓글번호
	private int bno; //게시글 번호
	private String content; //내용
	private String writer; //작성자 userid(member테이블)
	private String name; //작성사 이름 (member테이블)
	private Date reg_date; //작성일
	private Date update_date; //수정일
	private String secret_reply; //비밀댓글 여부
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}
	@Override
	public String toString() {
		return "QnaReplyDTO [rno=" + rno + ", bno=" + bno + ", content=" + content + ", writer=" + writer + ", name="
				+ name + ", reg_date=" + reg_date + ", update_date=" + update_date + ", secret_reply=" + secret_reply
				+ "]";
	}
}
