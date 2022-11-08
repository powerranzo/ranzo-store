package com.ranzo.power.controller.admin;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.service.admin.AdminService;
import com.ranzo.power.service.admin.UploadService;
import com.ranzo.power.util.DateFunction;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	private static final Logger logger=
			LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Inject
	UploadService uploadService;

	//	@Resource(name = "uploadPath") 
	//	String uploadPath;

	@GetMapping("/home.do")
	public String adminHome() {
		return "admin/adminHome";
	}

	@RequestMapping("/member_list.do")
	public String memberList(SearchDTO searchOp, 
			@RequestParam(defaultValue="1") int curPage, Model m
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) searchOp=(SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map=adminService.getMemberList(searchOp, curPage);
		m.addAttribute("searchOp", searchOp);
		m.addAttribute("mcount", map.get("mcount"));
		m.addAttribute("list", map.get("list"));
		m.addAttribute("pager", map.get("pager"));
		map.clear();
		return "admin/memberList";
	}

	@RequestMapping("/member_view.do")
	public String viewMember(String userid, Model m 
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) userid=(String)flashmap.get("userid");
		m.addAttribute("dto", adminService.getMemberView(userid));
		m.addAttribute("qna_list", adminService.getMemberQna(userid)); 
		m.addAttribute("reserv_list", adminService.getMemberReserv(userid)); 
		return "admin/memberView";
	}

	@RequestMapping("/member_delete.do")
	public String deleteMember(String[] userids, SearchDTO searchOp
			, RedirectAttributes rttr) {
		adminService.deleteMember(userids);
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:member_list.do";
	}

	@RequestMapping("/reserv_delete.do")
	public String deleteReserv(String[] reserv_no, String userid
			, RedirectAttributes rttr) {
		adminService.deleteReserv(reserv_no);
		if(userid!=null) {
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else
			return "redirect:reserv_list.do";
	}

	//	@RequestMapping("/reserv_delete.do")
	//	public void deleteReserv() {
	//		
	//	}
	@RequestMapping("/qna_delete.do")
	public String deleteQna(int[] qna_bno, String userid
			, RedirectAttributes rttr) {
		adminService.deleteQna(qna_bno);
		if(userid!=null) {
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else
			return "redirect:qna_list.do";
	}

	@RequestMapping("/exb_list.do")
	public String exbList(SearchDTO searchOp, 
			@RequestParam(defaultValue="1") int curPage, Model m
			,HttpServletRequest request) {
		logger.info("exbList_SearchOp:"+searchOp);
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) 
			searchOp=(SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map=adminService.getExbList(searchOp, curPage);
		m.addAttribute("exb", map);
		return "admin/exbList";
	}

	@GetMapping("/exb_write.do")
	public String writeExb() {
		return "admin/exbWrite";
	}
	@PostMapping("/exb_write.do")
	public String writeExb( 
			ExhibitionDTO dto, HttpServletRequest request
			, MultipartFile file, MultipartFile file2) {
		String thumnail="-";
		String product_info="-";
		if(!file.isEmpty()) {
			logger.info("multipartfile:"+file.getOriginalFilename());
			thumnail=uploadService.uploadFile(file, request);
		}
		if(!file2.isEmpty()) {
			logger.info("multipartfile:"+file2.getOriginalFilename());
			product_info=uploadService.uploadFile(file2, request);
		}
		dto.setThumnail(thumnail);
		dto.setProduct_info(product_info);
		adminService.insertExb(dto);
		return "redirect:exb_list.do"; 
	}

	@RequestMapping("/exb_view.do")
	public String getExbView(String code, Model m, HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) 
			code=(String) flashmap.get("code");
		logger.info("exb_view_code:"+code);
		ExhibitionDTO dto=adminService.getExbView(code);
		logger.info("exb_view_dto:"+dto);
		m.addAttribute("startDate", DateFunction.dateToString(dto.getStart_date())); 
		m.addAttribute("endDate", DateFunction.dateToString(dto.getEnd_date()));
		m.addAttribute("dto", dto);
		return "admin/exbUpdate";
	}

	@RequestMapping("/exb_update.do")
	public String updateExb(ExhibitionDTO dto, HttpServletRequest request
			, MultipartFile file, MultipartFile file2) {
		String thumnail=adminService.getExbView(dto.getCode()).getThumnail();
		String product_info=adminService.getExbView(dto.getCode()).getProduct_info();
		if(!file.isEmpty()) {
			thumnail=thumnail.substring(thumnail.lastIndexOf("/")+1);
			uploadService.deleteServerFile(thumnail, request);
			thumnail=uploadService.uploadFile(file, request);
		}
		dto.setThumnail(thumnail);
		if(!file2.isEmpty()) {
			product_info=product_info.substring(product_info.lastIndexOf("/")+1);
			uploadService.deleteServerFile(product_info, request);
			product_info=uploadService.uploadFile(file2, request);
		}
		dto.setProduct_info(product_info);
		adminService.updateExb(dto);
		return "redirect:exb_list.do";
	}  

	@RequestMapping("file_delete.do")
	public String fileDelete(String code, String fileType, HttpServletRequest request
			,RedirectAttributes rttr) {
		logger.info("file_delete.do 호출");
		ExhibitionDTO dto=adminService.getExbView(code);
		String fileName="";
		logger.info("fileType:"+fileType);
		if(fileType.equals("thumnail"))
			fileName=dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
		else if(fileType.equals("product_info"))
			fileName=dto.getProduct_info().substring(dto.getProduct_info().lastIndexOf("/")+1);
		logger.info("fileName_for_delete:"+fileName);
		uploadService.deleteServerFile(fileName, request);
		adminService.deleteFile(code, fileType);
		rttr.addFlashAttribute("code", code);
		return "redirect:/admin/exb_view.do";
	} 

	@RequestMapping("/exbs_delete.do")
	public String deleteExb(String[] codes, SearchDTO searchOp,
			HttpServletRequest request, RedirectAttributes rttr) {
		for(int i=0; i<codes.length; i++) {
			adminService.deleteExb(codes[i]);
		}
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:/admin/exb_list.do";
	}

	@RequestMapping("/exb_delete.do")
	public String deleteExb(String code) {
		adminService.deleteExb(code);
		return "redirect:/admin/exb_list.do";
	}

	@RequestMapping("/reserv_list.do")
	public String reservList(SearchDTO searchOp, 
			@RequestParam(defaultValue="1") int curPage, Model m
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) 
			searchOp=(SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map=adminService.getReservList(searchOp, curPage);
		logger.info("reserv map:" + map);
		m.addAttribute("reserv", map);
		return "admin/reservList";
	}

	@RequestMapping("/qna_list.do")
	public String qnaList(SearchDTO searchOp,
			@RequestParam(defaultValue = "1") int curPage, Model m) {
		Map<String,Object> map=adminService.getQnaList(searchOp, curPage);
		logger.info("qna_map:"+map);
		m.addAttribute("qna", map);
		return "admin/qnaList"; 
	}

	@RequestMapping("/popup_list.do")
	public String popupList(SearchDTO searchOp,
			@RequestParam(defaultValue = "1") int curPage, Model m) {
		Map<String,Object> map=adminService.getPopupList(searchOp, curPage);
		logger.info("popup_map:"+map);
		m.addAttribute("pop", map);
		return "admin/popupList"; 
	}

	@RequestMapping("/popup_delete.do")
	public String deletePopup(int[] pop_no, @RequestParam(defaultValue = "0")int no
			, RedirectAttributes rttr) {
		logger.info("int no:" + no);
		adminService.deletePopup(pop_no);
		if(no!=0) {
			rttr.addFlashAttribute("no", no);
			return "redirect:popup_view.do";
		}else
			return "redirect:popup_list.do";
	}

	@RequestMapping("/popup_view.do")
	public String viewPopup(int no, Model m 
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) no=(int)flashmap.get("no");
		m.addAttribute("dto", adminService.getPopupView(no));
		return "admin/popupView";
	}

	@GetMapping("/popup_write.do")
	public String writePopup() {
		logger.info("Get 호출");
		return "admin/popupWrite";
	}
	
	@PostMapping("/popup_write.do")
	public String writePopup(PopupDTO dto, String start_time, String end_time, 
			HttpServletRequest request) {
//			, MultipartFile file) {
		logger.info("post 호출");
//		String img_src="-";
//		if(!file.isEmpty()) {
//			logger.info("multipartfile:"+file.getOriginalFilename());
//			img_src=uploadService.uploadFile(file, request);
//		}
		logger.info("popupDTO start_time:"+start_time);
//		dto.setStart_date();
//		dto.setImg_src(img_src);
		adminService.insertPopup(dto);
		return "redirect:exb_list.do"; 
	}
}
