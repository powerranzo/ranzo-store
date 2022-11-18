package com.ranzo.power.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;
import com.ranzo.power.service.shop.ExhibitionService;

@Controller
@RequestMapping("shop/exhibition/*")
public class ExhibitionController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	ExhibitionService exhibitionService;

	// 현재전시 페이지
	@RequestMapping("list/current") // 세부 rul
	public ModelAndView listCurrent(ModelAndView mav) {
		mav.setViewName("/shop/exhibition_current");
		// mav.addObject("list", exhibitionService.listProduct());
		logger.debug("ExhController/listCurrent/" + mav);
		return mav;
	}

	// 전시 리스트
	@RequestMapping("list") // 세부 rul
	public ModelAndView getList(
			@RequestParam(defaultValue = "리뷰 많은순") String sort,
			@RequestParam(defaultValue = "전체") List<String> location,			
			ModelAndView mav) {
		List<ExhibitionDTO> list = exhibitionService.listProduct(sort, location);
		
		logger.info("ExhController/getList/sort/" + sort);
		logger.info("ExhController/getList/location/" + location);
		
		mav.addObject("list", list);
		mav.setViewName("/shop/exhibition_list");
		//logger.info("ExhController/getList/" + list);
		return mav;
	}

	// 전시 상세 페이지
	@RequestMapping("detail/{exhibitionCode}")
	public ModelAndView detail(@PathVariable String exhibitionCode, ModelAndView mav) {
		mav.setViewName("/shop/exhibition_detail");
		mav.addObject("exhibition", exhibitionService.detailProduct(exhibitionCode));
		logger.info("ExhController/mav/" + mav);
		return mav;
	}

	// 전시 상세
	@RequestMapping("getProductInfo")
	public ModelAndView getProductInfo(String code, ModelAndView mav) throws Exception {
		logger.info("### getProductInfo/code = " + code);

		ProductInfoDTO productInfo = exhibitionService.getProductInfo(code);
		logger.info("### getProductInfo/productInfo = " + productInfo);
		mav.addObject("productInfo", productInfo); // 보낼 데이터
		mav.setViewName("shop/exhibition_detail_product");
		logger.info("### ExhController/mav/" + mav);
		return mav;
	}

	// 예매/취소 안내
	@RequestMapping("getReserveInfo")
	public ModelAndView getReserveInfo(String code, ModelAndView mav) throws Exception {
		logger.info("### reserveInfo/code = " + code);

		//String reserveInfo = exhibitionService.getReserveInfo(code);
		//logger.info("### getReserveInfo/reviewList {}. = " + reserveInfo);

		//mav.addObject("reserveInfo", reserveInfo); // 보낼 데이터
		mav.setViewName("shop/exhibition_detail_reserve");
		logger.info("### getReserveInfo/mav/" + mav);
		return mav;
	}
	//키워드 검색 리스트
	@RequestMapping("search.do")
	public ModelAndView list(@RequestParam(defaultValue = "") String keyword, ModelAndView mav) throws Exception {
		int count =exhibitionService.searchCount(keyword);
		List<ExhibitionDTO> list = exhibitionService.searchProduct(keyword);
		System.out.println("키워드: "+keyword);
		Map<String, Object> map = new HashMap<>();
		map.put("list",list);
		map.put("keyword", keyword);
		map.put("count", count);
		mav.setViewName("/shop/searchList");
		mav.addObject("map", map);		
		return mav;
	}
	//날짜 검색
	@RequestMapping("searchDate.do")
	public ModelAndView searchDatelist(@RequestParam(defaultValue = "") String searchDate, ModelAndView mav) throws Exception {
		int count =exhibitionService.searchDateCount(searchDate);
		List<ExhibitionDTO> list = exhibitionService.searchdate(searchDate);
		System.out.println("검색 날짜: "+searchDate);
		Map<String, Object> map = new HashMap<>();
		map.put("list",list);
		map.put("searchDate", searchDate);
		map.put("count", count);
		mav.setViewName("/shop/searchDateList");
		mav.addObject("map", map);		
		return mav;
	}

}
