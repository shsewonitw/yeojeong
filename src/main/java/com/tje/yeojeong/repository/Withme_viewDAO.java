package com.tje.yeojeong.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;

@Repository
public class Withme_viewDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public Withme_viewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 맵퍼 클래스
	class Withme_viewRowMapper implements RowMapper<Withme_view>{
		@Override
		public Withme_view mapRow(ResultSet rs, int arg1) throws SQLException {
			Withme_view withme_view = new Withme_view(
					rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getDate(5),rs.getInt(6),rs.getString(7));
			return withme_view;
		}
	}
	
	
}