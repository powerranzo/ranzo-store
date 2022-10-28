package com.ranzo.power.model.member.dao;

import com.ranzo.power.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public void insertMember(MemberDTO dto);
	public int idChk(MemberDTO dto);
	public boolean adminCheck(String userid);
}
