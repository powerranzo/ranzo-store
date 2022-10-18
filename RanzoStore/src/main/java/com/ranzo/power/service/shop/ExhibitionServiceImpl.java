package com.ranzo.power.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.shop.dao.ExhibitionDAO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

	@Inject
	ExhibitionDAO exhibitionDAO;

	@Override
	public List<ExhibitionDTO> listProduct() {
		return exhibitionDAO.listProduct();
	}

	@Override
	public ExhibitionDTO detailProduct(int code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProduct(ExhibitionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(int code) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertProduct(ExhibitionDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String fileInfo(int code) {
		// TODO Auto-generated method stub
		return null;
	}

}
