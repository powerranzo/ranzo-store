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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.service.board.Pager;
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
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		
		//레코드 개수 계산
		int count = qnaService.countArticle();
		//페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		
		List<QnaDTO> list = qnaService.listAll(search_option,keyword,start,end);
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count); //레코드 개수 파일
		map.put("pager", pager); //페이지 네비게이션을 위한 변수
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
	public String insert(@ModelAttribute QnaDTO dto, HttpSession session) throws Exception {
		//세션 추가해야함
		String writer = (String)session.getAttribute("userid");
		dto.setWriter(writer);
		//레코드 저장
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
	
	//게시물 삭제
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		qnaService.delete(bno);
		return "redirect:/board/qna/list.do";
	}

		
}
