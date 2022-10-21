package com.ranzo.power.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullname, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(ReviewDTO dto) throws Exception {
		sqlSession.insert("review.insert", dto);

	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("review.delete", bno);

	}

	@Override
	public List<ReviewDTO> listAll() throws Exception {
		return sqlSession.selectList("review.listAll");
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("review.increaseViewcnt", bno);

	}

	@Override
	public int countArticle() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDTO read(int bno) throws Exception {
		return sqlSession.selectOne("review.read",bno);
	}

}
