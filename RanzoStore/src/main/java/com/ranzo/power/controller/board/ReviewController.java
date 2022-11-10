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

import com.ranzo.power.model.board.dto.ReviewDTO;
import com.ranzo.power.service.board.Pager;
import com.ranzo.power.service.board.ReviewService;

@Controller
@RequestMapping("board/review/*")
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	ReviewService reviewService;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		//레코드 개수 계산
		int count = reviewService.countArticle();
		//페이지 관련 설정
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
			
		List<ReviewDTO> list = reviewService.listAll(search_option,keyword,start,end);
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count); //레코드 개수 파일
		map.put("pager", pager); //페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("reviewboard/list");
		mav.addObject("map", map); //보낼 데이터
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
	
	@RequestMapping("view.do")
	public ModelAndView view(int bno, HttpSession session) throws Exception {
		//조회수 증가 처리
		reviewService.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewboard/view");
		mav.addObject("dto", reviewService.read(bno));
		return mav;
	}
	
	//수정하러 이동 
	@RequestMapping("edit.do")
	public ModelAndView edit(int bno, HttpSession session) throws Exception {
		//조회수 증가 처리
		reviewService.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewboard/edit");
		mav.addObject("dto", reviewService.read(bno));
		return mav;
	}
		
	//첨부파일 목록을 리턴
	//json 배열로 변환하여 리턴
	@RequestMapping("getAttach/{bno}")
	@ResponseBody //view가 아닌 List<String> 데이터 자체를 리턴
	public List<String> getAttach(@PathVariable int bno) {
		return reviewService.getAttach(bno);
	}
	
	//게시물 수정
	@RequestMapping("update.do")
	public String update(ReviewDTO dto) throws Exception {
		System.out.println("dto : "+ dto);
		if(dto != null) {
			reviewService.update(dto);
		}
		return "redirect:/board/review/list.do";
	}
	
	//게시물 삭제
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		reviewService.delete(bno);
		return "redirect:/board/review/list.do";
		
	}
}
