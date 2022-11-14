package com.ranzo.power.model.board.dao;

import java.util.List;

import com.ranzo.power.model.board.dto.FaqDTO;

public interface FaqDAO {
	public List<FaqDTO> listAll(String searchOption, String skeyword, int start, int end); //리스트 불러오기
	public List<FaqDTO> reservList(String data, int start, int end);//예매관련
	public int countList();
	public int resultCount(String data);
	public FaqDTO view(int no);
	public void insert(FaqDTO dto);
	public void update(FaqDTO dto);
	public void delete(int no);
}
