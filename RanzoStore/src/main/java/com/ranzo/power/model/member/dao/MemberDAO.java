package com.ranzo.power.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.board.dto.ReviewDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

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
	public void tempPwd(Map<String, String> map);
	public void kakaoinsert(HashMap<String, Object> userInfo);
	public MemberDTO findkakao(HashMap<String, Object> userInfo);
	public List<QnaDTO> qnaList();
	public List<ReviewDTO> reviewList();
	public List<ExhibitionDTO> wishlist(String userid);
	public int emptyWish(String userid);
}
