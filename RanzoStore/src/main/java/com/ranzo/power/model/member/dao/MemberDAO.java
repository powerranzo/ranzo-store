package com.ranzo.power.model.member.dao;

import com.ranzo.power.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public void insertMember(MemberDTO dto);
	public int idChk(MemberDTO dto);
	public boolean infoEnterCheck(String userid, String passwd);
	public MemberDTO viewMember(String userid);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String userid);
}
