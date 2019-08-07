package com.tje.yeojeong.repository;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import com.fasterxml.jackson.databind.ser.std.SerializableSerializer;
import com.tje.yeojeong.model.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class Review_CommentDAO{
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public Review_CommentDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	// RowMap 사용
	class Review_CommentRowMapper implements RowMapper<Review_Comment>{
		private static final long serialVersionUID = 1L;

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
	
	public List<Review_Comment> selectAll(Review_Comment model){
		String sql = "select * from review_comment where article_id = ? order by write_time desc";
		List<Review_Comment> result = this.jdbcTemplate.query(sql,new Review_CommentRowMapper(),model.getArticle_id());
		return result.isEmpty() ? null : result;
	}
	
	// 댓글 갯수
	public Integer commentCount(Review_Comment model) {
		String sql = "select count(*) from review_Comment where article_id = ?";
		return this.jdbcTemplate.queryForObject(sql,Integer.class,model.getArticle_id());
		
	}
			
	// 댓글 등록
	public boolean insert(Review_Comment model) {
		boolean result = false;
		String sql = "insert into review_comment values (0, ?, ?, ?, now())";
		System.out.println(model.getMember_id());
		result = this.jdbcTemplate.update(sql,
				model.getMember_id(),model.getArticle_id(),model.getContent()) == 0 ? false : true;
		
		return result;		
	}
	
	// 댓글 삭제
	public boolean delete(Review_Comment model) {
		boolean result = false;
		result =  this.jdbcTemplate.update("delete from review_comment where comment_id = ?",model.getComment_id()) == 0 ? false : true;
		
		return result;
	}
	
}
