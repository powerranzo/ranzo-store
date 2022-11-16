package com.ranzo.power.service.admin;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ranzo.power.controller.admin.AdminController;
import com.ranzo.power.model.admin.dao.AdminDAO;
import com.ranzo.power.model.admin.dto.MemberCountDTO;
import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dao.MemberDAO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;
import com.ranzo.power.util.DateUtils;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminDAO adminDao;
	
	@Inject
	MemberDAO memberDao;

	//관리자 홈			
	@Override
	public Map<String, Object> getHomeList() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("exb_all", adminDao.countTbAll("exhibition_tb"));
		map.put("exb_ing", adminDao.countExbIng(DateUtils.getToday()));	
//		map.put("exb_count_past", adminDao.countExbIng(DateUtils.getToday()));	
		map.put("rsv_all", adminDao.countTbAll("reserv_item_tb"));
		map.put("rsv_todqy", adminDao.countRsvToday(DateUtils.getToday()));
		map.put("rsv_paid", adminDao.countRsvPaid());
		map.put("qna_new", adminDao.countQnaNew());
		
		return map;
	}
	
	//회원 목록
	@Override
	public Map<String,Object> getMemberList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		//검색옵션 처리
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("join_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("searchOp", searchOp);
		//페이징 처리
		AdminPager pager = new AdminPager(adminDao.countSearchMember(map), curPage);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		//리스트 전달
		List<MemberDTO> list=adminDao.getMemberList(map);
		MemberCountDTO mcount=
				new MemberCountDTO(adminDao.countTbAll("member_tb"), 
				adminDao.countMemberToday(DateUtils.getToday()),
				adminDao.countMemberQuit());
		map.put("cnt", mcount);
		map.put("list", list);
		map.put("pager", pager);
		return map;
	}

	//회원 정보 내 QnA 목록
	@Override
	public List<QnaDTO> getMemberQna(String userid) {
		return adminDao.getMemberQna(userid);
	}
	
	//회원 정보 내 예약 목록
	@Override
	public List<ReservDTO> getMemberReserv(String userid) {
		return adminDao.getMemberReserv(userid);
	}

	//회원 탈퇴
	@Override
	public void deleteMember(String[] userids) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userids", userids);
		map.put("today", DateUtils.getToday());
		adminDao.deleteMember(map);
	}

	//Qna 목록 삭제
	@Override
	public void deleteQna(int[] bno) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "qna_tb");
		map.put("condition", "bno");
		map.put("list", bno);
		adminDao.updateShowN(map);

	}

	//전시 목록
	@Override
	public Map<String, Object> getExbList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		//검색옵션 처리
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("end_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("searchOp", searchOp);
		//페이징 처리
		AdminPager pager=new AdminPager(adminDao.countSearchExb(map), curPage);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		//리스트 전달
		List<MemberDTO> list=adminDao.getExbList(map); //확인
		map.put("exb_count_all", adminDao.countTbAll("exhibition_tb"));
		map.put("exb_count_ing", adminDao.countExbIng(DateUtils.getToday()));
		map.put("list", list);
		map.put("pager", pager);
		return map;
	}

	//전시 등록
	@Transactional
	@Override
	public void insertExb(ExhibitionDTO dto, ProductInfoDTO idto) {
		adminDao.insertExb(dto);
		adminDao.insertProductInfo(idto);
	}

	//전시 상세 정보(수정페이지)
	@Override
	public ExhibitionDTO getExbView(String code) {
		return adminDao.getExbView(code); //확인
	}
	
	//전시 수정
	@Transactional
	@Override
	public void updateExb(ExhibitionDTO dto, ProductInfoDTO idto) {
		adminDao.updateExb(dto);
		adminDao.updateProductInfo(idto);
	}
	
	//전시 종료시 파일 정보 초기화
	@Override
	public void deleteExbFile(String code, String fileType) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("code", code);
		map.put("fileType", fileType);
		adminDao.deleteExbFile(map);
	}

	//전시 종료
	@Override
	public void deleteExb(String[] code) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "exhibition_tb");
		map.put("condition", "code");
		map.put("list", code);
		adminDao.updateShowN(map);
	}
	
	//전시 재개
	@Override
	public void showExb(String[] code) {
//		adminDao.showExb(code);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "exhibition_tb");
		map.put("condition", "code");
		map.put("list", code); 
		adminDao.updateShowY(map);
	}
	
	//예약 목록
	@Override
	public Map<String, Object> getReservList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		//검색옵션 처리
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("reg_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		logger.info("RESERVELIST_ORDEROPTION:" + searchOp.getOrderOption());
		map.put("searchOp", searchOp);
		//페이징 처리
		AdminPager pager=new AdminPager(adminDao.countSearchRsv(map), curPage);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		//예약 리스트 전달
		List<ReservDTO> list=adminDao.getReservList(map);
		map.put("reserv_all", adminDao.countTbAll("reserv_item_tb"));
		map.put("reserv_pay", adminDao.countRsvPaid());
		map.put("reserv_today", adminDao.countRsvToday(DateUtils.getToday()));
		map.put("reserv_list", list);
		map.put("pager", pager);
		return map;
	}

	//예약 목록 삭제
	@Override
	public void deleteReserv(String[] no) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "reserv_item_tb");
		map.put("condition", "no");
		map.put("list", no);
		adminDao.updateShowN(map);
	}
	
	//Qna 목록
	@Override
	public Map<String, Object> getQnaList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		//검색옵션 처리
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("reg_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("searchOp", searchOp);
		//페이징 처리
		AdminPager pager=new AdminPager(adminDao.countSearchQna(map), curPage);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		//리스트 전달
		List<QnaDTO> list=adminDao.getQnaList(map);
		map.put("qna_new", adminDao.countQnaNew());
		map.put("qna_today", adminDao.countQnaToday(DateUtils.getToday()));
		map.put("qna_list", list);
		map.put("pager", pager);
		return map;
	}
	
	//팝업 목록
	@Override
	public Map<String, Object> getPopupList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		//검색옵션 처리
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("reg_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("searchOp", searchOp);
		//페이징 처리
		AdminPager pager=new AdminPager(adminDao.countSearchPopup(map), curPage);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		//리스트 전달
		List<PopupDTO> list=adminDao.getPopupList(map);
		map.put("popup_list", list);
		map.put("pager", pager);
		return map;
	}

	//팝업 상세 정보(수정페이지)
	@Override
	public PopupDTO getPopupView(int no) {
		return adminDao.getPopupView(no);
	}
	
	//팝업 등록
	@Override
	public void insertPopup(PopupDTO dto) {
		adminDao.insertPopup(dto);
	}

	//팝업 수정
	@Override
	public void updatePopup(PopupDTO dto) {
		adminDao.updatePopup(dto);
	}
	
	//팝업 파일정보 초기화
	@Override
	public void deletePopupFile(int no) {
		adminDao.deletePopupFile(no);
	}
	
	//팝업 종료
	@Override
	public void deletePopup(int[] no) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "popup_tb");
		map.put("condition", "no");
		map.put("list", no);
		adminDao.updateShowN(map);
	}

	//팝업 재개
	@Override
	public void popupShow(int[] no) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "popup_tb");
		map.put("condition", "no");
		map.put("list", no);
		adminDao.updateShowY(map);
	}

	//노출 중인 팝업
	@Override
	public List<PopupDTO> getPopupOn() {
		List<PopupDTO> list=new ArrayList<PopupDTO>();
		list=adminDao.getPopupOn(DateUtils.getToday());
		return list;
	}

}
