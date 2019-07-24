package com.tje.yeojeong.repository;

import java.sql.*;
import com.tje.yeojeong.model.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class QA_articleDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public QA_articleDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// RowMap 사용
	class QA_articleMapper implements RowMapper<QA_article> {
		public QA_article mapRow(ResultSet rs, int rowNum) throws SQLException{
			QA_article qArticle = new QA_article(
					rs.getInt(1),      // article_id 
					rs.getString(2),   // title
					rs.getString(3));  // content
			return qArticle;
		}
	}
	
	// 글 등록
	public int insert(QA_article model) {
		return this.jdbcTemplate.update("insert into qa_article values (null, ?, ?)",
				model.getArticled_id(), model.getTitle(), model.getContent());
				
	}
	
	// 글 삭제
	public int delete(QA_article model) {
		return this.jdbcTemplate.update("delete from qa_article where article_id = ?",
				new QA_articleMapper(), model.getArticled_id());
				
	}
	
}
