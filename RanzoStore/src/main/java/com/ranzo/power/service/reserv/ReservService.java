package com.ranzo.power.service.reserv;

import java.util.List;

import com.ranzo.power.model.reserv.dto.ReservDTO;

public interface ReservService {
	public void insert(ReservDTO dto);//reserv 테이블에 저장
	public void delete(int no); //테이블에서 주문번호로 삭제
	public List<ReservDTO> listReserv(String userid);//주문 리스트보기
	public ReservDTO detail(int no);

}
