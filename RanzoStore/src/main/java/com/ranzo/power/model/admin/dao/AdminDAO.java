package com.ranzo.power.model.admin.dao;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.admin.dto.PopupDTO;
import com.ranzo.power.model.admin.dto.SearchDTO;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.reserv.dto.ReservDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

public interface AdminDAO {
		//COMMON
		public int countTbAll(String table);
		public void updateShowN(Map<String, Object> map);	
		//MEMBER
		public int countMemberToday(String now);
		public int countMemberQuit();
		public int countSearchMember(Map<String, Object> map);
		public List<MemberDTO> getMemberList(Map<String, Object> map);
		public List<QnaDTO> getMemberQna(String userid);
		public List<ReservDTO> getMemberReserv(String userid);
		public void deleteMember(Map<String,Object> map);
		//EXHIBITION
		public int countExbIng(String today);
		public int countSearchExb(Map<String, Object> map);
		public List<MemberDTO> getExbList(Map<String, Object> map);
		public void insertExb(ExhibitionDTO dto);
		public ExhibitionDTO getExbView(String code);
		public void updateExb(ExhibitionDTO dto);
		public void deleteExbFile(Map<String, Object> map);
		//RESERVATION
		public int countRsvToday(String today);
		public int countRsvPaid();
		public int countSearchRsv(Map<String, Object> map);
		public List<ReservDTO> getReservList(Map<String, Object> map);
		//QNA
		public int countQnaNew();
		public int countQnaToday(String today);
		public int countSearchQna(Map<String, Object> map);
		public List<QnaDTO> getQnaList(Map<String, Object> map);
		//POPUP
		public int countSearchPopup(Map<String, Object> map);
		public List<PopupDTO> getPopupList(Map<String, Object> map);
		public PopupDTO getPopupView(int no);
		public void insertPopup(PopupDTO dto);
		public void updatePopup(PopupDTO dto);
		public void deletePopupFile(int no);
		public void popupShow(int no);
		public List<PopupDTO> getPopupOn(String today);
		public void insertProductInfo(ProductInfoDTO idto);
//		public ProductInfoDTO getProductInfoView(String code);
		public void updateProductInfo(ProductInfoDTO idto);
}
