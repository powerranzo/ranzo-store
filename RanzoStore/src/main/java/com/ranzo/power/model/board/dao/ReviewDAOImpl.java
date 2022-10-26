package com.ranzo.power.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ranzo.power.model.board.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession sqlSession;
	
	//첨부파일 레코드 삭제
	@Override
	public void deleteFile(String fullName) {
		sqlSession.delete("review.deleteFile", fullName);

	}

	@Override
	public List<String> getAttach(int bno) {
		return sqlSession.selectList("review.getAttach", bno);
	}

	@Override
	public void addAttach(String fullName) {
		sqlSession.insert("review.addAttach",fullName);
	}

	//첨부파일 정보 수정
	@Override
	public void updateAttach(String fullName, int bno) {
		Map<String,Object> map = new HashMap<>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		sqlSession.insert("review.updateAttach", map);
	}
	
	@Override
	public void create(ReviewDTO dto) throws Exception {
		sqlSession.insert("review.insert", dto);

	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		sqlSession.update("review.update",dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("review.delete", bno);

	}

	@Override
	public List<ReviewDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("review.listAll", map);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("review.increaseViewcnt", bno);

	}

	@Override
	public int countArticle() throws Exception {
		return sqlSession.selectOne("review.countArticle");
	}

	@Override
	public ReviewDTO read(int bno) throws Exception {
		return sqlSession.selectOne("review.read",bno);
	}

}
