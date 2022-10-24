package com.ranzo.power.model.exhibition.dao;

import java.util.List;

import com.ranzo.power.model.exhibition.dto.ExhibitionDTO;

public interface ExhibitionDAO {
	List<ExhibitionDTO> listProduct(); //목록보기
	ExhibitionDTO detailProduct(String code);//상세보기
}
