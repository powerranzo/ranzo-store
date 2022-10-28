package com.ranzo.power.controller.admin;

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

import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.service.admin.AdminService;
import com.ranzo.power.service.admin.UploadService;
import com.ranzo.power.utils.DateFunction;

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
		return "admin/memberView";
	}

	@RequestMapping("/member_delete.do")
	public String deleteMember(String[] userids, SearchDTO searchOp
			, RedirectAttributes rttr) {
		adminService.deleteMember(userids);
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:member_list.do";
	}

	@RequestMapping("/qna_delete")
	public String deleteQna(String[] qna_bno, String userid
			, RedirectAttributes rttr) {
		adminService.deleteQna(qna_bno);
		rttr.addFlashAttribute("userid", userid);
		return "redirect:member_view.do";
	}

	@RequestMapping("/exb_list.do")
	public String exbList(SearchDTO searchOp, 
			@RequestParam(defaultValue="1") int curPage, Model m
			,HttpServletRequest request) {
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
	public String writeExb(String startDate, String endDate, 
			ExhibitionDTO dto, HttpServletRequest request, MultipartFile file) {
		logger.info("multipartfile:"+file.getOriginalFilename());
		String fileUrl="-";
		if(!file.getOriginalFilename().equals("")) 
			fileUrl=uploadService.uploadFile(file, request);
		adminService.insertExb(startDate, endDate, dto, fileUrl);
		return "redirect:exb_list.do"; 
	}


	@RequestMapping("/exb_view.do")
	public String getExbView(String code, Model m, HttpServletRequest request) {
		ExhibitionDTO dto=adminService.getExbView(code);
		m.addAttribute("startDate", DateFunction.dateToString(dto.getStart_date())); 
		m.addAttribute("endDate", DateFunction.dateToString(dto.getEnd_date()));
		m.addAttribute("fileName", dto.getThumnail().substring(dto.getThumnail().lastIndexOf("_")+1));
		m.addAttribute("dto", dto);
		return "admin/exbUpdate";
	}

	@RequestMapping("/exb_update.do")
	public String updateExb(String startDate, String endDate, 
			ExhibitionDTO dto, HttpServletRequest request, MultipartFile file) {
		String fileUrl="-";
		if(!file.getOriginalFilename().equals("")) 
			fileUrl=uploadService.uploadFile(file, request);
		adminService.updateExb(startDate,endDate,dto, fileUrl);
		return "redirect:exb_list.do";
	}  

	@RequestMapping("thumnail_delete.do")
	public ResponseEntity<String> fileDelete(String code, HttpServletRequest request) {
		logger.info("thumnail_delete.do 호출");
		ExhibitionDTO dto=adminService.getExbView(code);
		String fileName=dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
		logger.info("fileName_thumnail_delete:"+fileName);
		uploadService.deleteServerFile(fileName, request);
		adminService.deleteThumnail(code); 
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@RequestMapping("/exbs_delete.do")
	public String deleteExb(String[] codes, SearchDTO searchOp,
			HttpServletRequest request, RedirectAttributes rttr) {
		ExhibitionDTO dto=null;
		for(int i=0; i<codes.length; i++) {
			dto=adminService.getExbView(codes[i]);
			String fileName=dto.getThumnail();
			if(!fileName.equals("-")) {
				fileName=dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
				uploadService.deleteServerFile(fileName, request);
			}
			adminService.deleteExb(codes[i]);
		}//for
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:/admin/exb_list.do";
	}

	@RequestMapping("/exb_delete.do")
	public String deleteExb(String code, HttpServletRequest request) {
		ExhibitionDTO dto=adminService.getExbView(code);
		String fileName="";
		if(!dto.getThumnail().equals("-")) {
			fileName=dto.getThumnail().substring(dto.getThumnail().lastIndexOf("/")+1);
			uploadService.deleteServerFile(fileName, request);
		}
		adminService.deleteExb(code);
		return "redirect:/admin/exb_list.do";
	}



}
