package com.tje.yeojeong.repository;

import java.sql.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;

@Repository
public class Like_ThumbDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public Like_ThumbDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	class Like_ThumbRowMapper implements RowMapper<Like_Thumb> {
		public Like_Thumb mapRow(ResultSet rs, int rowNum) throws SQLException {
			Like_Thumb like_thumb = new Like_Thumb(
				rs.getInt(1), 			// article_id
				rs.getString(2));		// member_id
			return like_thumb;
		}
	}
	
	// 게시물당 좋아요 수
	public Integer selectCount(Like_Thumb model) {
		return this.jdbcTemplate.queryForObject("select count(*) from review_article where article_id = ?",
				Integer.class, model.getArticle_id());
	}
	
	// 좋아요 클릭
	public Like_Thumb insertLike(Like_Thumb model) {
		return this.jdbcTemplate.queryForObject("insert into like_thumb values(?, ?)", new Like_ThumbRowMapper(),
				model.getArticle_id(),
				model.getMember_id());
	}
}
