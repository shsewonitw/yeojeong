package com.tje.yeojeong.repository;

import java.sql.*;
import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.setting.*;

@Repository
public class MessageDAO {
	@Autowired
	private PagingInfo pagingInfo;
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public MessageDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	class MessageRowMapper implements RowMapper<Message> {
		public Message mapRow(ResultSet rs, int rowNum) throws SQLException {
			Message message = new Message(
				rs.getInt(1), 			// message_id
				rs.getString(2),		// sender_id
				rs.getString(3), 		// receiver_id
				rs.getString(4), 		// content
				rs.getTimestamp(5), 	// send_time
				rs.getTimestamp(6));	// receive_time
			return message;
		}
	}
	
	public Message selectById(Message model) {
		return this.jdbcTemplate.queryForObject("select * from message where message_id = ?", new MessageRowMapper(),
				model.getMessage_id());
	}
	
	// 각 사용자 별, 보낸 메세지의 개수를 반환하는 메소드
	public Integer selectBySenderCount(Message model) {
		return this.jdbcTemplate.queryForObject(
				"select count(*) from message where sender_id = ?",
				Integer.class, 
				model.getSender_id());
	}
	
	// 현재 페이지의 정보를 매개변수로 전달받아
	// 현재 페이지에 해당되는 메세지를 반환하는 메소드(오름차순)
	public List<Message> selectBySender(int page, Message model) {
		List<Message> result = this.jdbcTemplate.query(
				"select * from message where sender_id = ? order by message_id desc limit ?, ?", new MessageRowMapper(),
				model.getSender_id(), (page - 1) * this.pagingInfo.getPagingSize(), this.pagingInfo.getPagingSize());
		
		return result.isEmpty() ? null : result;
	}
	
	// 작성 날짜를 기준으로 보낸 메세지를 검색하는 메소드(오름차순)
	public List<Message> selectBySender_Date(
			MessageSearchCommand command, String sender) {
		List<Message> result = this.jdbcTemplate.query(
						"select * from message where sender_id = ? and send_time between ? and ? order by message_id desc",
				new MessageRowMapper(), 
				sender, command.getFrom(), command.getTo());
		
		return result.isEmpty() ? null : result;
	}
	
	// 각 사용자 별, 읽지 않은 메세지의 개수를 반환하는 메소드
	public Integer selectByReadCount(Message model) {
		return this.jdbcTemplate.queryForObject(
				"select count(*) from message where receiver_id = ? and receive_time is null",
				Integer.class, 
				model.getReceiver_id());
	}
	
	// 각 사용자 별, 받은 메세지의 개수를 반환하는 메소드
	public Integer selectByReceiverCount(Message model) {
		return this.jdbcTemplate.queryForObject(
				"select count(*) from message where receiver_id = ?",
				Integer.class, 
				model.getReceiver_id());
		}
	
	// 현재 페이지의 정보를 매개변수로 전달받아
	// 현재 페이지에 해당되는 메세지를 반환하는 메소드(오름차순)
	public List<Message> selectByReceiver(int page, Message model) {
		List<Message> result = this.jdbcTemplate.query("select * from message where receiver_id = ? order by message_id desc limit ?, ?",
				new MessageRowMapper(), 
				model.getReceiver_id(), (page - 1) * this.pagingInfo.getPagingSize(), this.pagingInfo.getPagingSize());

		return result.isEmpty() ? null : result;
	}
	
	// 작성 날짜를 기준으로 받은 메세지를 검색하는 메소드(오름차순)
	public List<Message> selectByReceiver_Date(
			MessageSearchCommand command, String receiver) {
		List<Message> result = this.jdbcTemplate.query(
						"select * from message where receiver_id = ? and send_time between ? and ? order by message_id desc",
				new MessageRowMapper(), 
				receiver, command.getFrom(), command.getTo());

		return result.isEmpty() ? null : result;
	}

	public List<Message> selectAll(int page) {
		List<Message> result = this.jdbcTemplate.query("select * from message", new MessageRowMapper());

		return result.isEmpty() ? null : result;
	}
	
	// 메세지 입력
	public int insert(Message model) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		this.jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement(
						"insert into message values (null, ?, ?, ?, now(), null)", new String[] { "message_id" });
				pstmt.setString(1, model.getSender_id());
				pstmt.setString(2, model.getReceiver_id());
				pstmt.setString(3, model.getContent());
				return pstmt;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	// 메세지 삭제
	public int delete(Message model) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		this.jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement(
						"delete from message where message_id = ?");
				pstmt.setInt(1, model.getMessage_id());
				return pstmt;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	// 메세지 수신확인 표시
	public int updateReceiveTime(Message model) {
		return this.jdbcTemplate.update(
				"update message set receive_time = now() where message_id = ? and receive_time is null",
				model.getMessage_id());
		}
}
