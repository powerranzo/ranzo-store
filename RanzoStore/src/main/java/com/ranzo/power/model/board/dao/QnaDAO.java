package com.ranzo.power.model.board.dao;

import java.util.List;

import com.ranzo.power.model.board.dto.QnaDTO;

public interface QnaDAO {
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int bno); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	public void updateAttach(String fullname, int bno); //첨부파일 수정
	public void create(QnaDTO dto) throws Exception; //글쓰기
	public void update(QnaDTO dto) throws Exception; //글수정
	public void delete(int bno) throws Exception; //글삭제
	public List<QnaDTO> listAll(String search_option, String keyword) throws Exception; //글목록
	public void increaseViewcnt(int bno) throws Exception; //조회수 증가 처리
	public int countArticle() throws Exception;//레코드 갯수 계산
	public QnaDTO read(int bno) throws Exception; //레코드 조회

}
