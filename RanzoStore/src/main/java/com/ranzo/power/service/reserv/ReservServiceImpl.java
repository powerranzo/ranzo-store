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
		// TODO Auto-generated method stub

	}

	@Override
	public List<ReservDTO> listReserv(String userid) {
		return reservDao.listReserv(userid);
	}

	@Override
	public ReservDTO detail(int no) {
		return reservDao.detail(no);
	}

}
