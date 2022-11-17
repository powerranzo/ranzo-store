package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

public interface AdminDAO {
		//공통
		public int countTbAll(String table); //테이블의 전체 레코드 개수
		public void updateShowN(Map<String, Object> map); //테이블의 show 컬럼을 n으로 변경	
		public void updateShowY(Map<String, Object> map); //테이블의 show 컬럼을 y로 변경
		//회원
		public int countMemberToday(String now); //신규 가입 회원 수
		public int countMemberQuit(); //탈퇴 회원 수
		public int countSearchMember(Map<String, Object> map); //검색 대상 회원 수
		public List<MemberDTO> getMemberList(Map<String, Object> map); //검색 회원 목록
		public List<QnaDTO> getMemberQna(String userid); //회원이 작성한 최근 QnA 목록
		public List<ReservDTO> getMemberReserv(String userid); //회원의 최근 예약 목록
		public void deleteMember(Map<String,Object> map); //회원 탈퇴(목록)
		//전시
		public int codeCheck(String code); //코드 중복 체크
		public int countExbIng(String today); //진행 중인 전시 개수
		public int countSearchExb(Map<String, Object> map); //검색 대상 전시 수
		public List<MemberDTO> getExbList(Map<String, Object> map); //검색 전시 목록
		public void insertExb(ExhibitionDTO dto); //전시 등록
		public void insertProductInfo(ProductInfoDTO idto); //전시 정보 등록 - 개별 테이블
		public ExhibitionDTO getExbView(String code); //전시 상세(수정페이지)
		public void updateExb(ExhibitionDTO dto); //전시 수정
		public void updateProductInfo(ProductInfoDTO idto); //전시 정보 수정 - 개별 테이블
		public void deleteExbFile(Map<String, Object> map); //전시 파일 정보 삭제
		//예약
		public int countRsvToday(String today); //오늘 예약 개수
		public int countRsvPaid(); //결제된 예약 개수
		public int countSearchRsv(Map<String, Object> map); //검색 대상 예약 수
		public List<ReservDTO> getReservList(Map<String, Object> map); //검색 예약 목록
		//QNA
		public int countQnaNew(); //답변이 필요한 QnA 개수
		public int countQnaToday(String today); //오늘 등록된 QnA 개수
		public int countSearchQna(Map<String, Object> map); //검색 대상 QnA 개수
		public List<QnaDTO> getQnaList(Map<String, Object> map); //검색 QnA 목록
		//팝업
		public int countSearchPopup(Map<String, Object> map); //검색 대상 팝업 개수
		public List<PopupDTO> getPopupList(Map<String, Object> map); //검색 팝업 목록
		public PopupDTO getPopupView(int no); //팝업 상세(수정페이지)
		public void insertPopup(PopupDTO dto); //팝업 등록
		public void updatePopup(PopupDTO dto); //팝업 수정
		public void deletePopupFile(int no); //팝업 파일정보 삭제
		public List<PopupDTO> getPopupOn(String today); //노출 중인 팝업 목록
}
