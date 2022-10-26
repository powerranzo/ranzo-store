package com.ranzo.power.model.board.dto;

import java.util.Date;

public class ReviewReplyDTO {
	private int rno; //댓글 번호
	private int bno; //게시물 번호
	private String replytext; //댓글 내용
	private String replyer; //댓글 작성자 id
	private String name; //댓글 작성자 이름(member_tb 테이블)
	private Date regdate; //작성일자
	private Date updatedate; //수정일자
	private String secret_reply; //비밀댓글 여부
	private String userid; //작성자 아이디(member_tb)
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
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "ReviewReplyDTO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", name=" + name + ", regdate=" + regdate + ", updatedate=" + updatedate + ", secret_reply="
				+ secret_reply + ", userid=" + userid + "]";
	}
}
