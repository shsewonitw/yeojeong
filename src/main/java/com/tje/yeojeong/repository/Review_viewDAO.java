package com.tje.yeojeong.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;

@Repository
public class Review_viewDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public Review_viewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 맵퍼 클래스
	class Review_viewRowMapper implements RowMapper<Review_view> {
		@Override
		public Review_view mapRow(ResultSet rs, int arg1) throws SQLException {
			Review_view review_view = new Review_view(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9),
					rs.getInt(11));
			return review_view;
		}
	}

	// 리뷰 뷰  전체 리스트 검색
	public List<Review_view> selectAll(){
		String sql = "select * from Review_view order by write_time desc";
		List<Review_view> result = this.jdbcTemplate.query(sql,new Review_viewRowMapper());
		return result.isEmpty() ? null : result;
	}

	// 아이디로 리뷰 뷰 리스트 검색
	public List<Review_view> selectWhereId(Review_view obj){
		String sql = "select * from Review_view where member_id = ? order by write_time desc";
		List<Review_view> result = this.jdbcTemplate.query(sql,new Review_viewRowMapper(),obj.getMember_id());
		return result.isEmpty() ? null : result;
	}
	
	// 리뷰 테이블에 데이터 입력
	public boolean insert(Review_view obj) {
		boolean result = false;
		String sql = "insert into Review_article values (0,?,?,?,?,?,?)";
		result = this.jdbcTemplate.update(sql,
				obj.getMember_id(),
				obj.getCountry(),
				obj.getCity(),
				obj.getContent(),
				obj.getImage_src(),
				obj.getReview_star(),
				0) == 0 ? false : true;
		
		return result;
	}
	
	// 리뷰 테이블에서 데이터 삭제
	public boolean delete(Review_view obj) {
		boolean result = false;
		String sql = "delete from Review_article where article_id_id = ?";

		result = this.jdbcTemplate.update(sql,obj.getArticle_id(),obj.getMember_id()) == 0 ? false : true;
		
		return result;
	}
	
}
