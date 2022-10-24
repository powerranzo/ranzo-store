package com.ranzo.power.service.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.admin.dao.AdminDAO;
import com.ranzo.power.model.admin.dto.MemberCountDTO;
import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.utils.DateFunction;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDao;

	@Override
	public Map<String,Object> getMemberList(SearchDTO searchOp, int curPage) {
		AdminPager pager=new AdminPager(adminDao.countMemberAll(), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("join_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		List<MemberDTO> list=adminDao.getMemberList(map);
		MemberCountDTO mcount=
				new MemberCountDTO(adminDao.countMemberAll(), 
						adminDao.countMemberToday(DateFunction.getToday()),
						adminDao.countMemberQuit());
		map.clear();
		map.put("mcount", mcount);
		map.put("list", list);
		map.put("pager", pager);
		return map;
	}

//	@Override
//	public MemberCountDTO getMemberCount() {
//		MemberCountDTO dto=
//				new MemberCountDTO(adminDao.countMemberAll(), 
//						adminDao.countMemberToday(DateFunction.getToday()),
//						adminDao.countMemberQuit());
//		return dto;
//	}

	@Override
	public MemberDTO getMemberView(String userid) {
		return adminDao.getMemberView(userid);
	}

	@Override
	public List<QnaDTO> getMemberQna(String userid) {
		return adminDao.getMemberQna(userid);
	}

	@Override
	public void deleteMember(String[] userids) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userids", userids);
		map.put("today", DateFunction.getToday());
		adminDao.deleteMember(map);
	}

	@Override
	public void deleteQna(String[] qna_bno) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("qna_bno", qna_bno);
		adminDao.deleteQna(map);

	}

	@Override
	public Map<String, Object> getExbList(SearchDTO searchOp, int curPage) {
		AdminPager pager=new AdminPager(adminDao.countExbAll(), curPage);
		if(searchOp.getOrderOption()==null) searchOp.setOrderOption("end_date");
		searchOp.setSearchKeyword(searchOp.getSearchKeyword().trim());
		Map<String,Object> map=new HashMap<>();
		map.put("searchOp", searchOp);
		map.put("start", pager.getPageBegin());
		map.put("end", pager.getPageEnd());
		List<MemberDTO> list=adminDao.getExbList(map);
		map.clear();
		map.put("searchOp", searchOp);
		map.put("exb_count_all", adminDao.countExbAll());
		map.put("exb_count_ing", adminDao.countExbIng(DateFunction.getToday()));
		map.put("list", list);
		map.put("pager", pager);
		System.out.println("return exb map:" + map);
		return map;
	}


	@Override
	public void insertExb(ExhibitionDTO dto) {
		adminDao.insertExb(dto);
		
	}

	@Override
	public List<PopupDTO> popupList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPopup(PopupDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePopup(PopupDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePopup(PopupDTO dto) {
		// TODO Auto-generated method stub

	}



}
