package com.ranzo.power.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {

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
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(QnaDTO dto) throws Exception {
		sqlSession.insert("qna.insert", dto);
	}

	@Override
	public void update(QnaDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(QnaDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<QnaDTO> listAll() throws Exception {
		return sqlSession.selectList("qna.listAll");
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int countArticle() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QnaDTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
