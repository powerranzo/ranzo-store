package com.ranzo.power.model.shop.dao;

import java.util.List;
import java.util.Map;

import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.HeartDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;


public interface ExhibitionDAO {
	
	List<ExhibitionDTO> listProduct(String sort, List<String> location); //목록보기
	ExhibitionDTO detailProduct(String exhibitionCode);//상세보기
	void updateProduct(ExhibitionDTO dto);//수정
	void deleteProduct(String exhibitionCode);//삭제
	void insertProduct(ExhibitionDTO dto);//입력
	String fileInfo(String exhibitionCode);//첨부파일정보
	String getReserveInfo(String code);
	ProductInfoDTO getProductInfo(String code);

	public HeartDTO findHeart(Map<String, String> map);
	public void pressHeart(HeartDTO heart);
	public void cancelHeart(HeartDTO heart);

	List<ExhibitionDTO> searchProduct(String keyword); //전시검색
	int searchCount(String keyword); //검색전시 카운트
	List<ExhibitionDTO> searchdate(String searchDate); //날짜검색
	int searchDateCount(String searchDate); //날짜검색전시카운트
	ExhibitionDTO detailreserv(String exhibitionCode);//상세보기(예매용)

}
