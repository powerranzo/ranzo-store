package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.board.dao.ReviewReplyDAO;
import com.ranzo.power.model.board.dto.ReviewReplyDTO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Inject
	ReviewReplyDAO reviewReplyDao;
	
	@Override
	public List<ReviewReplyDTO> list(int bno) {		
		return reviewReplyDao.list(bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	//댓글 작성
	@Override
	public void create(ReviewReplyDTO dto) {
		reviewReplyDao.create(dto);
	}

}
