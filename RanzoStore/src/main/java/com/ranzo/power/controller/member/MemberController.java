package com.ranzo.power.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.service.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	//로깅
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	//로그인 페이지 이동
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	//로그인
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(MemberDTO dto, HttpSession session) {
		//로그인 성공 true, 실패 false
		boolean result=memberService.loginCheck(dto, session);
		ModelAndView mav=new ModelAndView();
		if(result) {//로그인 성공
			mav.setViewName("home"); 
		}else {//로그인 실패
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		mav.setViewName("home");
		mav.addObject("message", "logout");
		return mav;
	}
	
	//회원정보수정관련
	//아직 못함.
	@RequestMapping("view.do")
	public String view(@RequestParam String userid, Model model) {
		//모델에 자료 저장
		model.addAttribute("dto", memberService.viewMember(userid));
		return "member/view";
	}
	
	//회원가입 등록
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	//회원데이터 입력 처리
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberService.insertMember(dto);
		return "member/joinSuccess";
	}
	
	//아이디 중복 처리
	@RequestMapping("idChk.do")
	@ResponseBody
	public int idChk(MemberDTO dto) {
		return memberService.idChk(dto);
	}
	
}
