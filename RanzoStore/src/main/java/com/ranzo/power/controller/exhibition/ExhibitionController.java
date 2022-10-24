package com.ranzo.power.controller.exhibition;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.service.exhibition.ExhibitionService;

@Controller
@RequestMapping("exhibition/*")
public class ExhibitionController {
	
	@Inject
	ExhibitionService exhibitionService;
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/exhibition/list");
		mav.addObject("list", exhibitionService.listProduct());
		return mav;
	}

}
