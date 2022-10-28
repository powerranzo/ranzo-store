package com.ranzo.power.service.board;

import java.util.List;

import com.ranzo.power.model.board.dto.ReviewReplyDTO;

public interface ReviewReplyService {
	public List<ReviewReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReviewReplyDTO dto);
}
