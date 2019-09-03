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
public class Travel_endDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public Travel_endDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 등록
	public boolean insert(Travel_end obj) {
		boolean result = false;
		String sql = "insert into travel_end values (?,?,?,?,?,?,?)";
		result = this.jdbcTemplate.update(sql, obj.getTravel_id(), obj.getMember_id(), obj.getHelp_tel(), obj.getStart_date(),
				obj.getEnd_date(), obj.getCountry(), obj.getCity()) == 0 ? false : true;
		return result;
	}


	public boolean deleteWhereTravel(Travel_end obj) {
		boolean result = false;
		String sql = "delete from travel_end where travel_id = ?";
		result = this.jdbcTemplate.update(sql, obj.getTravel_id()) == 0 ? false : true;
		return result;
	}
	public boolean updateWhereTravel(Travel_end obj) {
		boolean result = false;
		String sql = "update travel_end set help_tel = ?, country = ?, city = ?, start_date = ?, end_date = ? where travel_id = ? ";
		result = this.jdbcTemplate.update(sql, obj.getHelp_tel(), obj.getCountry(), obj.getCity(), obj.getStart_date(), obj.getEnd_date(), obj.getTravel_id()) == 0 ? false : true;
		return result;
	}

	// Member_id에 해당하는 여행지등록 정보 조회 - 시작 날짜 기준으로 오름차순

	public List<Travel_end> selectWhereMember_id(Travel_end obj) {
		String sql = "select * from Travel_end where member_id = ? order by start_date";
		List<Travel_end> Travel_endList = this.jdbcTemplate.query(sql, new RowMapper<Travel_end>() {
			@Override
			public Travel_end mapRow(ResultSet rs, int arg1) throws SQLException {
				Travel_end Travel_end = new Travel_end(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getDate(4), rs.getDate(5), rs.getString(6), rs.getString(7));
				return Travel_end;
			}
		}, obj.getMember_id());

		return Travel_endList.isEmpty() ? null : Travel_endList;
	}

	
	// Count
	public int Travel_endCount() {
		String sql = "select count(*) from Travel_end";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
	

}