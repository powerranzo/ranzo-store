package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;
	
	//테이블의 전체 레코드 개수
	@Override
	public int countTbAll(String table) {
		return sqlSession.selectOne("admin.countTbAll", table);
	}
	
	//테이블의 show 컬럼을 n으로 변경
	@Override
	public void updateShowN(Map<String, Object> map) {
		sqlSession.update("admin.updateShowN", map);
	}

	//테이블의 show 컬럼을 y로 변경
	@Override
	public void updateShowY(Map<String, Object> map) {
		sqlSession.update("admin.updateShowY", map);
		
	}

	//신규 가입 회원 수
	@Override
	public int countMemberToday(String now) {
		return sqlSession.selectOne("admin.countMemberToday", now);
	}

	//탈퇴 회원 수
	@Override
	public int countMemberQuit() {
		return sqlSession.selectOne("admin.countMemberQuit");
	}
	
	//검색 대상 회원 수
	@Override
	public int countSearchMember(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchMember", map);
	}
	
	//검색 회원 목록
	@Override
	public List<MemberDTO> getMemberList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getMemberList", map); 
	}
	

	//회원이 작성한 최근 QnA 목록
	@Override
	public List<QnaDTO> getMemberQna(String userid) {
		return sqlSession.selectList("admin.getMemberQna", userid);
	}
	
	//회원의 최근 예약 목록
	@Override
	public List<ReservDTO> getMemberReserv(String userid) {
		return sqlSession.selectList("admin.getMemberReserv", userid);
	}
	
	//회원 탈퇴(목록)
	@Override
	public void deleteMember(Map<String, Object> map) {
		sqlSession.update("admin.deleteMember", map);

	}
	
	//진행 중인 전시 개수
	@Override
	public int countExbIng(String today) {
		return sqlSession.selectOne("admin.countExbIng", today);
	}

	//검색 대상 전시 수
	@Override
	public int countSearchExb(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchExb", map);
	}

	//검색 전시 목록
	@Override
	public List<MemberDTO> getExbList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getExbList", map);
	}

	//전시 등록
	@Override
	public void insertExb(ExhibitionDTO dto) {
		sqlSession.insert("admin.insertExb", dto);
	}

	//전시 상세(수정페이지)
	@Override
	public ExhibitionDTO getExbView(String code) {
		return sqlSession.selectOne("admin.getExbView", code);
	}
	
	//전시 수정
	@Override
	public void updateExb(ExhibitionDTO dto) {
		sqlSession.update("admin.updateExb",dto);
	}

	//전시 파일 정보 삭제
	@Override
	public void deleteExbFile(Map<String, Object> map) {
		sqlSession.update("admin.deleteExbFile",map);
	}
	
	//오늘 예약 개수
	@Override
	public int countRsvToday(String today) {
		return sqlSession.selectOne("admin.countRsvToday", today);
	}

	//결제된 예약 개수
	@Override
	public int countRsvPaid() {
		return sqlSession.selectOne("admin.countRsvPaid");
	}
	
	//검색 대상 예약 개수
	@Override
	public int countSearchRsv(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchRsv", map);
	}

	//검색 예약 목록
	@Override
	public List<ReservDTO> getReservList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getReservList", map);
	}
	
	//답변이 필요한 QnA 개수
	@Override
	public int countQnaNew() {
		return sqlSession.selectOne("admin.countQnaNew");
	}
	
	//오늘 등록된 QnA 개수
	@Override
	public int countQnaToday(String today) {
		return sqlSession.selectOne("admin.countQnaToday", today);
	}
	
	//검색 대상 QnA 개수
	@Override
	public int countSearchQna(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchQna", map);
	}

	//검색 QnA 목록
	@Override
	public List<QnaDTO> getQnaList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getQnaList", map);
	}

	//검색 대상 팝업 개수
	@Override
	public int countSearchPopup(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchPopup", map);
	}

	//검색 팝업 목록
	@Override
	public List<PopupDTO> getPopupList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getPopupList", map);
	}

	//팝업 상세(수정페이지)
	@Override
	public PopupDTO getPopupView(int no) {
		return sqlSession.selectOne("admin.getPopupView", no);
	}

	//팝업 등록
	@Override
	public void insertPopup(PopupDTO dto) {
		sqlSession.insert("admin.insertPopup", dto);
	}
	
	//팝업 수정
	@Override
	public void updatePopup(PopupDTO dto) {
		sqlSession.update("admin.updatePopup",dto);
	}
	
	//팝업 파일정보 삭제
	@Override
	public void deletePopupFile(int no) {
		sqlSession.update("admin.deletePopupFile",no);
	}

	//노출 중인 팝업 목록
	@Override
	public List<PopupDTO> getPopupOn(String today) {
		return sqlSession.selectList("admin.getPopupOn", today);
	}

	//전시 정보 등록 - 개별 테이블
	@Override
	public void insertProductInfo(ProductInfoDTO idto) {
		sqlSession.insert("admin.insertProductInfo", idto);
	}

	//전시 정보 수정 - 개별 테이블
	@Override
	public void updateProductInfo(ProductInfoDTO idto) {
		sqlSession.update("admin.updateProductInfo", idto);
		
	}

}