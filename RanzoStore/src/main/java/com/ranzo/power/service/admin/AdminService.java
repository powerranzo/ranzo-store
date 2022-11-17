package com.ranzo.power.service.admin;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

public interface AdminService {
	//관리자 홈
	public Map<String, Object> getHomeList();
	//회원
	public Map<String,Object> getMemberList(SearchDTO searchOp, int curPage); //회원 목록
	public List<QnaDTO> getMemberQna(String userid); //회원 정보 내 QnA 목록
	public List<ReservDTO> getMemberReserv(String userid); //회원 정보 내 예약 목록
	public void deleteMember(String[] userids); //회원 탈퇴
	//전시
	public Map<String, Object> getExbList(SearchDTO searchOp, int curPage); //전시 목록
	public void insertExb(ExhibitionDTO dto, ProductInfoDTO idto); //전시 등록
	public ExhibitionDTO getExbView(String code); //전시 상세 정보(수정페이지)
	public void updateExb(ExhibitionDTO dto, ProductInfoDTO idto); //전시 수정
	public void deleteExb(String[] code); //전시 종료
	public void deleteExbFile(String code, String fileType); //전시 종료시 파일 정보 초기화
	public void showExb(String[] code); //전시 재개
	//예약
	public Map<String, Object> getReservList(SearchDTO searchOp, int curPage); //예약 목록
	public void deleteReserv(String[] no); //예약 목록 삭제
	//QNA
	public Map<String, Object> getQnaList(SearchDTO searchOp, int curPage); //QnA 목록
	public void deleteQna(int[] bno); //QnA 목록 삭제
	//팝업
	public Map<String, Object> getPopupList(SearchDTO searchOp, int curPage); //팝업 목록
	public void insertPopup(PopupDTO dto); //팝업 등록
	public PopupDTO getPopupView(int no); //팝업 상세 정보(수정페이지)
	public void updatePopup(PopupDTO dto); //팝업 수정
	public void deletePopup(int[] pop_no); //팝업 종료
	public void deletePopupFile(int no); //팝업 파일정보 초기화
	public void popupShow(int[] no); //팝업 재개
	public List<PopupDTO> getPopupOn(); //노출 중인 팝업
	
}
