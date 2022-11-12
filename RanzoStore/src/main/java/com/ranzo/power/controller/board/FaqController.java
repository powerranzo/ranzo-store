package com.ranzo.power.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.model.board.dto.FaqDTO;
import com.ranzo.power.service.board.FaqService;
import com.ranzo.power.service.board.Pager;

@Controller
@RequestMapping("faq/*")
public class FaqController {
	
	@Inject
	FaqService faqService;
	
	//FAQ 리스트
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav, 
			@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String skeyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception{		
		int count=faqService.countList();
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();	
		List<FaqDTO> list = faqService.listAll(searchOption, skeyword, start, end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("searchOption", searchOption);
		map.put("skeyword", skeyword);
		mav.setViewName("/faq/faqList");
		mav.addObject("map",map);
		return mav;
	}
	//세부리스트 불러오기
	@ResponseBody
	@RequestMapping("reservlist.do")
	public ModelAndView reservlist(ModelAndView mav, 
			@RequestParam("data") String data,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {		
		int count=faqService.resultCount(data);
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();	
		List<FaqDTO> list = faqService.reservList(data, start, end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		mav.setViewName("/faq/resultList");
		mav.addObject("map",map);
		return mav;
	}
	//상세보기
	@RequestMapping("view.do")
	public ModelAndView detail(ModelAndView mav, int no) {
		mav.setViewName("/faq/view");
		mav.addObject("dto", faqService.view(no));
		return mav;
	}
	//FAQ작성 페이지로 이동
	@RequestMapping("write.do")
	public String write() {
		return "faq/write";
	}
	//FAQ 추가	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute FaqDTO dto) throws Exception {
		faqService.insert(dto);
		return "redirect:/faq/list.do";
	}
	//업데이트 페이지로 이동
	@RequestMapping("update.do")
	public ModelAndView updatepage(FaqDTO dto, ModelAndView mav, int no)throws Exception {
		mav.setViewName("faq/update");
		mav.addObject("dto", faqService.view(no));
		return mav;
	}
	//정보 업데이트
	@RequestMapping("update/{no}")
	public String update(FaqDTO dto)throws Exception{
		if(dto != null) {
			faqService.update(dto);
		}
		return "redirect:/faq/view.do?no="+dto.getNo();
	}
	//faq삭제
	@RequestMapping("delete/{no}")
	public String delete(int no)throws Exception{
		faqService.delete(no);
		return "redirect:/faq/list.do";
	}


	
}
