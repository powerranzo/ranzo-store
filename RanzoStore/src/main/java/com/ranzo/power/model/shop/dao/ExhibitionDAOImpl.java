package com.ranzo.power.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.shop.dto.ExhibitionDTO;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ExhibitionDTO> listProduct() {
		return sqlSession.selectList("exhibition.list");
	}

	@Override
	public ExhibitionDTO detailProduct(String exhibitionCode) {
		return sqlSession.selectOne("exhibition.detail", exhibitionCode);
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

}
