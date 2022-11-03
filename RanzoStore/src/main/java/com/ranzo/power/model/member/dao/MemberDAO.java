package com.ranzo.power.model.member.dao;

import java.util.HashMap;
import java.util.Map;

import com.ranzo.power.model.member.dto.KakaoDTO;
import com.ranzo.power.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public void insertMember(MemberDTO dto);
	public int idChk(MemberDTO dto);
	public boolean adminCheck(String userid);
	public boolean pwdCheck(String userid, String passwd);
	public MemberDTO viewMember(String userid);
	public void updateMember(MemberDTO dto);
	public void deleteMember(Map<String, Object> map);
	public MemberDTO findId(MemberDTO dto);
	public MemberDTO findPwd(MemberDTO dto);
//	public String tempPwd(MemberDTO dto);
	public void kakaoinsert(HashMap<String, Object> userInfo);
	public KakaoDTO findkakao(HashMap<String, Object> userInfo);
}
