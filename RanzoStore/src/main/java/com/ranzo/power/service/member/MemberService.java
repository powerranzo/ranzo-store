package com.ranzo.power.service.member;

import javax.servlet.http.HttpSession;

import com.ranzo.power.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public void insertMember(MemberDTO dto);
	public int idChk(MemberDTO dto);
	public boolean pwdCheck(String userid, String passwd);
	public MemberDTO viewMember(String userid);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String userid);
	public MemberDTO findId(MemberDTO dto);
	public MemberDTO findPwd(MemberDTO dto); 
	public void sendPwd(String userid, String email) throws Exception;
	public String getAccessToken(String authorize_code);
	public MemberDTO getUserInfo(String access_Token);
	public void kakaoLogout(String access_Token);
}
