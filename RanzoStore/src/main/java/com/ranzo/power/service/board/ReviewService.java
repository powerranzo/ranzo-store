package com.ranzo.power.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ranzo.power.model.board.dto.ReviewDTO;

public interface ReviewService {
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int bno); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	public void updateAttach(String fullname, int bno); //첨부파일 수정
	public void create(ReviewDTO dto) throws Exception; //글쓰기
	public void update(ReviewDTO dto) throws Exception; //글수정
	public void delete(int bno) throws Exception; //글삭제
	public List<ReviewDTO> listAll(String search_option, String keyword, int start, int end) throws Exception; //글목록
	public void increaseViewcnt(int bno, HttpSession session) throws Exception; //조회수 증가 처리
	public int countArticle() throws Exception;//레코드 갯수 계산
	public ReviewDTO read(int bno) throws Exception; //레코드 조회
	int countArticle(String code) throws Exception;
	public List<ReviewDTO> getReviewInfo(String code);
	public float avgRating(String code);
}
