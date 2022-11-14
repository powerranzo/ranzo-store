package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countTbAll(String table) {
		return sqlSession.selectOne("admin.countTbAll", table);
	}

	@Override
	public int countMemberToday(String now) {
		return sqlSession.selectOne("admin.countMemberToday", now);
	}

	@Override
	public int countMemberQuit() {
		return sqlSession.selectOne("admin.countMemberQuit");
	}
	
	@Override
	public int countSearchMember(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchMember", map);
	}
	@Override
	public List<MemberDTO> getMemberList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getMemberList", map); 
	}
	
	@Override
	public MemberDTO getMemberView(String userid) {
		return sqlSession.selectOne("admin.getMemberView", userid);
	}
	
	@Override
	public List<QnaDTO> getMemberQna(String userid) {
		return sqlSession.selectList("admin.getMemberQna", userid);
	}
	
	@Override
	public List<ReservDTO> getMemberReserv(String userid) {
		return sqlSession.selectList("admin.getMemberReserv", userid);
	}
	
	@Override
	public void deleteMember(Map<String, Object> map) {
		sqlSession.update("admin.deleteMember", map);

	}
	
	@Override
	public void updateShowN(Map<String, Object> map) {
		sqlSession.update("admin.updateShowN", map);
		
	}

	@Override
	public int countExbIng(String today) {
		return sqlSession.selectOne("admin.countExbIng", today);
	}

	@Override
	public int countSearchExb(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchExb", map);
	}

	@Override
	public List<MemberDTO> getExbList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getExbList", map);
	}

	@Override
	public void insertExb(ExhibitionDTO dto) {
		sqlSession.insert("admin.insertExb", dto);
	}

	@Override
	public ExhibitionDTO getExbView(String code) {
		return sqlSession.selectOne("admin.getExbView", code);
	}
	
	@Override
	public void updateExb(ExhibitionDTO dto) {
		sqlSession.update("admin.updateExb",dto);
	}

	@Override
	public void deleteExbFile(Map<String, Object> map) {
		sqlSession.update("admin.deleteExbFile",map);
	}
	
	@Override
	public void deleteExb(String code) {
		sqlSession.update("admin.deleteExb",code);
	}

	@Override
	public int countSearchReserv(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchReserv", map);
	}
	
	@Override
	public int countReservPay() {
		return sqlSession.selectOne("admin.countReservPay");
	}

	@Override
	public List<ReservDTO> getReservList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getReservList", map);
	}
	
	@Override
	public int countQnaNew() {
		return sqlSession.selectOne("admin.countQnaNew");
	}
	
	@Override
	public int countQnaDel() {
		return sqlSession.selectOne("admin.countQnaDel");
	}
	
	@Override
	public int countSearchQna(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchQna", map);
	}

	@Override
	public List<QnaDTO> getQnaList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getQnaList", map);
	}

	@Override
	public int countSearchPopup(Map<String, Object> map) {
		return sqlSession.selectOne("admin.countSearchPopup", map);
	}

	@Override
	public List<PopupDTO> getPopupList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getPopupList", map);
	}

	@Override
	public PopupDTO getPopupView(int no) {
		return sqlSession.selectOne("admin.getPopupView", no);
	}

	@Override
	public void insertPopup(PopupDTO dto) {
		sqlSession.insert("admin.insertPopup", dto);
	}

	@Override
	public void deletePopupFile(int no) {
		sqlSession.update("admin.deletePopupFile",no);
	}

	@Override
	public void updatePopup(PopupDTO dto) {
		sqlSession.update("admin.updatePopup",dto);
	}

	@Override
	public void popupShow(int no) {
		sqlSession.update("admin.popupShow", no);
	}

	@Override
	public List<PopupDTO> getPopupOn(String today) {
		return sqlSession.selectList("admin.getPopupOn", today);
	}

	@Override
	public void insertProductInfo(ProductInfoDTO idto) {
		sqlSession.insert("admin.insertProductInfo", idto);
	}

	@Override
	public ProductInfoDTO getProductInfoView(String code) {
		return sqlSession.selectOne("admin.getProductInfoView", code);
	}

	@Override
	public void updateProductInfo(ProductInfoDTO idto) {
		sqlSession.update("admin.updateProductInfo", idto);
		
	}

}
