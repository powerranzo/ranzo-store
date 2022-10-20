package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.board.dao.QnaBoardDAO;
import com.ranzo.power.model.board.dto.QnaBoardDTO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	@Inject
	QnaBoardDAO qnaboardDao;
	
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
		qnaboardDao.create(dto);
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
		return qnaboardDao.listAll();
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
