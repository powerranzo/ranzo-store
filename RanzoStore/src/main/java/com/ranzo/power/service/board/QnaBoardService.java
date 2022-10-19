package com.ranzo.power.service.board;

import java.util.List;

import com.ranzo.power.model.board.dto.QnaBoardDTO;

public interface QnaBoardService {
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int bno); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장(서비스에서는 없어도 됨)
	public void updateAttach(String fullName, int bno); //첨부파일 수정
	public void create(QnaBoardDTO dto) throws Exception; //글쓰기
	public void update(QnaBoardDTO dto) throws Exception; //글수정
	public void delete(QnaBoardDTO dto) throws Exception; //글삭제
	public List<QnaBoardDTO> listAll() throws Exception; //글목록
	public void increaseViewcnt(int bno) throws Exception; //조회수 증가 처리
	public int countArticle() throws Exception;//레코드 갯수 계산
	public QnaBoardDTO read(int bno) throws Exception; //레코드 조회

}
