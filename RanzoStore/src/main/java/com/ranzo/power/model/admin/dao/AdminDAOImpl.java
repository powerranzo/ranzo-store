package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countMemberAll() {
		return sqlSession.selectOne("admin.countMemberAll");
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
	public void deleteMember(Map<String, Object> map) {
		sqlSession.update("admin.deleteMember", map);

	}
	
	@Override
	public void deleteQna(Map<String, Object> map) {
		sqlSession.update("admin.deleteQna", map);
		
	}


	@Override
	public int countExbIng(String today) {
		return sqlSession.selectOne("admin.countExbIng", today);
	}

	@Override
	public int countExbAll() {
		return sqlSession.selectOne("admin.countExbAll");
	}

	@Override
	public List<MemberDTO> getExbList(Map<String, Object> map) {
		return sqlSession.selectList("admin.getExbList", map);
	}

	@Override
	public void insertExb(ExhibitionDTO dto) {
		sqlSession.insert("admin.insertExb");
	}



}
