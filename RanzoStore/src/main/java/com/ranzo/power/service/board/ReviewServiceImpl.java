package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.board.dao.ReviewDAO;
import com.ranzo.power.model.board.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO reviewDao;
	
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
	public void updateAttach(String fullname, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(ReviewDTO dto) throws Exception {
		reviewDao.create(dto);

	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) throws Exception {
		reviewDao.delete(bno);

	}

	@Override
	public List<ReviewDTO> listAll() throws Exception {
		return reviewDao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		reviewDao.increaseViewcnt(bno);

	}

	@Override
	public int countArticle() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDTO read(int bno) throws Exception {
		return reviewDao.read(bno);
	}

}
