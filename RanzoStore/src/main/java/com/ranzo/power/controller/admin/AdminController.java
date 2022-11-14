package com.ranzo.power.controller.admin;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ranzo.power.common.Constants;
import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;
import com.ranzo.power.service.admin.AdminService;
import com.ranzo.power.service.admin.UploadService;
import com.ranzo.power.util.DateUtils;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Inject
	UploadService uploadService;

	@GetMapping("/home.do")
	public String adminHome() {
		return "admin/adminHome";
	}

	@RequestMapping("/member_list.do")
	public String memberList(SearchDTO searchOp, 
			@RequestParam(defaultValue = "1") int curPage, Model m,
			HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) searchOp = (SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map = adminService.getMemberList(searchOp, curPage);
		m.addAttribute("searchOp", searchOp);
		m.addAttribute("mcount", map.get("mcount"));
		m.addAttribute("list", map.get("list"));
		m.addAttribute("pager", map.get("pager"));
		map.clear();
		return "admin/memberList";
	}

	@RequestMapping("/member_view.do")
	public String viewMember(String userid, Model m,
			HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) userid = (String)flashmap.get("userid");
		m.addAttribute("dto", adminService.getMemberView(userid));
		m.addAttribute("qna_list", adminService.getMemberQna(userid)); 
		m.addAttribute("reserv_list", adminService.getMemberReserv(userid)); 
		return "admin/memberView";
	}

	@RequestMapping("/member_delete.do")
	public String deleteMember(String[] userids, SearchDTO searchOp,
			RedirectAttributes rttr) {
		adminService.deleteMember(userids);
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:member_list.do";
	}

	@RequestMapping("/reserv_delete.do")
	public String deleteReserv(String[] reserv_no, String userid,
			RedirectAttributes rttr) {
		adminService.deleteReserv(reserv_no);
		if(userid!= null) {
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else
			return "redirect:reserv_list.do";
	}

	@RequestMapping("/qna_delete.do")
	public String deleteQna(int[] qna_bno, String userid
			, RedirectAttributes rttr) {
		adminService.deleteQna(qna_bno);
		if(userid!= null) {
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else
			return "redirect:qna_list.do";
	}

	@RequestMapping("/exb_list.do")
	public String exbList(
			SearchDTO searchOp, @RequestParam(defaultValue = "1") int curPage, 
			Model m, HttpServletRequest request) {
		logger.info("exbList_SearchOp:"+searchOp);
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) searchOp = (SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map = adminService.getExbList(searchOp, curPage);
		m.addAttribute("exb", map);
		return "admin/exbList";
	}

	@GetMapping("/exb_write.do")
	public String writeExb() {
		return "admin/exbWrite";
	}

	@PostMapping("/exb_write.do")
	public String writeExb( 
			ExhibitionDTO dto, ProductInfoDTO idto, HttpServletRequest request, 
			MultipartFile file, MultipartFile file2) {
		
		logger.info("IN_ ExhibitionDTO:"+dto.toString());
		logger.info("IN_ ProductInfoDTO:"+idto.toString());
		
		String thumnail = "-";
		String product_info = "-";
		if(!file.isEmpty()) {
			logger.info("multipartfile:"+file.getOriginalFilename());
			Map<String,Object> fileInfo = uploadService.uploadFile(file, request, Constants.DIR_EXHIBITION_TN);
			thumnail = (String)fileInfo.get("fileUrl");
		}
		if(!file2.isEmpty()) {
			logger.info("multipartfile:"+file2.getOriginalFilename());
			Map<String,Object> fileInfo = uploadService.uploadFile(file, request, Constants.DIR_EXHIBITION_PI);
			product_info = (String)fileInfo.get("fileUrl");
		}
		idto.setAttach(product_info);
		dto.setThumnail(thumnail);
		//		dto.setProduct_info(product_info);
		adminService.insertExb(dto, idto);
		return "redirect:exb_list.do"; 
	}

	@RequestMapping("/exb_view.do")
	public String getExbView(String code, Model m, HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) code = (String) flashmap.get("code");
		ExhibitionDTO dto = adminService.getExbView(code);
		ProductInfoDTO idto = adminService.getProductInfoView(code);
		int mark=0;
		if(idto.getAttach().indexOf(Constants.DIR_EXHIBITION_PI) != -1)
			mark=1;
		m.addAttribute("startDate", DateUtils.dateToString(dto.getStart_date())); 
		m.addAttribute("endDate", DateUtils.dateToString(dto.getEnd_date()));
		m.addAttribute("dto", dto);
		m.addAttribute("idto", idto);
		m.addAttribute("mark", mark);
		return "admin/exbUpdate";
	}

	@RequestMapping("/exb_update.do")
	public String updateExb(ExhibitionDTO dto, ProductInfoDTO idto, 
			HttpServletRequest request, MultipartFile file, MultipartFile file2) {
		ProductInfoDTO dtoOrigin = adminService.getProductInfoView(idto.getCode());
		String thumnail = adminService.getExbView(dto.getCode()).getThumnail();
		String product_info = dtoOrigin.getAttach(); 
		
		//첨부파일 있는 경우
		if(!file.isEmpty()) {
			thumnail = thumnail.substring(thumnail.lastIndexOf("/")+1);
			uploadService.deleteServerFile(thumnail, request, Constants.DIR_EXHIBITION_TN);
			thumnail = (String)uploadService.uploadFile(file, request, Constants.DIR_EXHIBITION_TN).get("fileUrl");
		}
		if(!file2.isEmpty()) {
			product_info = product_info.substring(product_info.lastIndexOf("/")+1);
			uploadService.deleteServerFile(product_info, request, Constants.DIR_EXHIBITION_PI);
			product_info = (String)uploadService.uploadFile(file2, request, Constants.DIR_EXHIBITION_PI).get("fileUrl");
			idto.setAttach(product_info);
			//attach url인 경우
		}else if(!(idto.getAttach() == null && "".equals(idto.getAttach()))) {
			product_info = product_info.substring(product_info.lastIndexOf("/")+1);
			uploadService.deleteServerFile(product_info, request, Constants.DIR_EXHIBITION_PI);
		}
		dto.setThumnail(thumnail);
		adminService.updateExb(dto, idto);
		return "redirect:exb_list.do";
	}

	@RequestMapping("exb_file_delete.do")
	public ResponseEntity<String> fileDelete(String code, String fileType
			, HttpServletRequest request) {
		ExhibitionDTO dto = adminService.getExbView(code);
		ProductInfoDTO idto = adminService.getProductInfoView(code);
		String fileName = "";
		if(fileType.equals("thumnail")) {
			fileName = dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
			uploadService.deleteServerFile(fileName, request, Constants.DIR_EXHIBITION_TN);
		}
		else if(fileType.equals("product_info")) {
			fileName = idto.getAttach().substring(idto.getAttach().lastIndexOf("/")+1);
			uploadService.deleteServerFile(fileName, request, Constants.DIR_EXHIBITION_PI);
		}
		adminService.deleteExbFile(code, fileType);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	} 

	@RequestMapping("/exbs_delete.do")
	public String deleteExb(String[] codes, SearchDTO searchOp,
			HttpServletRequest request, RedirectAttributes rttr) {
		for(int i = 0; i<codes.length; i++) {
			adminService.deleteExb(codes[i]);
		}
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:/admin/exb_list.do";
	}

	@RequestMapping("/exb_delete.do") // 지난 전시 위해 파일 삭제x 
	public String deleteExb(String code) {
		adminService.deleteExb(code);
		return "redirect:/admin/exb_list.do";
	}

	@RequestMapping("/reserv_list.do")
	public String reservList(SearchDTO searchOp, 
			@RequestParam(defaultValue = "1") int curPage, Model m
			,HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) 
			searchOp = (SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map = adminService.getReservList(searchOp, curPage);
		logger.info("reserv map:" + map);
		m.addAttribute("reserv", map);
		return "admin/reservList";
	}

	@RequestMapping("/qna_list.do")
	public String qnaList(SearchDTO searchOp,
			@RequestParam(defaultValue  =  "1") int curPage, Model m) {
		Map<String,Object> map = adminService.getQnaList(searchOp, curPage);
		logger.info("qna_map:"+map);
		m.addAttribute("qna", map);
		return "admin/qnaList"; 
	}

	@RequestMapping("/popup_list.do")
	public String popupList(SearchDTO searchOp,
			@RequestParam(defaultValue  =  "1") int curPage, Model m) {
		Map<String,Object> map = adminService.getPopupList(searchOp, curPage);
		logger.info("popup_map:"+map);
		m.addAttribute("pop", map);
		return "admin/popupList"; 
	}

	@RequestMapping("/popup_delete.do")
	public String deletePopup(int[] no, RedirectAttributes rttr) {
		logger.info("int no:" + no);
		adminService.deletePopup(no);
		rttr.addFlashAttribute("no", no);
		//			return "redirect:popup_view.do";
		return "redirect:popup_list.do";
	}

	@RequestMapping("/popup_view.do")
	public String viewPopup(int no, Model m, HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) no = (int)flashmap.get("no");
		PopupDTO dto = adminService.getPopupView(no);
		m.addAttribute("startDate", DateUtils.dateToString(dto.getStart_date())); 
		m.addAttribute("endDate", DateUtils.dateToString(dto.getEnd_date()));
		m.addAttribute("dto", dto);
		return "admin/popupUpdate";
	}

	@GetMapping("/popup_write.do")
	public String writePopup() {
		return "admin/popupWrite";
	}

	@PostMapping("/popup_write.do")
	public String writePopup(PopupDTO dto, String start_time, 
			String end_time, HttpServletRequest request, 
			MultipartFile file) throws ParseException {
		String img_src = "";
		if(!file.isEmpty()) { 
			logger.info("multipartfile:"+file.getOriginalFilename());
			Map<String,Object> fileInfo = uploadService.uploadFile(file, request, Constants.DIR_POPUP);
			img_src = (String)fileInfo.get("fileUrl");
			dto.setImg_src(img_src);
			dto.setFilename(img_src.substring(img_src.lastIndexOf("_")+1));
			dto.setFilesize((long)fileInfo.get("fileSize"));
		}
		dto.setStart_date(DateUtils.stringToDate(DateUtils.dateToString(
				dto.getStart_date())+" "+start_time, "yyyy-MM-dd HH:mm"));
		dto.setEnd_date(DateUtils.stringToDate(DateUtils.dateToString(
				dto.getEnd_date())+" "+end_time, "yyyy-MM-dd HH:mm"));
		adminService.insertPopup(dto);
		return "redirect:popup_list.do"; 
	}
	
	@ResponseBody
	@RequestMapping("popup_file_delete.do")
	public ResponseEntity<String> popupFileDel(
			@RequestParam(defaultValue = "0")int no, 
			HttpServletRequest request) {
		if(no!= 0) {
			PopupDTO dto = adminService.getPopupView(no);
			String fileName = "";
			fileName = dto.getImg_src().substring(dto.getImg_src().lastIndexOf("/")+1);
			uploadService.deleteServerFile(fileName, request, Constants.DIR_POPUP);
			adminService.deletePopupFile(no);
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping("/popup_update.do")
	public String updatePopup(PopupDTO dto, String start_time, String end_time, 
			HttpServletRequest request,	MultipartFile file) throws ParseException {
		PopupDTO dtoOrigin = adminService.getPopupView(dto.getNo());
		String img_src = "";
		//첨부파일 있는 경우
		if(!file.isEmpty()) { 
			img_src = dtoOrigin.getImg_src();
			String fileName = img_src.substring(img_src.lastIndexOf("/")+1);
			uploadService.deleteServerFile(fileName, request, Constants.DIR_POPUP);
			Map<String,Object> fileInfo = uploadService.uploadFile(file, request, Constants.DIR_POPUP);
			img_src = (String)fileInfo.get("fileUrl");
			logger.info("fileInfo_fileURL:"+img_src);
			dto.setFilename(img_src.substring(img_src.lastIndexOf("_")+1));
			dto.setFilesize((long)fileInfo.get("fileSize"));
			dto.setImg_src(img_src);
			//url인 경우
		}else if(!(dto.getImg_src() == null && "".equals(dto.getImg_src()))) {
			img_src = dto.getImg_src();
			String fileName = img_src.substring(img_src.lastIndexOf("/")+1);
			uploadService.deleteServerFile(fileName, request, Constants.DIR_POPUP);
			dto.setFilename("-");
			//이미지 변경 없는 경우
		}else {
			dto.setImg_src(dtoOrigin.getImg_src());
			dto.setFilename(dtoOrigin.getFilename());
			dto.setFilesize(dtoOrigin.getFilesize());
		}
		dto.setStart_date(DateUtils.stringToDate(DateUtils.dateToString(dto.getStart_date())+" "+start_time, "yyyy-MM-dd HH:mm"));
		dto.setEnd_date(DateUtils.stringToDate(DateUtils.dateToString(dto.getEnd_date())+" "+end_time, "yyyy-MM-dd HH:mm"));
		adminService.updatePopup(dto);
		return "redirect:popup_list.do";
	}  

	@RequestMapping("/popup_show.do")
	public String popupShow(@RequestParam(defaultValue = "0") int no) {
		if(no!= 0) {
			adminService.popupShow(no);
		}
		return "redirect:popup_list.do";
	}

	@RequestMapping("/popup_img.do")
	public String popupView(Model m, PopupDTO dto) {
		m.addAttribute("dto", adminService.getPopupView(dto.getNo()));
		return "admin/popup";
	}
	
	@ResponseBody
	@RequestMapping("/popup.do")
	public List<PopupDTO> popup(PopupDTO dto) {
		List<PopupDTO> list = adminService.getPopupOn();
		return list;
	}


}
