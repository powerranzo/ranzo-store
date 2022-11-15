package com.ranzo.power.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.board.dto.ReviewDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

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
	public List<QnaDTO> qnaList(String userid, int start, int end);
	public int countQna(String userid);
	public List<ReviewDTO> reviewList(String userid, int start, int end);
	public int countReview(String userid);
	public List<ExhibitionDTO> wishlist(String userid);
	public int emptyWish(String userid);
}
