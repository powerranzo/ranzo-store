package com.ranzo.power.controller.shop;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.service.shop.ExhibitionService;

@Controller
@RequestMapping("shop/exhibition/*")
public class ExhibitionController {
	
	@Inject
	ExhibitionService exhibitionService;

	@RequestMapping("list.do") // 세부 rul
	public ModelAndView list(ModelAndView mav) {
		// 포워딩할 뷰
		mav.setViewName("/shop/exhibition_list");
		// 전달할 데이터
		mav.addObject("list", exhibitionService.listProduct());
		return mav;
	}
}
