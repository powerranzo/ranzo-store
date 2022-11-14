package com.ranzo.power.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.board.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<FaqDTO> listAll(String searchOption, String skeyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("skeyword", skeyword);
		map.put("start", start);
		map.put("end", end);	
		return sqlSession.selectList("faq.listAll", map);
	}

	@Override
	public List<FaqDTO> reservList(String data, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("data", data);
		map.put("start", start);
		map.put("end", end);		
		return sqlSession.selectList("faq.reservList", map);
	}

	@Override
	public int countList() {
		return sqlSession.selectOne("faq.countList");
	}

	@Override
	public int resultCount(String data) {
		return sqlSession.selectOne("faq.resultCount", data);
	}

	@Override
	public FaqDTO view(int no) {
		FaqDTO dto = sqlSession.selectOne("faq.view",no);
		dto.setContent(dto.getContent().replace("\n", "<br>"));
		return dto;
	}

	@Override
	public void insert(FaqDTO dto) {
		sqlSession.insert("faq.insert", dto);
		
	}

}
