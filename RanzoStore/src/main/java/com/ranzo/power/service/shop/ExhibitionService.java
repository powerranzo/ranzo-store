package com.ranzo.power.service.shop;

import java.util.List;

import com.ranzo.power.model.shop.dto.ExhibitionDTO;

public interface ExhibitionService {

	List<ExhibitionDTO> listProduct(); //목록보기
	ExhibitionDTO detailProduct(int code);//상세보기
	void updateProduct(ExhibitionDTO dto);//수정
	void deleteProduct(int code);//삭제
	void insertProduct(ExhibitionDTO dto);//입력
	String fileInfo(int code);//첨부파일정보
}
