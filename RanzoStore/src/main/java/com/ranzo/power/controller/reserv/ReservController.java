package com.ranzo.power.controller.reserv;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.service.reserv.ReservService;
import com.ranzo.power.service.shop.ExhibitionService;

@Controller
@RequestMapping("reserv/*")
public class ReservController {
	
	@Inject
	ExhibitionService exhibitionService;
	
	@Inject
	ReservService reservService;

	@RequestMapping("reserv.do")
	public String reserv(){
		return "reserv/reserv";
	}
	
	@ResponseBody
	@RequestMapping("result.do")
	public ReservDTO result(Model model, 
			@RequestParam(defaultValue = "0") int adult,
			@RequestParam(defaultValue = "0") int teen, 
			@RequestParam(defaultValue = "0") int kids){	
		return new ReservDTO(adult, teen, kids, null);
	}
	
	//예매페이지
	@RequestMapping("reserv/{code}")
	public ModelAndView detail(@PathVariable String code, ModelAndView mav) {
		//포워딩
		mav.setViewName("/reserv/reserv");
		//데이터
		mav.addObject("dto", exhibitionService.detailProduct(code));
		return mav;
	}
	//결제페이지
	@RequestMapping("pay/{code}")
	public String samplecontent3(HttpServletRequest httpServletRequest, Model model,@PathVariable String code) {
		String res_date = httpServletRequest.getParameter("res_date");
		int adult = Integer.parseInt(httpServletRequest.getParameter("adult"));
		int teen = Integer.parseInt(httpServletRequest.getParameter("teen"));
		int kids = Integer.parseInt(httpServletRequest.getParameter("kids"));
		model.addAttribute("res_date", res_date);
		model.addAttribute("adult", adult);
		model.addAttribute("teen", teen);
		model.addAttribute("kids", kids);
		model.addAttribute("dto", exhibitionService.detailProduct(code));
		return "/reserv/reserv_result";
	}
	//주문내역 추가
	@RequestMapping("reservInsert.do")
	public String reservInsert(HttpSession session, @ModelAttribute ReservDTO dto) {
		/*
		 * String userid=(String)session.getAttribute("userid"); dto.setUserid(userid);
		 */
		reservService.insert(dto);
		return "reserv/pay_result";
	}
	
	@RequestMapping("orderlist.do")//orderlist.do/{userid} //@PathVariable String userid
	public ModelAndView orderlist(ModelAndView mav) {
		String userid="kim";
		mav.setViewName("/reserv/orderlist");
		mav.addObject("list", reservService.listReserv(userid));		
		return mav;
	}
	@RequestMapping("orderdetail/{no}")
	public ModelAndView orderdetail(@PathVariable int no, ModelAndView mav) {
		mav.setViewName("/reserv/order_detail");
		mav.addObject("dto", reservService.detail(no));
		return mav;
	}
	
	
}
