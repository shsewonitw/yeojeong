package com.tje.yeojeong.repository;

import java.sql.*;
import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.setting.*;

@Repository
public class Withme_viewDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PagingInfo pagingInfo;
	
	@Autowired
	public Withme_viewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 맵퍼 클래스
	class Withme_viewRowMapper implements RowMapper<Withme_view>{
		@Override
		public Withme_view mapRow(ResultSet rs, int arg1) throws SQLException {
			Withme_view withme_view = new Withme_view(
					rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),rs.getTimestamp(6),
					rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getDate(10),rs.getInt(11),rs.getString(12));
			return withme_view;
		}
	}
	
	// 게시글 작성
	public boolean insert(Withme_view obj) {
		boolean result = false;
		String sql = "insert into withme_article values(null,?,?,?,?,?,?,?,?,now(),?)";
		result = this.jdbcTemplate.update(sql, 
			obj.getMember_id(), obj.getCountry(),obj.getCity(), 
			obj.getStart_date(), obj.getEnd_date(), obj.getCategory_gender(), 
			obj.getCategory_age(), obj.getCategory_style(),obj.getTravel_id()) == 1? true : false;
		return result;
	}
	
	// 조회수
	public int AticleCount(Withme_view obj) {
		String sql = "update withme_article set read_count = read_count + 1 where article_id = ?";
		return this.jdbcTemplate.update(sql, obj.getArticle_id());
	}

	// Count
	public int withme_viewCount() {
		String sql = "select count(*) from withme_view";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	// 리뷰 뷰 전체 리스트 검색
	public List<Withme_view> selectAll(int page) {
		String sql = "select * from withme_view order by write_time desc limit ?, ?";
		List<Withme_view> result = this.jdbcTemplate.query(sql, new Withme_viewRowMapper(),
				(page-1)*this.pagingInfo.getPagingSize(),this.pagingInfo.getPagingSize());
		return result.isEmpty() ? null : result;
	}
	
	// 게시글 삭제
		public boolean delete(Withme_view model) {
			boolean result = false;
			String sql = "delete from withme_article where article_id = ?";
			result = this.jdbcTemplate.update(
					sql,model.getArticle_id()) == 0 ? false : true;

			return result;
		}
		
		// 같이갈래 중복 검사용
		public List<Withme_view> selectTravelIdWhereMemberId(Withme_view model) {
			List<Withme_view> result = new ArrayList<Withme_view>();
			String sql = "select * from withme_view where member_id = ?";
			result = this.jdbcTemplate.query(sql,new Withme_viewRowMapper(),model.getMember_id());
					
			return result;
		}
}