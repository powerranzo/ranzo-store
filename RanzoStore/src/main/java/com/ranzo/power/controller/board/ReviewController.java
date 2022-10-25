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
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage) throws Exception {
		//레코드 개수 계산
		int count = reviewService.countArticle();
		//페이지 관련 설정
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		
		List<ReviewDTO> list = reviewService.listAll(start,end);
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count); //레코드 개수 파일
		map.put("pager", pager); //페이지 네비게이션
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
	
	//게시물 내용 수정
	@RequestMapping("update.do")
	public String update(ReviewDTO dto) throws Exception {
		System.out.println("dto : "+ dto);
		if(dto != null) {
			reviewService.update(dto);
		}
		return "redirect:/board/review/view.do?bno="+dto.getBno();
	}
	
	//게시물 삭제
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		reviewService.delete(bno);
		return "redirect:/board/review/list.do";
	}
}
