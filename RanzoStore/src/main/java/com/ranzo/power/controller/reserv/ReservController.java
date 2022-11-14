package com.ranzo.power.controller.reserv;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ranzo.power.service.board.Pager;
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
		@RequestMapping("detail/{exhibitionCode}")
		public ModelAndView detail2(@PathVariable String exhibitionCode, ModelAndView mav) {
			mav.setViewName("/reserv/reserv");
			mav.addObject("dto", exhibitionService.detailreserv(exhibitionCode));
			return mav;
		}
	
	//결제페이지
	@RequestMapping("pay/{code}")
	public String samplecontent3(HttpSession session, HttpServletRequest httpServletRequest, Model model,@PathVariable String code) {
		String userid = (String)session.getAttribute("userid");
		int firstorder = reservService.firstorder(userid);
		
		String res_date = httpServletRequest.getParameter("res_date");
		int adult = Integer.parseInt(httpServletRequest.getParameter("adult"));
		int teen = Integer.parseInt(httpServletRequest.getParameter("teen"));
		int kids = Integer.parseInt(httpServletRequest.getParameter("kids"));
		int coupon =0;
		model.addAttribute("coupon", coupon);
		model.addAttribute("res_date", res_date);
		model.addAttribute("adult", adult);
		model.addAttribute("teen", teen);
		model.addAttribute("kids", kids);
		model.addAttribute("firstorder", firstorder);
		model.addAttribute("dto", exhibitionService.detailreserv(code));	
		return "/reserv/reserv_result";
	}
	//주문내역 추가
	@RequestMapping("reservInsert.do")
	public String reservInsert(HttpSession session, @ModelAttribute ReservDTO dto) {
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);	 
		reservService.insert(dto);
		return "reserv/pay_result";
	}
	//주문내역 리스트 보기
	@RequestMapping("list.do/{userid}")//
	public ModelAndView orderlist(ModelAndView mav, @PathVariable String userid,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		int count = reservService.countorder(userid);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end =pager.getPageEnd();
		
		List<ReservDTO> list = reservService.listReserv(userid, start, end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count); //레코드 갯수 파일
		map.put("pager", pager); 
		
		mav.setViewName("/reserv/orderlist");
		mav.addObject("map", map);	
		return mav;
	}
	@RequestMapping("list2.do/{userid}")
	public ModelAndView list2(ModelAndView mav, @PathVariable String userid,
			@ModelAttribute ReservDTO dto,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {		
		String strDate = dto.getStrDate();
		String endDate = dto.getEndDate();
		
		int count = reservService.countorder_search(userid,strDate, endDate);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end =pager.getPageEnd();
		
		List<ReservDTO> list = reservService.listReserv_search(userid, strDate, endDate,start, end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count); //레코드 갯수 파일
		map.put("pager", pager); 
		
		mav.setViewName("/reserv/orderlist2");		
		mav.addObject("dto", dto);
		mav.addObject("map", map);	
		return mav;
	}
	
	//주문내역 상세보기
	@RequestMapping("orderdetail/{no}")
	public ModelAndView orderdetail(@PathVariable int no, ModelAndView mav) {
		mav.setViewName("/reserv/order_detail");
		mav.addObject("dto", reservService.detail(no));
		return mav;
	}
	//배송지변경 페이지 이동
	@RequestMapping("addr_edit/{no}")
	public ModelAndView addredit(@PathVariable int no, ModelAndView mav){
		mav.setViewName("reserv/addredit");
		mav.addObject("dto", reservService.detail(no));
		return mav;

	}
	//배송지 update
	@RequestMapping("update/{no}")
	public String addrupdate(@ModelAttribute ReservDTO dto, @PathVariable int no) {	
		reservService.updateAddr(dto);
		return "redirect:/reserv/orderdetail/{no}";	
	}
	
	@RequestMapping("delete/{no}")
	public String delete(@ModelAttribute ReservDTO dto, @PathVariable int no, HttpSession session) {
		reservService.delete(no);
		return "redirect:/reserv/orderdetail/{no}";	
	}
	@ResponseBody
	@RequestMapping("date.do")
	public ReservDTO date(Model model, @RequestParam(defaultValue = "0") String filterDate) {
		return new ReservDTO(filterDate);
	}
	
	@RequestMapping("canclelist.do/{userid}")
	public ModelAndView canclelist(ModelAndView mav, @PathVariable String userid,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		int count = reservService.countcancle(userid);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end =pager.getPageEnd();
		
		List<ReservDTO> list = reservService.canclelist(userid,start, end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count); //레코드 갯수 파일
		map.put("pager", pager); 
		
		mav.setViewName("/reserv/cancleList");
		mav.addObject("map", map);	
		return mav;
	}
	
	@RequestMapping("mypagelist.do/{userid}")
	public ModelAndView mypagelist(ModelAndView mav, @PathVariable String userid){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.add(c.DATE, +1);
		String today = sdf.format(c.getTime());
		c.add(c.DATE, -7);
		String before7 = sdf.format(c.getTime());
		System.out.println("현재:"+ today);
		System.out.println("일주일전:"+ before7);
		List<ReservDTO> list = reservService.mypagelist(userid, today, before7);
		mav.setViewName("/reserv/mypagelist");
		mav.addObject("list", list);	
		return mav;
	}
}
