package com.ranzo.power.service.exhibition;

import java.util.List;

import com.ranzo.power.model.exhibition.dto.ExhibitionDTO;

public interface ExhibitionService {
	List<ExhibitionDTO> listProduct(); //목록보기
	ExhibitionDTO detailProduct(String code);//상세보기
}
