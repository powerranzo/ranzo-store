package com.ranzo.power.service.board;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.model.board.dao.ReviewDAO;
import com.ranzo.power.model.board.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	ReviewDAO reviewDao;

	@Override
	public void deleteFile(String fullName) {
		reviewDao.deleteFile(fullName);

	}

	@Override
	public List<String> getAttach(int bno) {
		return reviewDao.getAttach(bno);
	}

	// 첨부파일 정보 수정
	@Override
	public void addAttach(String fullName) {

	}

	@Override
	public void updateAttach(String fullname, int bno) {
		// TODO Auto-generated method stub

	}

	// @Transactional
	@Override
	public void create(ReviewDTO dto) throws Exception {
		reviewDao.create(dto);

		// attach 테이블에 레코드 추가
		/*
		 * String[] files = dto.getFiles(); //첨부파일 이름 배열 if(files==null) return;
		 * for(String name : files) { reviewDao.addAttach(name); //review_attach_tb테이블에
		 * insert }
		 */
	}

	// @Transactional
	@Override
	public void update(ReviewDTO dto) throws Exception {
		reviewDao.update(dto);

		/*
		 * String[] files = dto.getFiles(); //첨부파일 이름 배열 if(files==null) return;
		 * for(String name : files) { System.out.println("첨부파일 이름 : " +name);
		 * reviewDao.updateAttach(name, dto.getBno()); }
		 */
	}

	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		reviewDao.delete(bno);
	}

	@Override
	public List<ReviewDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		return reviewDao.listAll(search_option, keyword, start, end);
	}

	// 조회수 증가 처리
	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time = 0;
		if (session.getAttribute("update_time_" + bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (long) session.getAttribute("update_time_" + bno);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간(5초)이 경과한 후 조회수 증가
		if (current_time - update_time > 5 * 1000) {
			// 조회수 증가 처리
			reviewDao.increaseViewcnt(bno);
		}
		session.setAttribute("update_time_" + bno, current_time);
	}

	@Override
	public int countArticle() throws Exception {
		return reviewDao.countArticle();
	}

	@Override
	public int countArticle(String code) throws Exception {
		return reviewDao.countArticle(code);
	}

	@Override
	public ReviewDTO read(int bno) throws Exception {
		return reviewDao.read(bno);
	}

	@Override
	public List<ReviewDTO> getReviewInfo(String code) {
		List<ReviewDTO> list = reviewDao.getReviewInfo(code);
		logger.info("### rvwServ/getReviewInfo/"+list.size());
		if(list.size() > 0) {			
			// 정규식을 활용한 작성자 마스킹
			for(int i=0 ; i<list.size(); i++) {
				String writer = list.get(i).getWriter();
				// 작성자 id는 앞 2자리를 제외하고 *로 치환
				writer = writer.replaceAll("(?<=.{2}).", "*");
				list.get(i).setWriter(writer);
			}
		}
		return list;
	}

	@Override
	public float avgRating(String code) {
		float avgRating = reviewDao.avgRating(code);
		// 소수점 첫번재 까지만 
		avgRating = (float) (Math.round(avgRating * 10) / 10.0);
		return avgRating;
	}

}
