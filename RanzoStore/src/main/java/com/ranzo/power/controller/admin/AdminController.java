package com.ranzo.power.controller.admin;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;
import com.ranzo.power.service.admin.AdminService;
import com.ranzo.power.service.board.QnaService;
import com.ranzo.power.service.member.MemberService;
import com.ranzo.power.service.shop.ExhibitionService;
import com.ranzo.power.util.DateUtils;
import com.ranzo.power.util.UploadFileUtils;

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
	QnaService qnaService;

	//관리자 홈
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
		//검색 옵션 유지
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) { 
			searchOp = (SearchDTO)flashmap.get("searchOp");
			curPage = (int)flashmap.get("curPage");
		}
		Map<String,Object> map = adminService.getMemberList(searchOp, curPage);
		m.addAttribute("m", map);
		return "admin/memberList";
	}

	//회원 정보
	@RequestMapping("/member_view.do")
	public String viewMember(String userid, Model m, 
			HttpServletRequest request) {
		//리다이렉트로 userid 전달받은 경우
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) userid = (String)flashmap.get("userid");
		//회원의 정보, 문의글, 예약 리스트 전달
		m.addAttribute("dto", memberService.viewMember(userid));
		m.addAttribute("qna_list", adminService.getMemberQna(userid)); 
		m.addAttribute("reserv_list", adminService.getMemberReserv(userid)); 
		return "admin/memberView";
	}

	//회원 탈퇴(목록)
	@RequestMapping("/member_delete.do")
	public String deleteMember(String[] userids, 
			@RequestParam(defaultValue = "1") int curPage, 
			SearchDTO searchOp, RedirectAttributes rttr) {
		adminService.deleteMember(userids);
		//검색옵션 전달
		rttr.addFlashAttribute("searchOp", searchOp);
		rttr.addFlashAttribute("curPage", curPage);
		return "redirect:member_list.do";
	}

	//전시 목록
	@RequestMapping("/exb_list.do")
	public String exbList(SearchDTO searchOp, 
			@RequestParam(defaultValue = "1") int curPage, 
			Model m, HttpServletRequest request) {
		//검색옵션 유지
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) {
			searchOp = (SearchDTO)flashmap.get("searchOp");
			curPage = (int)flashmap.get("curPage");
		}
		//리스트 전달
		Map<String,Object> map = adminService.getExbList(searchOp, curPage);
		m.addAttribute("exb", map);
		return "admin/exbList";
	}

	//전시 등록 페이지 이동
	@GetMapping("/exb_write.do")
	public String writeExb() {
		return "admin/exbWrite";
	}

	//코드 체크
	@RequestMapping("code_check.do")
	@ResponseBody
	public int codeCheck(String code) {
		return adminService.codeCheck(code);
	}

	//전시 등록
	@PostMapping("/exb_write.do")
	public String writeExb(ExhibitionDTO dto, 
			ProductInfoDTO idto, HttpServletRequest request, 
			MultipartFile file1, MultipartFile file2) {
		String thumnail = "-";
		String product_info = "-";
		//포스터를 파일로 등록한 경우
		if(!file1.isEmpty()) {
			//logger.info("multipartfile:"+file1.getOriginalFilename());
			Map<String,Object> fileInfo = UploadFileUtils.uploadFile2( 
					file1, request, Constants.DIR_EXHIBITION_TN);
			thumnail = (String)fileInfo.get("fileUrl");
		}
		//전시 정보를 파일로 등록한 경우
		if(!file2.isEmpty()) {
			//logger.info("multipartfile:"+file2.getOriginalFilename());
			Map<String,Object> fileInfo = UploadFileUtils.uploadFile2(
					file2, request, Constants.DIR_EXHIBITION_PI);
			product_info = (String)fileInfo.get("fileUrl");
		}
		//결과 저장
		idto.setAttach(product_info);
		dto.setThumnail(thumnail);
		adminService.insertExb(dto, idto);
		return "redirect:exb_list.do"; 
	}

	//전시 수정 페이지
	@RequestMapping("/exb_view.do")
	public String getExbView(String code, 
			Model m, HttpServletRequest request) {
		//리다이렉트로 전달받은 code가 있는 경우
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) code = (String) flashmap.get("code");
		ExhibitionDTO dto = adminService.getExbView(code);
		ProductInfoDTO idto = exbService.getProductInfo(code);
		//파일로 저장한 경우 url이 나타나지 않도록 하기 위한 표시
		int mark1 = 0; 
		int mark2 = 0;
		mark1 = (dto.getThumnail().indexOf(Constants.DIR_EXHIBITION_TN) != -1) ? 1: 0;
		mark2 = (idto.getAttach().indexOf(Constants.DIR_EXHIBITION_PI) != -1) ? 1: 0;
		m.addAttribute("startDate", DateUtils.dateToString(dto.getStart_date())); 
		m.addAttribute("endDate", DateUtils.dateToString(dto.getEnd_date()));
		m.addAttribute("dto", dto);
		m.addAttribute("idto", idto);
		m.addAttribute("mark1", mark1);
		m.addAttribute("mark2", mark2);
		return "admin/exbUpdate";
	}

	//전시 수정
	@RequestMapping("/exb_update.do")
	public String updateExb(ExhibitionDTO dto, 
			ProductInfoDTO idto, HttpServletRequest request, 
			MultipartFile file1, MultipartFile file2) {

		//기존 포스터, 전시 정보
		ProductInfoDTO dtoOrigin = exbService.getProductInfo(idto.getCode());
		String thumnail = adminService.getExbView(dto.getCode()).getThumnail();
		String product_info = dtoOrigin.getAttach();

		boolean file = !file1.isEmpty() ? true : false; 
		boolean url = !(dto.getThumnail() == null || "".equals(dto.getThumnail()))
				? true : false; 

		//전시 포스터
		//첨부파일 또는 url이 있는 경우
		if(file || url) {
			//기존 파일 삭제
			thumnail = thumnail.substring(thumnail.lastIndexOf("/")+1);
			UploadFileUtils.deleteServerFile(
					thumnail, request, Constants.DIR_EXHIBITION_TN);
			if(file)
				//첨부 파일인 경우 새로운 파일 등록
				thumnail = (String)UploadFileUtils.uploadFile2(
						file1, request, Constants.DIR_EXHIBITION_TN).get("fileUrl");
			else if(url)
				//url인 경우 등록한 url 저장
				thumnail = dto.getThumnail();
		}

		file = !file2.isEmpty() ? true : false; 
		url = !(idto.getAttach() == null || "".equals(idto.getAttach())) ? true : false;

		//전시 정보
		//첨부 파일 있는 경우
		if(file || url) {
			//기존 파일 삭제
			product_info = product_info.substring(product_info.lastIndexOf("/")+1);
			UploadFileUtils.deleteServerFile(
					product_info, request, Constants.DIR_EXHIBITION_PI);

			if(file) //첨부 파일인 경우 새로운 파일 등록
				product_info = (String)UploadFileUtils.uploadFile2(
						file2, request, Constants.DIR_EXHIBITION_PI).get("fileUrl");
			else if(url) //url인 경우 등록한 url 저장
				product_info = idto.getAttach();
		}
		//최종 이미지 경로 저장
		dto.setThumnail(thumnail);
		idto.setAttach(product_info);
		adminService.updateExb(dto, idto);
		return "redirect:exb_list.do";
	}

	//전시 첨부파일 삭제(수정 페이지)
	@RequestMapping("exb_file_delete.do")
	public ResponseEntity<String> fileDelete(String code, 
			String fileType, HttpServletRequest request) {
		//기존 정보
		ExhibitionDTO dto = adminService.getExbView(code);
		ProductInfoDTO idto = exbService.getProductInfo(code);
		String fileName = "";
		//포스터인 경우
		if(fileType.equals("thumnail")) {
			//기존 파일 삭제
			fileName = dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
			UploadFileUtils.deleteServerFile(
					fileName, request, Constants.DIR_EXHIBITION_TN);
		}
		//전시정보인 경우
		else if(fileType.equals("product_info")) {
			//기존 파일 삭제
			fileName = idto.getAttach().substring(idto.getAttach().lastIndexOf("/")+1);
			UploadFileUtils.deleteServerFile(
					fileName, request, Constants.DIR_EXHIBITION_PI);
		}
		//파일 정보 삭제
		adminService.deleteExbFile(code, fileType);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	} 

	//전시 종료(목록)
	@RequestMapping("/exbs_delete.do")
	public String deleteExb(String[] code, SearchDTO searchOp,
			@RequestParam(defaultValue = "1") int curPage, 
			RedirectAttributes rttr) {
		adminService.deleteExb(code);
		//검색옵션 전달
		rttr.addFlashAttribute("searchOp", searchOp);
		rttr.addFlashAttribute("curPage", curPage);
		return "redirect:/admin/exb_list.do";
	}

	//전시 재개(목록)
	@RequestMapping("/exbs_show.do")
	public String showExb(String[] code, SearchDTO searchOp,
			@RequestParam(defaultValue = "1") int curPage,
			RedirectAttributes rttr) { 
		adminService.showExb(code);
		//검색옵션 전달
		rttr.addFlashAttribute("searchOp", searchOp);
		rttr.addFlashAttribute("curPage", curPage);
		return "redirect:/admin/exb_list.do";
	}

	//전시 종료(상세 페이지)
	@ResponseBody
	@RequestMapping("/exb_delete.do")
	public ResponseEntity<String> deleteExb(String[] code) {
		adminService.deleteExb(code);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	//전시 재개(상세페이지)
	@ResponseBody
	@RequestMapping("/exb_show.do")
	public ResponseEntity<String> showExb(String[] code) {
		adminService.showExb(code);
		return new ResponseEntity<String>(HttpStatus.OK); 
	}


	//예약 목록
	@RequestMapping("/reserv_list.do")
	public String reservList(SearchDTO searchOp, Model m,
			@RequestParam(defaultValue = "1") int curPage,
			HttpServletRequest request) {
		//검색 옵션 유지
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) {
			searchOp = (SearchDTO)flashmap.get("searchOp");
			curPage = (int)flashmap.get("curPage");
		}
		//리스트 전달
		Map<String,Object> map = adminService.getReservList(searchOp, curPage);
		m.addAttribute("reserv", map);
		return "admin/reservList";
	}

	//회원 예약 삭제
	@RequestMapping("/reserv_delete.do")
	public String deleteReserv(String[] no, String userid, 
			@RequestParam(defaultValue = "1") int curPage,
			SearchDTO searchOp, RedirectAttributes rttr) {
		logger.info("### reserv_delete.do userid:" + userid + "//no" + no);
		adminService.deleteReserv(no);
		if(userid!= null) {
			//회원 상세 페이지에서 호출한 경우 - 아이디 전달
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else {
			//예약 목록에서 호출한 경우 - 검색옵션 전달
			rttr.addFlashAttribute("searchOp", searchOp);
			rttr.addFlashAttribute("curPage", curPage);
			return "redirect:reserv_list.do";
		}
	}

	//QnA 목록
	@RequestMapping("/qna_list.do")
	public String qnaList(SearchDTO searchOp, Model m,
			@RequestParam(defaultValue  =  "1") int curPage,
			HttpServletRequest request, HttpSession session) {
		//검색옵션 유지
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) {
			searchOp = (SearchDTO)flashmap.get("searchOp");
			curPage = (int)flashmap.get("curPage");
		}
		//관리자 확인
		String admin="";
		if(((String)session.getAttribute("admin")).equals("y")) 
			admin=(String)session.getAttribute("userid");

		//리스트 전달
		Map<String,Object> map = adminService.getQnaList(searchOp, curPage, admin);
		m.addAttribute("qna", map);
		return "admin/qnaList"; 
	}

	//회원 QnA 삭제
	@RequestMapping("/qna_delete.do")
	public String deleteQna(int[] bno, SearchDTO searchOp, 
			@RequestParam(defaultValue = "1") int curPage, 
			String userid, RedirectAttributes rttr) {
		adminService.deleteQna(bno);
		if(userid!= null) {
			//회원 상세 페이지에서 호출한 경우 - 아이디 전달
			rttr.addFlashAttribute("userid", userid);
			return "redirect:member_view.do";
		}else {
			//QnA 목록에서 호출한 경우 - 검색옵션 전달
			rttr.addFlashAttribute("searchOp", searchOp);
			rttr.addFlashAttribute("curPage", curPage);
			return "redirect:qna_list.do";
		}
	}

	//팝업 목록
	@RequestMapping("/popup_list.do")
	public String popupList(SearchDTO searchOp,Model m,
			@RequestParam(defaultValue  =  "1") int curPage, 
			HttpServletRequest request) {
		//검색옵션 유지
		Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
		if(flashmap!= null) {
			searchOp = (SearchDTO)flashmap.get("searchOp");
			curPage = (int)flashmap.get("curPage");
		}
		Map<String,Object> map = adminService.getPopupList(searchOp, curPage);
		m.addAttribute("pop", map);
		return "admin/popupList"; 
	}

	//팝업 종료
	@RequestMapping("/popup_delete.do")
	public String deletePopup(int[] no, SearchDTO searchOp, 
			@RequestParam(defaultValue  =  "1") int curPage,
			RedirectAttributes rttr) {
		adminService.deletePopup(no);
		rttr.addFlashAttribute("no", no);
		rttr.addFlashAttribute("searchOp", searchOp);
		rttr.addFlashAttribute("curPage", curPage);
		return "redirect:popup_list.do";
	}

	//팝업 수정페이지
	@RequestMapping("/popup_view.do")
	public String viewPopup(
			@RequestParam(defaultValue = "0") int no, 
			Model m, HttpServletRequest request) {
		//검색옵션 유지
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
			//logger.info("multipartfile:"+file.getOriginalFilename());
			Map<String,Object> fileInfo = 
					UploadFileUtils.uploadFile2(file, request, Constants.DIR_POPUP);
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
			//기존 정보
			PopupDTO dto = adminService.getPopupView(no);
			String fileName = "";
			//파일 삭제
			fileName = dto.getImg_src().substring(dto.getImg_src().lastIndexOf("/")+1);
			UploadFileUtils.deleteServerFile(
					fileName, request, Constants.DIR_POPUP);
			adminService.deletePopupFile(no);
			//결과 전송
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

		boolean typeFile = !file.isEmpty() ? true : false; 
		boolean typeUrl = !(dto.getImg_src() == null || "".equals(dto.getImg_src())) 
				? true : false;

		//새로운 이미지가 등록된 경우
		if(typeFile || typeUrl) {
			//기존 파일 삭제
			img_src = dtoOrigin.getImg_src();
			String fileName = img_src.substring(img_src.lastIndexOf("/")+1);
			UploadFileUtils.deleteServerFile(fileName, request, Constants.DIR_POPUP);

			//첨부파일로 등록된 경우
			if(typeFile) {
				//새로운 파일 등록
				Map<String,Object> fileInfo = UploadFileUtils.uploadFile2(
						file, request, Constants.DIR_POPUP);
				img_src = (String)fileInfo.get("fileUrl");
				//파일 정보 저장
				dto.setFilename(img_src.substring(img_src.lastIndexOf("_")+1));
				dto.setFilesize((long)fileInfo.get("fileSize"));
				dto.setImg_src(img_src);

				//url로 등록된 경우
			}else if(typeUrl) {
				dto.setFilename("-");
			}
			//이미지 변경 없는 경우
		}else {
			//기존 정보 저장
			dto.setImg_src(dtoOrigin.getImg_src());
			dto.setFilename(dtoOrigin.getFilename());
			dto.setFilesize(dtoOrigin.getFilesize());
		}
		//날짜+시간 저장
		dto.setStart_date(DateUtils.stringToDate(DateUtils.dateToString(
				dto.getStart_date())+" "+start_time, "yyyy-MM-dd HH:mm"));
		dto.setEnd_date(DateUtils.stringToDate(DateUtils.dateToString(
				dto.getEnd_date())+" "+end_time, "yyyy-MM-dd HH:mm"));
		//업데이트
		adminService.updatePopup(dto);
		return "redirect:popup_list.do";
	}  

	//팝업 재개
	@RequestMapping("/popup_show.do")
	public String popupShow(int[] no, SearchDTO searchOp, 
			@RequestParam(defaultValue  =  "1") int curPage,
			RedirectAttributes rttr) {
		adminService.popupShow(no);
		//검색 옵션 전달
		rttr.addFlashAttribute("no", no);
		rttr.addFlashAttribute("searchOp", searchOp);
		rttr.addFlashAttribute("curPage", curPage);
		return "redirect:popup_list.do";
	}

	//팝업 페이지
	@RequestMapping("/popup_img.do")
	public String popupView(Model m, PopupDTO dto) {
		//팝업 정보 전달
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
