package com.ranzo.power.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.model.board.dto.ReviewReplyDTO;
import com.ranzo.power.service.board.ReviewReplyService;



@Controller
@RequestMapping("board/reviewreply/*")
public class ReviewReplyController {
	
	@Inject
	ReviewReplyService reviewReplyService;
	
	@RequestMapping("insert.do")
	public void insert(ReviewReplyDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReplyer(userid);
		//댓글 테이블에 저장
		reviewReplyService.create(dto); 
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int bno, ModelAndView mav) {
		List<ReviewReplyDTO> list = reviewReplyService.list(bno); //댓글목록
		mav.setViewName("reviewboard/reply_list");
		mav.addObject("list", list);
		return mav;
	}
}
