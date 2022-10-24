package com.ranzo.power.model.member.dto;

import java.util.Date;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String gender;
	private String hp;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String quit; //default 'n'
	private Date join_date;
	private Date quit_date; //날짜만
	private String rn;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getQuit() {
		return quit;
	}
	public void setQuit(String quit) {
		this.quit = quit;
	}
	public Date getQuit_date() {
		return quit_date;
	}
	public void setQuit_date(java.sql.Date quit_date) {
		this.quit_date = quit_date;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email
				+ ", gender=" + gender + ", hp=" + hp + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", quit=" + quit + ", join_date=" + join_date + ", quit_date=" + quit_date + ", rn=" + rn + "]";
	}

	public MemberDTO(String userid, String passwd, String name, String email, String gender, String hp, String zipcode,
			String addr1, String addr2, Date join_date) {
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.hp = hp;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.join_date = join_date;
	}
	public MemberDTO() {

	}
	
}

