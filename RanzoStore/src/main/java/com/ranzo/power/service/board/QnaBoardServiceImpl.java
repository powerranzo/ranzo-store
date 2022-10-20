package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	//글쓰기, 첨부파일 등록이 하나의 트랜잭션 단위가 됨
	@Transactional
	@Override
	public void create(QnaBoardDTO dto) throws Exception {
		//board 테이블에 레코드 추가
		qnaboardDao.create(dto);
		//attach 테이블에 레코드 추가
		String[] files = dto.getFiles(); //첨부파일 이름 배열
		if(files == null) return; //첨부파일이 없으면 skip
		for(String name : files) {
			qnaboardDao.addAttach(name); //attach 테이블에 insert
		}		
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
