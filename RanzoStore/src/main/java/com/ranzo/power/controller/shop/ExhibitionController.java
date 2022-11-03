package com.ranzo.power.controller.shop;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.service.shop.ExhibitionService;

@Controller
@RequestMapping("shop/exhibition/*")
public class ExhibitionController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	ExhibitionService exhibitionService;

	// 전시 리스트
	@RequestMapping("list") // 세부 rul
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/shop/exhibition_list");
		mav.addObject("list", exhibitionService.listProduct());
		logger.debug("ExhController/list {}." + mav);
		return mav;
	}

	// 전시 상세
	@RequestMapping("detail/{exhibitionCode}")
	public ModelAndView detail(@PathVariable String exhibitionCode, ModelAndView mav) {
		mav.setViewName("/shop/exhibition_detail");
		mav.addObject("exhibition", exhibitionService.detailProduct(exhibitionCode));
		logger.debug(mav.toString());
		logger.debug("ExhController/list {}." + mav);
		return mav;
	}

}
