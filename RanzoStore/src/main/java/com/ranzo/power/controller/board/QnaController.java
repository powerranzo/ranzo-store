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

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.service.board.QnaService;

@Controller
@RequestMapping("board/qna/*")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Inject
	QnaService qnaService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		List<QnaDTO> list = qnaService.listAll();
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", list.size()); //레코드 개수 파일
		mav.setViewName("qnaboard/list");
		mav.addObject("map", map); //보낼 데이터
		return mav;		
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "qnaboard/write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute QnaDTO dto) throws Exception {
		qnaService.create(dto);
		return "redirect:/board/qna/list.do";
	}
}
