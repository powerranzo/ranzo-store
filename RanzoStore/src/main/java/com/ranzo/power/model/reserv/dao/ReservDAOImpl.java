package com.ranzo.power.model.reserv.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ranzo.power.model.reserv.dto.ReservDTO;

@Repository
public class ReservDAOImpl implements ReservDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insert(ReservDTO dto) {
		sqlSession.insert("reserv.insert", dto);

	}

	@Override
	public void delete(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ReservDTO> listReserv(String userid) {
		return sqlSession.selectList("reserv.orderlist", userid);
	}

	@Override
	public ReservDTO detail(int no) {
		return sqlSession.selectOne("reserv.orderdetail", no);
	}

}
