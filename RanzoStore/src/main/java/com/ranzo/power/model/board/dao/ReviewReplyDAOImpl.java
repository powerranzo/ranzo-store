package com.ranzo.power.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.ReviewReplyDTO;

@Repository
public class ReviewReplyDAOImpl implements ReviewReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReviewReplyDTO> list(int bno) {
		return sqlSession.selectList("review.listReply", bno);
	}

	@Override
	public int count(int bno) {
		return 0;
	}

	//댓글 추가
	@Override
	public void create(ReviewReplyDTO dto) {
		sqlSession.insert("review.insertReply", dto);
	}

}
