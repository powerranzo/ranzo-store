package com.ranzo.power.service.shop;

import java.util.List;

import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

public interface ExhibitionService {

	List<ExhibitionDTO> listProduct(String sort, List<String> location); //목록보기
	ExhibitionDTO detailProduct(String exhibitionCode);//상세보기
	void updateProduct(ExhibitionDTO dto);//수정
	void deleteProduct(String exhibitionCode);//삭제
	void insertProduct(ExhibitionDTO dto);//입력
	String fileInfo(String exhibitionCode);//첨부파일정보
	String getReserveInfo(String code);
	ProductInfoDTO getProductInfo(String code);
}
