package com.ranzo.power.model.reserv.dao;

import java.util.List;

import com.ranzo.power.model.reserv.dto.ReservDTO;

public interface ReservDAO {
	public void insert(ReservDTO dto);//reserv 테이블에 저장
	public void delete(int no); //테이블에서 주문번호로 삭제
	public List<ReservDTO> listReserv(String userid, int start, int end);//주문 리스트보기
	public ReservDTO detail(int no);
	public void updateAddr(ReservDTO dto);
	public int countorder(String userid);
	public List<ReservDTO> listReserv_search(String userid, String strDate, String endDate, int start, int end);
	public int countorder_search(String userid, String strDate, String endDate);
	public int firstorder(String userid);
	public List<ReservDTO> canclelist(String userid, int start, int end);
	public int countcancle(String userid);
	public List<ReservDTO> mypagelist(String userid);


	

}
