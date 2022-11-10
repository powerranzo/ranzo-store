package com.ranzo.power.model.shop.dao;

import java.util.List;

import com.ranzo.power.model.shop.dto.ExhibitionDTO;


public interface ExhibitionDAO {
	
	List<ExhibitionDTO> listProduct(); //목록보기
	ExhibitionDTO detailProduct(String exhibitionCode);//상세보기
	void updateProduct(ExhibitionDTO dto);//수정
	void deleteProduct(String exhibitionCode);//삭제
	void insertProduct(ExhibitionDTO dto);//입력
	String fileInfo(String exhibitionCode);//첨부파일정보
	List<ExhibitionDTO> searchProduct(String keyword);
	int searchCount(String keyword);
	List<ExhibitionDTO> searchdate(String searchDate);
	int searchDateCount(String searchDate);
}
