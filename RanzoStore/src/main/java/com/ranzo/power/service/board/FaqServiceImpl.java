package com.ranzo.power.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.board.dao.FaqDAO;
import com.ranzo.power.model.board.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Inject
	FaqDAO faqDao;

	@Override
	public List<FaqDTO> reservList(String data, int start, int end) {
		return faqDao.reservList(data, start, end);
	}

	@Override
	public int countList() {
		return faqDao.countList();
	}

	@Override
	public List<FaqDTO> listAll(String searchOption, String skeyword, int start, int end) {
		return faqDao.listAll(searchOption, skeyword, start, end);
	}

	@Override
	public int resultCount(String data) {
		return faqDao.resultCount(data);
	}

	@Override
	public FaqDTO view(int no) {
		return faqDao.view(no);
	}

	@Override
	public void insert(FaqDTO dto) {
		faqDao.insert(dto);
		
	}

	@Override
	public void update(FaqDTO dto) {
		faqDao.update(dto);
		
	}

	@Override
	public void delete(int no) {
		faqDao.delete(no);
		
	}

}
