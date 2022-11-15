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
import com.ranzo.power.service.member.MemberService;
import com.ranzo.power.service.shop.ExhibitionService;
import com.ranzo.power.util.DateUtils;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Inject
	MemberService memberService;

	@Inject
	ExhibitionService exbService;

	@Inject
	UploadService uploadService; 


	@RequestMapping("/home.do")
	public String homeList(Model m){
		m.addAttribute("map", adminService.getHomeList());
		return "admin/adminHome";
	}

	//회원 목록
	@RequestMapping("/member_list.do")
	public String memberList(SearchDTO searchOp, Model m,
			@RequestParam(defaultValue = "1") int curPage, 
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

	//회원 정보
	@RequestMapping("/member_view.do")
	public String viewMember(
			String userid, Model m, HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) userid = (String)flashmap.get("userid");
		m.addAttribute("dto", memberService.viewMember(userid));
		m.addAttribute("qna_list", adminService.getMemberQna(userid)); 
		m.addAttribute("reserv_list", adminService.getMemberReserv(userid)); 
		return "admin/memberView";
	}

	//회원 탈퇴
	@RequestMapping("/member_delete.do")
	public String deleteMember(String[] userids, 
			SearchDTO searchOp, RedirectAttributes rttr) {
		adminService.deleteMember(userids);
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:member_list.do";
	}

	//회원 예약 삭제
	@RequestMapping("/reserv_delete.do")
	public String deleteReserv(String[] reserv_no, 
			String userid, RedirectAttributes rttr) {
		adminService.deleteReserv(reserv_no);
		if(userid!= null) {
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else
			return "redirect:reserv_list.do";
	}

	//회원 문의글 삭제
	@RequestMapping("/qna_delete.do")
	public String deleteQna(int[] qna_bno, 
			String userid, RedirectAttributes rttr) {
		adminService.deleteQna(qna_bno);
		if(userid!= null) {
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else
			return "redirect:qna_list.do";
	}

	//전시 목록
	@RequestMapping("/exb_list.do")
	public String exbList(SearchDTO searchOp, 
			@RequestParam(defaultValue = "1") int curPage, 
			Model m, HttpServletRequest request) {
		logger.info("exbList_SearchOp:"+searchOp);
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) searchOp = (SearchDTO)flashmap.get("searchOp");
		Map<String,Object> map = adminService.getExbList(searchOp, curPage);
		m.addAttribute("exb", map);
		return "admin/exbList";
	}

	//전시 등록 페이지
	@GetMapping("/exb_write.do")
	public String writeExb() {
		return "admin/exbWrite";
	}

	//전시 등록
	@PostMapping("/exb_write.do")
	public String writeExb(ExhibitionDTO dto, 
			ProductInfoDTO idto, HttpServletRequest request, 
			MultipartFile file, MultipartFile file2) {
		String thumnail = "-";
		String product_info = "-";
		if(!file.isEmpty()) {
			logger.info("multipartfile:"+file.getOriginalFilename());
			Map<String,Object> fileInfo = uploadService.uploadFile(
					file, request, Constants.DIR_EXHIBITION_TN);
			thumnail = (String)fileInfo.get("fileUrl");
		}
		if(!file2.isEmpty()) {
			logger.info("multipartfile:"+file2.getOriginalFilename());
			Map<String,Object> fileInfo = uploadService.uploadFile(
					file, request, Constants.DIR_EXHIBITION_PI);
			product_info = (String)fileInfo.get("fileUrl");
		}
		idto.setAttach(product_info);
		dto.setThumnail(thumnail);
		//		dto.setProduct_info(product_info);
		adminService.insertExb(dto, idto);
		return "redirect:exb_list.do"; 
	}

	//전시 수정 페이지
	@RequestMapping("/exb_view.do")
	public String getExbView(String code, 
			Model m, HttpServletRequest request) {
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) code = (String) flashmap.get("code");
		ExhibitionDTO dto = adminService.getExbView(code);
		ProductInfoDTO idto = exbService.getProductInfo(code);
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

	//전시 수정
	@RequestMapping("/exb_update.do")
	public String updateExb(ExhibitionDTO dto, ProductInfoDTO idto, 
			HttpServletRequest request, MultipartFile file, MultipartFile file2) {
		ProductInfoDTO dtoOrigin = exbService.getProductInfo(idto.getCode());
		String thumnail = adminService.getExbView(dto.getCode()).getThumnail();
		String product_info = dtoOrigin.getAttach(); 

		//첨부파일 있는 경우
		if(!file.isEmpty()) {
			thumnail = thumnail.substring(thumnail.lastIndexOf("/")+1);
			uploadService.deleteServerFile(
					thumnail, request, Constants.DIR_EXHIBITION_TN);
			thumnail = (String)uploadService.uploadFile(
					file, request, Constants.DIR_EXHIBITION_TN).get("fileUrl");
		}
		if(!file2.isEmpty()) {
			product_info = product_info.substring(product_info.lastIndexOf("/")+1);
			uploadService.deleteServerFile(
					product_info, request, Constants.DIR_EXHIBITION_PI);
			product_info = (String)uploadService.uploadFile(
					file2, request, Constants.DIR_EXHIBITION_PI).get("fileUrl");
			idto.setAttach(product_info);
			//attach url인 경우
		}else if(!(idto.getAttach() == null && "".equals(idto.getAttach()))) {
			product_info = 
					product_info.substring(product_info.lastIndexOf("/")+1);
			uploadService.deleteServerFile(
					product_info, request, Constants.DIR_EXHIBITION_PI);
		}
		dto.setThumnail(thumnail);
		adminService.updateExb(dto, idto);
		return "redirect:exb_list.do";
	}

	//전시 첨부파일 삭제
	@RequestMapping("exb_file_delete.do")
	public ResponseEntity<String> fileDelete(String code, 
			String fileType, HttpServletRequest request) {
		ExhibitionDTO dto = adminService.getExbView(code);
		ProductInfoDTO idto = exbService.getProductInfo(code);
		String fileName = "";
		if(fileType.equals("thumnail")) {
			fileName = dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
			uploadService.deleteServerFile(
					fileName, request, Constants.DIR_EXHIBITION_TN);
		}
		else if(fileType.equals("product_info")) {
			fileName = idto.getAttach().substring(idto.getAttach().lastIndexOf("/")+1);
			uploadService.deleteServerFile(
					fileName, request, Constants.DIR_EXHIBITION_PI);
		}
		adminService.deleteExbFile(code, fileType);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	} 

	//전시 종료(목록에서)
	@RequestMapping("/exbs_delete.do")
	public String deleteExb(String[] codes, SearchDTO searchOp,
			HttpServletRequest request, RedirectAttributes rttr) {
		for(int i = 0; i<codes.length; i++) {
			adminService.deleteExb(codes[i]);
		}
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:/admin/exb_list.do";
	}

	//전시 종료(수정 페이지에서)
	@RequestMapping("/exb_delete.do")
	public String deleteExb(String code) {
		adminService.deleteExb(code);
		return "redirect:/admin/exb_list.do";
	}

	//예약 목록
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

	//QnA 목록
	@RequestMapping("/qna_list.do")
	public String qnaList(SearchDTO searchOp, Model m,
			@RequestParam(defaultValue  =  "1") int curPage) {
		Map<String,Object> map = adminService.getQnaList(searchOp, curPage);
		logger.info("qna_map:"+map);
		m.addAttribute("qna", map);
		return "admin/qnaList"; 
	}

	//팝업 목록
	@RequestMapping("/popup_list.do")
	public String popupList(SearchDTO searchOp,
			@RequestParam(defaultValue  =  "1") int curPage, Model m) {
		Map<String,Object> map = adminService.getPopupList(searchOp, curPage);
		logger.info("popup_map:"+map);
		m.addAttribute("pop", map);
		return "admin/popupList"; 
	}

	//팝업 종료
	@RequestMapping("/popup_delete.do")
	public String deletePopup(int[] no, RedirectAttributes rttr) {
		logger.info("int no:" + no);
		adminService.deletePopup(no);
		rttr.addFlashAttribute("no", no);
		//			return "redirect:popup_view.do";
		return "redirect:popup_list.do";
	}

	//팝업 수정페이지
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

	//팝업 등록 페이지
	@GetMapping("/popup_write.do")
	public String writePopup() {
		return "admin/popupWrite";
	}

	//팝업 수정
	@PostMapping("/popup_write.do")
	public String writePopup(PopupDTO dto, String start_time, 
			String end_time, HttpServletRequest request, 
			MultipartFile file) throws ParseException {
		
		String img_src = dto.getImg_src();
		//첨부파일인 경우
		if(!file.isEmpty()) { 
			logger.info("multipartfile:"+file.getOriginalFilename());
			Map<String,Object> fileInfo = uploadService.uploadFile(file, request, Constants.DIR_POPUP);
			img_src = (String)fileInfo.get("fileUrl");
			dto.setFilename(img_src.substring(img_src.lastIndexOf("_")+1));
			dto.setFilesize((long)fileInfo.get("fileSize"));
			//URL인 경우
		}else {
			dto.setFilename("-");
		}
		dto.setImg_src(img_src);
		dto.setStart_date(DateUtils.stringToDate(DateUtils.dateToString(
				dto.getStart_date())+" "+start_time, "yyyy-MM-dd HH:mm"));
		dto.setEnd_date(DateUtils.stringToDate(DateUtils.dateToString(
				dto.getEnd_date())+" "+end_time, "yyyy-MM-dd HH:mm"));
		adminService.insertPopup(dto);
		return "redirect:popup_list.do"; 
	}

	//팝업 파일 삭제(수정페이지)
	@ResponseBody
	@RequestMapping("popup_file_delete.do")
	public ResponseEntity<String> popupFileDel(
			@RequestParam(defaultValue = "0")int no, 
			HttpServletRequest request) {
		if(no!= 0) {
			PopupDTO dto = adminService.getPopupView(no);
			String fileName = "";
			fileName = dto.getImg_src().substring(dto.getImg_src().lastIndexOf("/")+1);
			uploadService.deleteServerFile(
					fileName, request, Constants.DIR_POPUP);
			adminService.deletePopupFile(no);
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}

	//팝업 수정
	@RequestMapping("/popup_update.do")
	public String updatePopup(String start_time, String end_time, 
			PopupDTO dto, HttpServletRequest request,
			MultipartFile file) throws ParseException {
		
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

	//팝업 재개
	@RequestMapping("/popup_show.do")
	public String popupShow(@RequestParam(defaultValue = "0") int no) {
		if(no!= 0) adminService.popupShow(no);
		return "redirect:popup_list.do";
	}

	//팝업 페이지로 전달
	@RequestMapping("/popup_img.do")
	public String popupView(Model m, PopupDTO dto) {
		m.addAttribute("dto", adminService.getPopupView(dto.getNo()));
		return "admin/popup";
	}

	//팝업 띄우기
	@ResponseBody
	@RequestMapping("/popup.do")
	public List<PopupDTO> popup(PopupDTO dto) {
		List<PopupDTO> list = adminService.getPopupOn();
		return list;
	}
}
