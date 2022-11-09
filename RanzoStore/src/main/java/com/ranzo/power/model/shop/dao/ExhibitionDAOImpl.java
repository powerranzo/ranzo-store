package com.ranzo.power.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.model.shop.dto.ProductInfoDTO;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	SqlSession sqlSession;

	@Override
	public List<ExhibitionDTO> listProduct(String sort, List<String> location) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort", sort);
		map.put("location", location);
		/*
		 int n = 0; for (String target : location) { map.put("location" + n++,
		 target); }
		 */
		logger.info("### ExhDAO/map/" + map);

		List<ExhibitionDTO> list = sqlSession.selectList("exhibition.list", map);
		// logger.info("### ExhDAO/productList/" + list);
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
	public ProductInfoDTO getProductInfo(String code) {
		ProductInfoDTO productInfo = sqlSession.selectOne("exhibition.getProductInfo", code);
		logger.info("### ExhDAO/getProductInfo/" + productInfo);
		return productInfo;
	}

	@Override
	public String getReserveInfo(String code) {
		String reserveInfo = sqlSession.selectOne("exhibition.getReserveInfo", code);
		logger.info("### ExhDAO/getReserveInfo/" + reserveInfo);
		return reserveInfo;
	}

}
