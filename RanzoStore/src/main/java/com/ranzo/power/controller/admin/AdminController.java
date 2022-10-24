package com.ranzo.power.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.service.admin.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@RequestMapping("/member_list.do")
	public String memberList(SearchDTO searchOp, 
			@RequestParam(defaultValue="1") int curPage, Model m
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) searchOp=(SearchDTO)flashmap.get("searchOp");
		logger.info("flashmap:"+flashmap);
		//		MemberCountDTO mcount=adminService.getMemberCount(); 
		Map<String,Object> map=adminService.getMemberList(searchOp, curPage);
		m.addAttribute("searchOp", searchOp);
		m.addAttribute("mcount", map.get("mcount"));
		m.addAttribute("list", map.get("list"));
		m.addAttribute("pager", map.get("pager"));
		return "admin_member_list";
	}

	@RequestMapping("/member_view.do")
	public String viewMember(String userid, Model m 
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) userid=(String)flashmap.get("userid");
		logger.info("qna_delete userid:" + userid);
		m.addAttribute("dto", adminService.getMemberView(userid));
		m.addAttribute("qna_list", adminService.getMemberQna(userid)); 
		return "admin_member_view";
	}

	@RequestMapping("/member_delete.do")
	public String deleteMember(String[] userids, SearchDTO searchOp
			, RedirectAttributes rttr) {
		adminService.deleteMember(userids);
		rttr.addFlashAttribute("searchOp", searchOp);
		return "redirect:/admin/member_list.do";
	}

	@RequestMapping("/qna_delete")
	public String deleteQna(String[] qna_bno, String userid
			, RedirectAttributes rttr) {
		logger.info("qna_delete userid:" + userid);
		adminService.deleteQna(qna_bno);
		rttr.addFlashAttribute("userid", userid);
		return "redirect:/admin/member_view.do";
	}

	@RequestMapping("/exb_list.do")
	public String exbList(SearchDTO searchOp, 
			@RequestParam(defaultValue="1") int curPage, Model m
			,HttpServletRequest request) {
		Map<String,?> flashmap=RequestContextUtils.getInputFlashMap(request);
		if(flashmap!=null) searchOp=(SearchDTO)flashmap.get("searchOp");
		logger.info("flashmap:"+flashmap);
		Map<String,Object> map=adminService.getExbList(searchOp, curPage);
		m.addAttribute("exb", map);
		return "admin_exb_list";
	}

	@GetMapping("/exb_write.do")
	public String writeExb() {
		return "admin_exb_write";
	}

	@PostMapping("/exb_write.do")
	public String writeExb(String start_date, String end_date, ExhibitionDTO dto) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		dto.setStart_date(format.parse(start_date));
		dto.setEnd_date(format.parse(end_date)); 
		adminService.insertExb(dto);
		return "redirect: admin_exb_list"; 
	}


	//	@RequestMapping("/exb_delete.do")
	//	public String deleteExb(String[] userids, SearchDTO searchOp
	//			, RedirectAttributes rttr) {
	//		adminService.deleteMember(userids);
	//		rttr.addFlashAttribute("searchOp", searchOp);
	//		return "redirect:/admin/member_list.do";
	//	}


}
