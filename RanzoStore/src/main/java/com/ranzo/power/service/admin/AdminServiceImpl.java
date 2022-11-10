package com.ranzo.power.service.admin;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ranzo.power.controller.admin.AdminController;
import com.ranzo.power.model.admin.dao.AdminDAO;
import com.ranzo.power.model.admin.dto.MemberCountDTO;
import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.util.DateUtils;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminDAO adminDao;

	@Override
	public Map<String,Object> getMemberList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		AdminPager pager=new AdminPager(adminDao.countSearchMember(map), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("join_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		logger.info("Pager start:" + pager.getPageBegin() + "end:"+pager.getPageEnd());
		List<MemberDTO> list=adminDao.getMemberList(map);
		MemberCountDTO mcount=
				new MemberCountDTO(adminDao.countTbAll("member_tb"), 
						adminDao.countMemberToday(DateUtils.getToday()),
						adminDao.countMemberQuit());
		map.clear();
		map.put("mcount", mcount);
		map.put("list", list);
		map.put("pager", pager);
		return map;
	}

	@Override
	public MemberDTO getMemberView(String userid) {
		return adminDao.getMemberView(userid);
	}

	@Override
	public List<QnaDTO> getMemberQna(String userid) {
		return adminDao.getMemberQna(userid);
	}
	
	@Override
	public List<ReservDTO> getMemberReserv(String userid) {
		return adminDao.getMemberReserv(userid);
	}

	@Override
	public void deleteMember(String[] userids) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userids", userids);
		map.put("today", DateUtils.getToday());
		adminDao.deleteMember(map);
	}

	@Override
	public void deleteReserv(String[] reserv_no) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "reserv_item_tb");
		map.put("condition", "no");
		map.put("list", reserv_no);
		adminDao.updateShowN(map);
	}
	
	@Override
	public void deleteQna(int[] qna_bno) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "qna_tb");
		map.put("condition", "bno");
		map.put("list", qna_bno);
		adminDao.updateShowN(map);

	}

	@Override
	public Map<String, Object> getExbList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		AdminPager pager=new AdminPager(adminDao.countSearchExb(map), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("end_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		List<MemberDTO> list=adminDao.getExbList(map);
		map.put("exb_count_all", adminDao.countTbAll("exhibition_tb"));
		map.put("exb_count_ing", adminDao.countExbIng(DateUtils.getToday()));
		map.put("list", list);
		map.put("pager", pager);
		return map;
	}


	@Override
	public void insertExb(ExhibitionDTO dto) {
		adminDao.insertExb(dto);
	}
//	@Override
//	public void insertExb(String startDate, String endDate, 
//			ExhibitionDTO dto) {
//		try {
//			dto.setStart_date(DateFunction.stringToDate(startDate));
//			dto.setEnd_date(DateFunction.stringToDate(endDate));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		} 
//		adminDao.insertExb(dto);
//	}

	@Override
	public ExhibitionDTO getExbView(String code) {
		return adminDao.getExbView(code);
	}
	
	@Override
	public void updateExb(ExhibitionDTO dto) {
		adminDao.updateExb(dto);
	}
	
	@Override
	public void deleteExbFile(String code, String fileType) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("code", code);
		map.put("fileType", fileType);
		adminDao.deleteExbFile(map);
	}

	@Override
	public void deleteExb(String code) {
		adminDao.deleteExb(code);
	}
	
	@Override
	public Map<String, Object> getReservList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		logger.info("admin_countsearchreserv:"+adminDao.countSearchReserv(map));
		AdminPager pager=new AdminPager(adminDao.countSearchReserv(map), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("r.res_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		List<ReservDTO> list=adminDao.getReservList(map);
		map.put("reserv_count_all", adminDao.countTbAll("reserv_item_tb"));
		map.put("reserv_count_pay", adminDao.countReservPay());
		map.put("reserv_list", list);
		map.put("pager", pager);
		return map;
	}

	@Override
	public Map<String, Object> getQnaList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		AdminPager pager=new AdminPager(adminDao.countSearchQna(map), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("reg_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		List<QnaDTO> list=adminDao.getQnaList(map);
		map.put("qna_newcount", adminDao.countQnaNew());
		map.put("qna_delcount", adminDao.countQnaDel());
		map.put("qna_list", list);
		logger.info("qna_list:"+list);
		map.put("pager", pager);
		return map;
	}
	
	@Override
	public Map<String, Object> getPopupList(SearchDTO searchOp, int curPage) {
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		AdminPager pager=new AdminPager(adminDao.countSearchPopup(map), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("reg_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		List<PopupDTO> list=adminDao.getPopupList(map);
		map.put("popup_list", list);
		map.put("pager", pager);
		return map;
	}

	@Override
	public PopupDTO getPopupView(int no) {
		return adminDao.getPopupView(no);
	}
	
	@Override
	public void insertPopup(PopupDTO dto) {
		adminDao.insertPopup(dto);
	}

	@Override
	public void updatePopup(PopupDTO dto) {
		adminDao.updatePopup(dto);
	}

	@Override
	public void deletePopup(int[] no) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("value", "popup_tb");
		map.put("condition", "no");
		map.put("list", no);
		adminDao.updateShowN(map);
	}

	@Override
	public void deletePopupFile(int no) {
		adminDao.deletePopupFile(no);
	}

	@Override
	public void popupShow(int no) {
		adminDao.popupShow(no);
		
	}

	@Override
	public List<PopupDTO> getPopupOn() {
		List<PopupDTO> list=new ArrayList<PopupDTO>();
		list=adminDao.getPopupOn();
		list.remo 
		return list;
	}



}
