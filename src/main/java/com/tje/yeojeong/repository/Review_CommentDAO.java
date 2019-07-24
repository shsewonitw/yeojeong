package com.tje.yeojeong.repository;

import java.sql.*;
import java.util.*;

import com.tje.yeojeong.model.*;

import javax.sound.sampled.ReverbType;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class Review_CommentDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public Review_CommentDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// RowMap 사용
	class Review_CommentRowMapper implements RowMapper<Review_Comment> {
		public Review_Comment mapRow(ResultSet rs, int rowNum) throws SQLException{
			Review_Comment rComment = new Review_Comment(
					rs.getInt(1),      // comment_id
					rs.getString(2),   // member_id
					rs.getInt(3),      // article_id 
					rs.getString(4),   // content
					rs.getTimestamp(5) // wirte_time
					);     
			return rComment;
		}
	}
	
	// 댓글 갯수
	public List<Review_Comment> CommentCount(Review_Comment model) {
		List<Review_Comment> result = this.jdbcTemplate.query("select count(*) review_comment where article_id = ? ",
				new Review_CommentRowMapper(), model.getArticle_id());
		
		return result.isEmpty() ? null : result;
	}
			
	// 댓글 등록
	public int insert(Review_Comment model) {
		return this.jdbcTemplate.update("insert into review_comment values (null, ?, null, ?, now())",
				new Review_CommentRowMapper(), model.getMember_id(), model.getContent() );				
	}
	
	// 댓글 삭제
	public int delete(Review_Comment model) {
		return this.jdbcTemplate.update("delete from review_comment where comment_id = ?",
				new Review_CommentRowMapper(), model.getArticle_id());				
	}

	// 댓글 수정
	public int update(Review_Comment model) {
		return this.jdbcTemplate.update("update review_comment where comment_id = ? and write_time is ",
				new Review_CommentRowMapper(), model.getArticle_id());				
		}
}
