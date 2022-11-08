package com.ranzo.power.service.admin;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

public interface AdminService {
	public Map<String,Object> getMemberList(SearchDTO searchOp, int curPage);
	public MemberDTO getMemberView(String userid);
	public void deleteMember(String[] userids);
	public List<QnaDTO> getMemberQna(String userid);
	public List<ReservDTO> getMemberReserv(String userid);
	public void deleteQna(int[] qna_bno);
	public void deleteReserv(String[] reserv_no);
	public Map<String, Object> getExbList(SearchDTO searchOp, int curPage);
	public void insertExb(ExhibitionDTO dto);
	public ExhibitionDTO getExbView(String code);
	public void updateExb(ExhibitionDTO dto);
	public Map<String, Object> getReservList(SearchDTO searchOp, int curPage);
	public void deleteFile(String code, String fileType);
	public Map<String, Object> getQnaList(SearchDTO searchOp, int curPage);
	
	public Map<String, Object> getPopupList(SearchDTO searchOp, int curPage);
	public void insertPopup(PopupDTO dto);
	public void updatePopup(PopupDTO dto);
	public void deleteExb(String code);
	public PopupDTO getPopupView(int no);
	public void deletePopup(int[] pop_no);
	

	
	
	
}
