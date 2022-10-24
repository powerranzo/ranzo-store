package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

public interface AdminDAO {
		
		public int countMemberAll();
		public int countMemberToday(String now);
		public int countMemberQuit();
		public List<MemberDTO> getMemberList(Map<String, Object> map);
		public MemberDTO getMemberView(String userid);
		public List<QnaDTO> getMemberQna(String userid);
		public void deleteMember(Map<String,Object> map);
		public void deleteQna(Map<String, Object> map);
		public int countExbIng(String today);
		public int countExbAll();
		public List<MemberDTO> getExbList(Map<String, Object> map);
		public void insertExb(ExhibitionDTO dto);

}
