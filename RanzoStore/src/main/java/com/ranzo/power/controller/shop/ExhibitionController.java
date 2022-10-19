package com.ranzo.power.controller.shop;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.service.shop.ExhibitionService;

@Controller
@RequestMapping("shop/exhibition/*")
public class ExhibitionController {
	
	@Inject
	ExhibitionService exhibitionService;

	// 전시 리스트
	@RequestMapping("list.do") // 세부 rul
	public ModelAndView list(ModelAndView mav) {
		// 포워딩할 뷰
		mav.setViewName("/shop/exhibition_list");
		// 전달할 데이터
		mav.addObject("list", exhibitionService.listProduct());
		return mav;
	}
	
	// 전시 상세
	@RequestMapping("detail/{exhibitionCode}")
	public ModelAndView detail(@PathVariable String exhibitionCode, ModelAndView mav) {
		// 포워딩할 뷰
		mav.setViewName("/shop/exhibition_detail");
		// 전달할 데이터
		mav.addObject("exhibition", exhibitionService.detailProduct(exhibitionCode));
		return mav;
	}
}
