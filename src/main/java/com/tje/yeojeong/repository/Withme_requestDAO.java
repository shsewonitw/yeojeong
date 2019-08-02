package com.tje.yeojeong.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.model.Withme_request;

@Repository
public class Withme_requestDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public Withme_requestDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	class Withme_requestRowMapper implements RowMapper<Withme_request> {
		@Override
		public Withme_request mapRow(ResultSet rs, int rowNum) throws SQLException {
			Withme_request withme_request = new Withme_request(rs.getInt(1), 
					rs.getString(2), rs.getString(3), rs.getTimestamp(4)
			);
			return withme_request;
		}

	}

//	// 로그인
//	public Withme_request selectLogin(Withme_request obj) {
//		return this.jdbcTemplate.queryForObject("select * from member where member_id = ? and password = ?",
//				new Withme_requestRowMapper(), obj.getMember_id(), obj.getPassword());
//	}
//
//	// 아이디 체크
//	public Withme_request selectOne(Withme_request obj) {
//		try {
//			return this.jdbcTemplate.queryForObject("select * from member where member_id = ?", new Withme_requestRowMapper(),
//					obj.getMember_id());
//		} catch (Exception e) {
//			return null;
//
//		}
//	}

	public List<Withme_request> selectAll() {
		List<Withme_request> result = this.jdbcTemplate.query("select * from withme_request", new Withme_requestRowMapper());
		return result;
	}

	private void setPreparedStatement(int index, String value, PreparedStatement pstmt) throws SQLException {
		if (value != null && value.length() > 0)
			pstmt.setString(index, value);
		else
			pstmt.setNull(index, Types.NULL);
	}

	private void setPreparedStatement(int index, Date value, PreparedStatement pstmt) throws SQLException {
		if (value != null)
			pstmt.setTimestamp(index, new java.sql.Timestamp(value.getTime()));
		else
			pstmt.setNull(index, Types.NULL);
	}

	public boolean insert(Withme_request obj) {
		boolean result = false;
		int member_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement("insert into withme_request values(?,?,?,now())");
				pstmt.setInt(1, obj.getRequest_id());
				pstmt.setString(2, obj.getSender_id());
				pstmt.setString(3, obj.getReceiver_id());

				return pstmt;
			}
		});

		result = member_flag == 1 ? true : false;
		return result;

	}

//	public boolean update(Withme_request obj) {
//		boolean result = false;
//		int member_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {
//
//			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
//				PreparedStatement pstmt = con
//						.prepareStatement("upbdate withme_request set password = ?,email = ? where member_id = ?  ");
//				pstmt.setString(1, obj.getPassword());
//				pstmt.setString(2, obj.getEmail());
//				pstmt.setString(3, obj.getMember_id());
//				return pstmt;
//			}
//		});
//
//		result = member_flag == 1 ? true : false;
//
//		return result;
//	}

	// Count
	public int Withme_RequestCount() {
		String sql = "select count(*) from withme_request";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
