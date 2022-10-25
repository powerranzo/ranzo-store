package com.ranzo.power.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
		Map<String, Object> map = new HashMap<>();
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
	public String insert(@ModelAttribute ReviewDTO dto, HttpSession session) throws Exception {
		//세션처리
		String writer = (String)session.getAttribute("userid");
		dto.setWriter(writer);
		//레코드 저장
		reviewService.create(dto);
		return "redirect:/board/review/list.do";
	}
	

}
