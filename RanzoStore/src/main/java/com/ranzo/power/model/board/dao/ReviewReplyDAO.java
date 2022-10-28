package com.ranzo.power.model.board.dao;

import java.util.List;

import com.ranzo.power.model.board.dto.ReviewReplyDTO;

public interface ReviewReplyDAO {
	public List<ReviewReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReviewReplyDTO dto);
}
