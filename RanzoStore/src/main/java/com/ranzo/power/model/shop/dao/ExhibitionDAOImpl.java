package com.ranzo.power.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	SqlSession sqlSession;

	@Override
	public List<ExhibitionDTO> listProduct() {
		List<ExhibitionDTO> list = sqlSession.selectList("exhibition.list");
		logger.info("### ExhDAO/productList {}." + list);
		return list;
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

	@Override
	public List<ExhibitionDTO> searchProduct(String keyword) {
		return sqlSession.selectList("exhibition.searchlist", keyword);
	}

	@Override
	public int searchCount(String keyword) {
		return sqlSession.selectOne("exhibition.searchCount", keyword);
	}

}
