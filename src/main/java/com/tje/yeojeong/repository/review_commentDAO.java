package com.tje.yeojeong.repository;

import java.sql.*;import javax.sql.DataSource;
import com.tje.yeojeong.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class review_commentDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public review_commentDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// RowMap 등록
	class review_commentMapper implements RowMapper<review_comment> {
		public review_comment mapRow(ResultSet rs, int rowNum) throws SQLException {
			review_comment rComment = new review_comment(
					rs.getInt(1),
					rs.getString(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getTimestamp(5)					
					);
			return rComment;
		}
		
		
		
		}
}
