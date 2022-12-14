package com.ranzo.power.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.board.dto.ReviewDTO;
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
	
	public boolean pwdCheck(String userid, String passwd) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.pwdCheck", map);
		if(count == 1) result = true;
		return result;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember", dto);
	}

	@Override
	public void deleteMember(Map<String, Object> map) {
		sqlSession.delete("member.deleteMember", map);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return sqlSession.selectOne("member.findId", dto);
	}

	@Override
	public MemberDTO findPwd(MemberDTO dto) {
		return sqlSession.selectOne("member.findPwd", dto);
	}

	@Override 
	public void tempPwd(Map<String, String> map) { 
		sqlSession.update("member.tempPwd", map);
	}

	@Override
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sqlSession.insert("member.kakaoInsert", userInfo);
	}

	@Override
	public MemberDTO findkakao(HashMap<String, Object> userInfo) {
		System.out.println("?????????: "+userInfo.get("nickname"));
		System.out.println("?????????: "+userInfo.get("email"));
		return sqlSession.selectOne("member.findKakao", userInfo);
	}

	@Override
	public List<QnaDTO> qnaList() {
		return sqlSession.selectList("member.qnaList");
	}

	@Override
	public List<ReviewDTO> reviewList() {
		return sqlSession.selectList("member.reviewList");
	}

}
