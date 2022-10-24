package com.ranzo.power.model.exhibition.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.exhibition.dto.ExhibitionDTO;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ExhibitionDTO> listProduct() {
		return sqlSession.selectList("exhibition.list");
	}

	@Override
	public ExhibitionDTO detailProduct(String code) {
		return sqlSession.selectOne("exhibition.detail", code);
	}

}
