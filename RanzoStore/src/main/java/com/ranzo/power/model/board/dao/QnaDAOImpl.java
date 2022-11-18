package com.ranzo.power.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ranzo.power.controller.board.ReviewController;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.board.dto.ReviewDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void create(QnaDTO dto) throws Exception {
		sqlSession.insert("qna.insert", dto);
	}

	@Override
	public void update(QnaDTO dto) throws Exception {
		sqlSession.update("qna.update",dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("qna.delete", bno);

	}

	@Override
	public List<QnaDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("qna.listAll", map);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("qna.increaseViewcnt", bno);

	}

	@Override
	public int countArticle() throws Exception {
		return sqlSession.selectOne("qna.countArticle");
	}

	@Override
	public QnaDTO read(int bno) throws Exception {
		return sqlSession.selectOne("qna.read", bno);
	}

	//답글 작성
	@Override
	public void create_reply(QnaDTO dto) throws Exception {
		sqlSession.insert("qna.insert_reply", dto);
	}

	//답글 순서 조정
	@Override
	public void update_reply(QnaDTO dto) throws Exception {
		sqlSession.update("qna.update_reply", dto);		
	}

	@Override
	public List<QnaDTO> getQnaInfo(String code) {
		List<QnaDTO> qnaInfo= sqlSession.selectList("qna.getQnaInfo", code);
		logger.info("### QnaDAO/getQnaInfo{}. " + qnaInfo);
		return qnaInfo;
	}

	@Override
	public int countArticle(String code) {
		int count = sqlSession.selectOne("qna.countArticleExhibition",code);
		logger.info("### QnaDAO/count" + count);
		return count;
	}

}
