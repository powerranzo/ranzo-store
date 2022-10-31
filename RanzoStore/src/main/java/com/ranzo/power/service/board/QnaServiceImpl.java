package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	
	@Transactional
	@Override
	public void create(QnaDTO dto) throws Exception {
		//qna_tb에 insert
		qnaDao.create(dto);
		//qna_attach_tb 테이블에 레코드 추가
		String[] files=dto.getFiles(); //첨부파일 이름 배열
		if(files==null) return; //첨부파일이 없으면 skip
		for(String name : files) {
			qnaDao.addAttach(name); 
		}
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
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno) != null) {
			//최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		long current_time = System.currentTimeMillis();
		//일정 시간(5초)이 경과한 후 조회수 증가
		if(current_time - update_time >5*1000) {
			//조회수 증가 처리
			qnaDao.increaseViewcnt(bno);	
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public int countArticle() throws Exception {
		return qnaDao.countArticle();
	}

	@Override
	public QnaDTO read(int bno) throws Exception {
		return qnaDao.read(bno);
	}

	//답글 작성
	@Override
	public void create_reply(QnaDTO dto) throws Exception {
		qnaDao.create_reply(dto);
		
	}

	//답글 순서 조정
	@Override
	public void update_reply(QnaDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
