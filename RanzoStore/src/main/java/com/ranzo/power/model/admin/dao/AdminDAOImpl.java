package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countTbAll(String table) {
		return sqlSession.selectOne("admin.countTbAll", table);
	}
//	@Override
//	public int countMemberAll() {
//		return sqlSession.selectOne("admin.countMemberAll");
//	}

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
	
//	@Override
//	public void deleteReserv(Map<String, Object> map) {
//		sqlSession.update("admin.deleteQna", map);
//	}

	@Override
	public int countExbIng(String today) {
		return sqlSession.selectOne("admin.countExbIng", today);
	}

//	@Override
//	public int countExbAll() {
//		return sqlSession.selectOne("admin.countExbAll");
//	}

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
	public void deleteFile(Map<String, Object> map) {
		sqlSession.update("admin.deleteFile",map);
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
	public List<ReservDTO> getReservList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getReservList", map);
	}

	@Override
	public int countReservIng(String today) {
		// TODO Auto-generated method stub
		return 0;
	}




}
