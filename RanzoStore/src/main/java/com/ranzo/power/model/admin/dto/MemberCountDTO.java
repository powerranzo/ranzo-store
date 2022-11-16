package com.ranzo.power.model.admin.dto;

public class MemberCountDTO {
	private int member_all;
	private int member_today;
	private int member_quit;
	public int getMember_all() {
		return member_all;
	}
	public void setMember_all(int member_all) {
		this.member_all = member_all;
	}
	public int getMember_today() {
		return member_today;
	}
	public void setMember_today(int member_today) {
		this.member_today = member_today;
	}
	public int getMember_quit() {
		return member_quit;
	}
	public void setMember_quit(int member_quit) {
		this.member_quit = member_quit;
	}
	@Override
	public String toString() {
		return "MemberCountDTO [member_all=" + member_all + ", member_today=" + member_today
				+ ", member_quit=" + member_quit + "]";
	}
	public MemberCountDTO(int member_all, int member_today, int member_quit) {
		this.member_all = member_all;
		this.member_today = member_today;
		this.member_quit = member_quit;
	}
	
}
