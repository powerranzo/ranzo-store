package com.ranzo.power.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String logout(HttpSession session) {
		 String access_Token = (String)session.getAttribute("access_Token");

	        if(access_Token != null && !"".equals(access_Token)){
	            memberService.kakaoLogout(access_Token);
	            session.removeAttribute("access_Token");
	            session.removeAttribute("userid");
	            session.removeAttribute("name");
	            session.removeAttribute("email");
	            System.out.println("카카오 로그아웃");
	        }else{
	        	memberService.logout(session);
	            System.out.println("일반 로그아웃");
	        }
		return "home";
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
		boolean result=memberService.pwdCheck(userid, passwd);
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
	
	//회원 탈퇴 페이지 이동
	@RequestMapping("withdrawal.do")
	public String withdrawal() {
		return "member/withdrawal";
	}
	
	//회원탈퇴를 위해 비밀번호 재확인
	@RequestMapping("deleteCheck.do")
	public ModelAndView deleteCheck(String userid, String passwd) {
		boolean result=memberService.pwdCheck(userid, passwd);
		ModelAndView mav=new ModelAndView();
		if(result) {
			mav.addObject("userid", userid);
			mav.setViewName("redirect:delete.do"); 
		}else {
			mav.addObject("message", "error");
			mav.setViewName("member/withdrawal");
		}
		return mav;
	}
	
	//회원 탈퇴
	@RequestMapping("delete.do")
	public String delete(String userid, HttpSession session) {
		memberService.deleteMember(userid);
		memberService.logout(session);
		return "home";
	}
	
	//아이디찾기 페이지 이동
	@RequestMapping("findIdPage.do")
	public String findIdPage() {
		return "member/findId";
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping("findPwdPage.do")
	public String findPwdPage() {
		return "member/findPwd";
	}
	
	//아이디 찾기
	@RequestMapping("findId.do")
	public ModelAndView findId(String name, String email, MemberDTO dto) {
		dto.setName(name);
		dto.setEmail(email);
		MemberDTO dto2 = memberService.findId(dto);
		ModelAndView mav=new ModelAndView();
		if(dto2 != null) {
			// 아이디 앞 3자리만 보여주고 뒤 글자는 '*'처리
			String realId = dto2.getUserid();
			String halfId = realId.substring(0, 3);
			String tmp = "";
			for(int i=0; i<6; i++) {
				tmp += "*";
			}
			String resultId = halfId + tmp;
			mav.addObject("userid", resultId);			
			mav.addObject("dto", dto2);			
			mav.setViewName("member/foundId");
		}else {
			mav.addObject("message", "checkAgain");
			mav.setViewName("member/findId");
		}
		return mav;
	}
	
	//비밀번호 찾기 (기재된 내용과 회원 정보가 일치하는 지 확인)
	@RequestMapping("findPwd.do")
	public ModelAndView findPwd(String userid, String name, String email, MemberDTO dto) {
		dto.setUserid(userid);
		dto.setName(name);
		dto.setEmail(email);
		MemberDTO dto2 = memberService.findPwd(dto);
		ModelAndView mav=new ModelAndView();
		if(dto2 != null) {
			mav.addObject("userid", userid);
			mav.addObject("email", email);
			mav.setViewName("redirect:sendPwd.do");
		}else {
			mav.addObject("message", "checkAgain");
			mav.setViewName("member/findPwd");
		}
		return mav;
	}
	
	//임시 비밀번호 이메일 전송
	@RequestMapping("sendPwd.do")
	public String sendPwd(String userid, String email) throws Exception {
		memberService.sendPwd(userid, email);
		return "member/foundPwd";
	}
	
	//카카오 로그인
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		System.out.println(code);
		String access_Token = memberService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		
		MemberDTO dto = memberService.getUserInfo(access_Token);
		System.out.println("$$$access_Token$$$$ : " + access_Token);
		
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("userid", dto.getUserid());
		session.setAttribute("name", dto.getName());
		session.setAttribute("email", dto.getEmail());
		session.setAttribute("access_Token", access_Token);
		return "home";
	}
	
	//배송지관리 페이지 이동
	@RequestMapping("addressList.do")
	public String addressList() {
		return "member/addressList";
	}

}
