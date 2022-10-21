package com.ranzo.power.controller.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView list(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword
			) throws Exception {
		
		
		List<QnaDTO> list = qnaService.listAll(search_option,keyword);
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", list.size()); //레코드 개수 파일
		
		map.put("search_option", search_option);
		map.put("keyword", keyword);
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
		//세션 추가해야함
		
		qnaService.create(dto);
		return "redirect:/board/qna/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(int bno) throws Exception {
		//세션 추가해야함
		
		//조회수 증가 처리
		qnaService.increaseViewcnt(bno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaboard/view");
		mav.addObject("dto", qnaService.read(bno));
		return mav;
	}
	
	//첨부파일 목록 리턴
	//ArrayList를 json 배열로 변환하여 리턴
	@RequestMapping("getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable int bno) {
		return qnaService.getAttach(bno);
	}
	
	
	//게시물 수정
	@RequestMapping("update.do")
	public String update(QnaDTO dto) throws Exception {
		if(dto != null) {
			qnaService.update(dto);
		}
		//상세화면으로 리턴
		return "redirect:/board/qna/view.do?bno="+dto.getBno();
	}
	
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		qnaService.delete(bno);
		return "redirect:/board/qna/list.do";
	}
		
		
}
