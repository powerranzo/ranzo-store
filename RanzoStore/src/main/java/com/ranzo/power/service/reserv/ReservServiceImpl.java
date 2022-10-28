package com.ranzo.power.service.reserv;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ranzo.power.model.reserv.dao.ReservDAO;
import com.ranzo.power.model.reserv.dto.ReservDTO;

@Service
public class ReservServiceImpl implements ReservService {
	
	@Inject
	ReservDAO reservDao;

	@Override
	public void insert(ReservDTO dto) {
		reservDao.insert(dto);

	}

	@Override
	public void delete(int no) {
		reservDao.delete(no);

	}

	@Override
	public List<ReservDTO> listReserv(String userid, int start, int end) {
		return reservDao.listReserv(userid, start, end);
	}

	@Override
	public ReservDTO detail(int no) {
		return reservDao.detail(no);
	}

	@Override
	public void updateAddr(ReservDTO dto) {
		reservDao.updateAddr(dto);
		
	}

	@Override
	public int countorder(String userid) {
		return reservDao.countorder(userid);
	}

	@Override
	public List<ReservDTO> listReserv_search(String userid, String strDate, String endDate, int start, int end) {
		return reservDao.listReserv_search(userid,strDate,endDate, start, end);
	}

	@Override
	public int countorder_search(String userid, String strDate, String endDate) {
		return reservDao.countorder_search(userid, strDate, endDate);
	}

	@Override
	public int firstorder(String userid) {
		return reservDao.firstorder(userid);
	}



}
