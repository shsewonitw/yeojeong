package com.tje.yeojeong.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;

@Repository
public class Travel_registDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public Travel_registDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 등록
	public boolean insert(Travel_regist obj) {
		boolean result = false;
		String sql = "insert into travel_regist values (0,?,?,?,?,?,?)";
		result = this.jdbcTemplate.update(
				sql,
				obj.getMember_id(),
				obj.getHelp_tel(),
				obj.getStart_date(),
				obj.getEnd_date(),
				obj.getCountry(),
				obj.getCity()) == 0 ? false : true;
		return result;
	}
	
	// travel_id 로 삭제
	public boolean deleteWhereTravelID(Travel_regist obj) {
		boolean result = false;
		String sql = "delete from travel_regist where travel_id = ?";
		result = this.jdbcTemplate.update(
				sql,
				obj.getTravel_id()) == 0 ? false : true;
		return result;
	}

	// Member_id에 해당하는 여행지등록 정보 조회 - 시작 날짜 기준으로 오름차순
	
	public List<Travel_regist> selectWhereMember_id(Travel_regist obj) {
		String sql = "select * from travel_regist where member_id = ? order by start_date";
		List<Travel_regist> Travel_registList = 
				this.jdbcTemplate.query(
				sql,new RowMapper<Travel_regist>() {
					@Override
					public Travel_regist mapRow(ResultSet rs, int arg1) throws SQLException {
						Travel_regist travel_regist = new Travel_regist(
								rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDate(4),rs.getDate(5),rs.getString(6),rs.getString(7));
						return travel_regist;
					}
				});
		
		return Travel_registList.isEmpty() ? null : Travel_registList;
	}
	
}