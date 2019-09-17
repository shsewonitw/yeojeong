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
import com.tje.yeojeong.model.Withme_requestForReSe;

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
			Withme_request withme_request = new Withme_request(rs.getInt(1), rs.getString(2), rs.getString(3),
					rs.getString(4), rs.getString(5), rs.getString(6), rs.getTimestamp(7), rs.getTimestamp(8),
					rs.getTimestamp(9));
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
		List<Withme_request> result = this.jdbcTemplate.query("select * from withme_request",
				new Withme_requestRowMapper());
		return result;
	}

	public List<Withme_requestForReSe> selectReceiveRequest(Withme_request obj) {
		List<Withme_requestForReSe> result = this.jdbcTemplate.query(
				"select wr.request_id, wr.sender_id, wr.receiver_id, wr.statue, wr.country, wr.city, wr.start_date, wr.end_date, wr.write_time, m.gender, m.name from withme_request wr inner join member m on wr.sender_id = m.member_id where wr.receiver_id = ?",
				new RowMapper<Withme_requestForReSe>() {

					@Override
					public Withme_requestForReSe mapRow(ResultSet rs, int rowNum) throws SQLException {
						Withme_requestForReSe wr = new Withme_requestForReSe(rs.getInt(1), rs.getString(2),
								rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getTimestamp(7),
								rs.getTimestamp(8), rs.getTimestamp(9), rs.getInt(10), rs.getString(11));
						return wr;
					}

				}, obj.getReceiver_id());
		return result;
	}

	public List<Withme_requestForReSe> selectSendRequest(Withme_request obj) {
		List<Withme_requestForReSe> result = this.jdbcTemplate.query(
				"select wr.request_id, wr.sender_id, wr.receiver_id, wr.statue, wr.country, wr.city, wr.start_date, wr.end_date, wr.write_time, m.gender, m.name from withme_request wr inner join member m on wr.receiver_id = m.member_id where wr.sender_id = ?",
				new RowMapper<Withme_requestForReSe>() {

					@Override
					public Withme_requestForReSe mapRow(ResultSet rs, int rowNum) throws SQLException {
						Withme_requestForReSe wr = new Withme_requestForReSe(rs.getInt(1), rs.getString(2),
								rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getTimestamp(7),
								rs.getTimestamp(8), rs.getTimestamp(9), rs.getInt(10), rs.getString(11));
						return wr;
					}

				}, obj.getSender_id());
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

	public boolean deleteWithRequest(Withme_request obj) {
		int withme_request_flag = this.jdbcTemplate.update("delete from withme_request where request_id = ?",
				obj.getRequest_id());
		boolean result = withme_request_flag == 1 ? true : false;
		return result;
	}
	// 동행 신청하기
	public boolean insert(Withme_request obj) {
		boolean result = false;
		String sql = "insert into withme_request values(null,?,?,?,?,?,?,?,now())";
		result = this.jdbcTemplate.update(sql,
				obj.getSender_id(), obj.getReceiver_id(), 
				obj.getStatue(), obj.getCountry(), obj.getCity(), 
				obj.getStart_date(), obj.getEnd_date())== 1 ? true : false;
		return result;
	}

	public boolean update_Status(Withme_request obj) {
		boolean result = false;
		int withme_request_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {

			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("update withme_request set statue = ? where request_id = ?");
				pstmt.setString(1, obj.getStatue());
				pstmt.setInt(2, obj.getRequest_id());
				return pstmt;
			}
		});

		result = withme_request_flag == 1 ? true : false;

		return result;
	}

	// Count
	public int Withme_RequestCount() {
		String sql = "select count(*) from withme_request";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int last_insert_id() {
		int result = -1;
		String sql = "select last_insert_id()";
		result = this.jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}
	
}
