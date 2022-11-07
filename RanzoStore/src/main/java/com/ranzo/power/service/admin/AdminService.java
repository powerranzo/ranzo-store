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
	public void deleteQna(String[] qna_bno);
	public void deleteReserv(String[] reserv_no);
	public Map<String, Object> getExbList(SearchDTO searchOp, int curPage);
	public void insertExb(ExhibitionDTO dto);
	public ExhibitionDTO getExbView(String code);
	public void updateExb(ExhibitionDTO dto);
	public Map<String, Object> getReservList(SearchDTO searchOp, int curPage);
	public void deleteFile(String code, String fileType);
	
	public List<PopupDTO> popupList();//팝업 리스트 
	public void insertPopup(PopupDTO dto);//팝업 등록
	public void updatePopup(PopupDTO dto);//팝업 수정
	public void deletePopup(PopupDTO dto);//팝업 삭제 (파일고려)
	public void deleteExb(String code);
	

	
	
	
}
