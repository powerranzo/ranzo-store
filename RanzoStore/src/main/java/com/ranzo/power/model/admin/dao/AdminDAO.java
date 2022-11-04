package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

public interface AdminDAO {
		public int countTbAll(String table);
//		public int countMemberAll();
		public int countMemberToday(String now);
		public int countMemberQuit();
		public int countSearchMember(Map<String, Object> map);
		public List<MemberDTO> getMemberList(Map<String, Object> map);
		public MemberDTO getMemberView(String userid);
		public List<QnaDTO> getMemberQna(String userid);
		public List<ReservDTO> getMemberReserv(String userid);
		public void deleteMember(Map<String,Object> map);
		public void deleteQna(Map<String, Object> map);
		public void deleteReserv(Map<String, Object> map);
		public int countExbIng(String today);
//		public int countExbAll();
		public int countSearchExb(Map<String, Object> map);
		public List<MemberDTO> getExbList(Map<String, Object> map);
		public void insertExb(ExhibitionDTO dto);
		public ExhibitionDTO getExbView(String code);
		public void updateExb(ExhibitionDTO dto);
		public void deleteThumnail(String code);
		public void deleteExb(String code);
		public int countSearchReserv(Map<String, Object> map);
		
		public List<ReservDTO> getReservList(Map<String, Object> map);
		public int countReservIng(String today);

}
