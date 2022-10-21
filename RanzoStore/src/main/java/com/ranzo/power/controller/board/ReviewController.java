package com.ranzo.power.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.model.board.dto.ReviewDTO;
import com.ranzo.power.service.board.ReviewService;

@Controller
@RequestMapping("board/review/*")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	ReviewService reviewService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		List<ReviewDTO> list = reviewService.listAll();
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", list.size());
		mav.setViewName("reviewboard/list");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "reviewboard/write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ReviewDTO dto) throws Exception {
		
		reviewService.create(dto);
		return "redirect:/board/review/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(int bno) throws Exception {
		//조회수 증가 처리
		reviewService.increaseViewcnt(bno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewboard/view");
		mav.addObject("dto", reviewService.read(bno));
		return mav;
	}
	
	//게시물 수정
	@RequestMapping("update.do")
	public String update(ReviewDTO dto) throws Exception {
		if(dto != null) {
			reviewService.update(dto);
		}
		return "redirect:/board/review/view.do?bno="+dto.getBno();
	}
	
	
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		reviewService.delete(bno);
		return "redirect:/board/review/list.do";
	}
	
}
