package com.ranzo.power.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name=sqlSession.selectOne("member.loginCheck", dto);
		return (name==null) ? false : true;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}
	
	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember", dto);
	}

	@Override
	public int idChk(MemberDTO dto) {
		return sqlSession.selectOne("member.idChk", dto);
	}

	@Override
	public boolean adminCheck(String userid) {
		String name=sqlSession.selectOne("member.adminCheck", userid);
		return (name==null) ? false : true;
	}
	
}
