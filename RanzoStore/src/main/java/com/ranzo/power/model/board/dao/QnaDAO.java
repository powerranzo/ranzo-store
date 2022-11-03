package com.ranzo.power.model.board.dao;

import java.util.List;

import com.ranzo.power.model.board.dto.QnaDTO;

public interface QnaDAO {
	public void create(QnaDTO dto) throws Exception; //글쓰기
	public void update(QnaDTO dto) throws Exception; //글수정
	public void delete(int bno) throws Exception; //글삭제
	public List<QnaDTO> listAll(String search_option, String keyword, int start, int end) throws Exception; //글목록
	public void increaseViewcnt(int bno) throws Exception; //조회수 증가 처리
	public int countArticle() throws Exception;//레코드 갯수 계산
	public QnaDTO read(int bno) throws Exception; //레코드 조회
	
	public void create_reply(QnaDTO dto) throws Exception; //답글 작성
	public void update_reply(QnaDTO dto) throws Exception; //답글 순서 수정

}
