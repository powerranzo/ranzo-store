package com.ranzo.power.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.QnaBoardDTO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

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
	public void create(QnaBoardDTO dto) throws Exception {
		sqlSession.insert("qnaboard.insert", dto);

	}

	@Override
	public void update(QnaBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(QnaBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<QnaBoardDTO> listAll() throws Exception {
		return sqlSession.selectList("qnaboard.listAll");
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
	public QnaBoardDTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
