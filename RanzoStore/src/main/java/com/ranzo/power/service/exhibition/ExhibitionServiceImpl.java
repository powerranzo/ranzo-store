package com.ranzo.power.service.exhibition;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.exhibition.dao.ExhibitionDAO;
import com.ranzo.power.model.exhibition.dto.ExhibitionDTO;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {
	
	@Inject
	ExhibitionDAO exhibitionDao;

	@Override
	public List<ExhibitionDTO> listProduct() {
		return exhibitionDao.listProduct();
	}

	@Override
	public ExhibitionDTO detailProduct(String code) {
		return exhibitionDao.detailProduct(code);
	}

}
