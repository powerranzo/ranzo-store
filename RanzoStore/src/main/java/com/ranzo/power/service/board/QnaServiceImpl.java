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
		qnaDao.deleteFile(fullName);

	}

	@Override
	public List<String> getAttach(int bno) {
		return qnaDao.getAttach(bno);
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
//	@Transactional
	@Override
	public void create(QnaDTO dto) throws Exception {
		//qna_tb 테이블에 레코드 추가
		qnaDao.create(dto);
		//qna_attach_tb 테이블에 레코드 추가
//		String[] files = dto.getFiles(); //첨부파일 이름 배열
//		if(files==null) return; //첨부파일 없으면 넘어가기
//		for(String name : files) {
//			qnaDao.addAttach(name); //qna_attach_tb에 insert
//		}
	}
	
	@Transactional
	@Override
	public void update(QnaDTO dto) throws Exception {
		qnaDao.update(dto);
		
		String[] files = dto.getFiles(); //첨부파일 이름 배열
		if(files==null) return; //첨부파일 없으면 넘어가기
		for(String name : files) {
			System.out.println("첨부파일 이름 : " + name);
			qnaDao.updateAttach(name, dto.getBno());
		}

	}

	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		qnaDao.delete(bno);

	}

	@Override
	public List<QnaDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		return qnaDao.listAll(search_option, keyword, start, end);
	}
	
	//조회수 증가 처리
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		//세션처리
		
		
		qnaDao.increaseViewcnt(bno);

	}

	@Override
	public int countArticle() throws Exception {
		return qnaDao.countArticle();
	}

	@Override
	public QnaDTO read(int bno) throws Exception {
		return qnaDao.read(bno);
	}

}
