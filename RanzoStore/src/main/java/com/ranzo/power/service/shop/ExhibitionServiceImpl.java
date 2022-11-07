package com.ranzo.power.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.model.shop.dao.ExhibitionDAO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);	

	@Inject
	ExhibitionDAO exhibitionDAO;

	@Override
	public List<ExhibitionDTO> listProduct() {
		return exhibitionDAO.listProduct();
	}

	@Override
	public ExhibitionDTO detailProduct(String exhibitionCode) {
		return exhibitionDAO.detailProduct(exhibitionCode);
	}

	@Override
	public void updateProduct(ExhibitionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(String exhibitionCode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertProduct(ExhibitionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String fileInfo(String exhibitionCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductInfoDTO getProductInfo(String code) {
		return exhibitionDAO.getProductInfo(code);
	}
	
	@Override
	public String getReserveInfo(String code) {		
		return exhibitionDAO.getReserveInfo(code);
	}
}
