package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ranzo.power.model.board.dao.QnaDAO;
import com.ranzo.power.model.board.dto.QnaDTO;
@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	QnaDAO qnaDao;
	
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
	
	//글쓰기,첨부파일 등록 => 하나의 트랜잭션 단위
	@Transactional
	@Override
	public void create(QnaDTO dto) throws Exception {
		//qna_tb 테이블에 레코드 추가
		qnaDao.create(dto);
		//qna_attach_tb 테이블에 레코드 추가
		String[] files = dto.getFiles();
		if(files==null) return; //첨부파일 없으면 넘어가기
		for(String name : files) {
			qnaDao.addAttach(name); //qna_attach_tb에 insert
		}
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
		return qnaDao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		qnaDao.increaseViewcnt(bno);

	}

	@Override
	public int countArticle() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QnaDTO read(int bno) throws Exception {
		return qnaDao.read(bno);
	}

}
