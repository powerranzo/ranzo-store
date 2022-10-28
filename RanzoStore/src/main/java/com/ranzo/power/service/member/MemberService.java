package com.ranzo.power.service.member;

import javax.servlet.http.HttpSession;

import com.ranzo.power.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public void insertMember(MemberDTO dto);
	public int idChk(MemberDTO dto);
	public boolean infoEnterCheck(String userid, String passwd);
	public MemberDTO viewMember(String userid);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String userid);
}
