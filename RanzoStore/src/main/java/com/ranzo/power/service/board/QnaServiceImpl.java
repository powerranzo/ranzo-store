package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ranzo.power.model.board.dao.QnaDAO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.board.dto.ReviewDTO;
@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	QnaDAO qnaDao;
	
	
	@Override
	public void create(QnaDTO dto) throws Exception {
		qnaDao.create(dto);
	}
	
	
	@Override
	public void update(QnaDTO dto) throws Exception {
		qnaDao.update(dto);
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
		qnaDao.update_reply(dto);		
	}


	@Override
	public List<QnaDTO> getQnaInfo(String code) {
		return qnaDao.getQnaInfo(code);
	}


	@Override
	public int countArticle(String code) {
		return qnaDao.countArticle(code);
	}

}
