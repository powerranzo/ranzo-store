package com.ranzo.power.model.reserv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		sqlSession.update("reserv.delete", no);

	}

	@Override
	public List<ReservDTO> listReserv(String userid,int start, int end) {
		Map<String, Object> map =new HashMap<>();
		map.put("userid", userid);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("reserv.orderlist", map);
	}

	@Override
	public ReservDTO detail(int no) {
		return sqlSession.selectOne("reserv.orderdetail", no);
	}

	@Override
	public void updateAddr(ReservDTO dto) {
		sqlSession.update("reserv.updateaddr", dto);
		
	}

	@Override
	public int countorder(String userid) {
		return sqlSession.selectOne("reserv.countorder", userid);
	}

	@Override
	public List<ReservDTO> listReserv_search(String userid, String strDate, String endDate, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("strDate", strDate);
		map.put("endDate", endDate);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("reserv.orderlist2", map);
	}

	@Override
	public int countorder_search(String userid, String strDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("strDate", strDate);
		map.put("endDate", endDate);
		return sqlSession.selectOne("reserv.countorder2", map);
	}

	@Override
	public int firstorder(String userid) {
		return sqlSession.selectOne("reserv.firstorder", userid);
	}

	@Override
	public List<ReservDTO> canclelist(String userid, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("reserv.canclelist", map);
	}

	@Override
	public int countcancle(String userid) {
		return sqlSession.selectOne("reserv.countcancle", userid);
	}

	@Override
	public List<ReservDTO> mypagelist(String userid, String today, String before7) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("today", today);
		map.put("before7", before7);
		return sqlSession.selectList("reserv.mypagelist", map);
	}

}
