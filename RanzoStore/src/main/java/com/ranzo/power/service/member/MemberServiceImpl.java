package com.ranzo.power.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.member.dao.MemberDAO;
import com.ranzo.power.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDao.loginCheck(dto);
		if(result) { //로그인 성공
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto2.getName());
			if(dto.getUserid().equals("admin")) {
				int admin=1;
				session.setAttribute("admin", admin);				
			}
		}
		return result;
	}
	
	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}

	@Override
	public int idChk(MemberDTO dto) {
		return memberDao.idChk(dto);
	}


}
