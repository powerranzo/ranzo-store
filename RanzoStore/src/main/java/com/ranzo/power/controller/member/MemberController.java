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
	
	//마이페이지 이동
	@RequestMapping("mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	//회원 수정 확인 페이지 이동
	@RequestMapping("infoEnter.do")
	public String infoEnter() {
		return "member/infoEnter";
	}
	
	//회원수정 페이지로 이동하기 위해 비밀번호 재확인
	@RequestMapping("infoEnterCheck.do")
	public ModelAndView infoEnterCheck(String userid, String passwd) {
		boolean result=memberService.infoEnterCheck(userid, passwd);
		ModelAndView mav=new ModelAndView();
		if(result) {
			mav.addObject("userid", userid);
			mav.setViewName("redirect:info.do"); 
		}else {
			mav.addObject("message", "error");
			mav.setViewName("member/infoEnter");
		}
		return mav;
	}
	
	//회원정보페이지에서 정보 보여주기
	@RequestMapping("info.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberService.viewMember(userid));
		logger.info(userid);
		return "member/info";
	}
	
	//회원 정보 수정
	@RequestMapping("update.do")
	public String update(MemberDTO dto) {
		memberService.updateMember(dto);
		return "member/mypage";
	}
	
	//회원 탈퇴
	@RequestMapping("delete.do")
	public String delete(String userid, HttpSession session) {
		memberService.deleteMember(userid);
		memberService.logout(session);
		return "home";
	}
	
	//아이디찾기 페이지 이동
	@RequestMapping("findId.do")
	public String findId() {
		return "member/findId";
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping("findPwd.do")
	public String findPwd() {
		return "member/findPwd";
	}
	
}
