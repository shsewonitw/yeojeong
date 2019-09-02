package com.tje.yeojeong.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.Review_view;
import com.tje.yeojeong.setting.PagingInfo;

@Repository
public class Review_viewDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PagingInfo pagingInfo;

	@Autowired
	public Review_viewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 맵퍼 클래스
	class Review_viewRowMapper implements RowMapper<Review_view> {
		@Override
		public Review_view mapRow(ResultSet rs, int arg1) throws SQLException {
			Review_view review_view = new Review_view(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6), rs.getInt(7), rs.getTimestamp(8), rs.getInt(9), rs.getString(10),
					rs.getInt(11),rs.getInt(12));
			return review_view;
		}
	}

	// 리뷰 전체 개수 
	public Integer reviewCount() {
		return this.jdbcTemplate.queryForObject("select count(*) from Review_view", Integer.class);
	}
	
	// 리뷰 뷰 전체 리스트 검색
	public List<Review_view> selectAll(int page) {
		String sql = "select * from Review_view order by write_time desc limit ?, ?";
		List<Review_view> result = this.jdbcTemplate.query(sql, new Review_viewRowMapper(),
				(page-1)*this.pagingInfo.getPagingSize(),this.pagingInfo.getPagingSize());
		return result.isEmpty() ? null : result;
	}

	// 아이디로 리뷰 뷰 리스트 검색
	public List<Review_view> selectWhereId(Review_view obj) {
		String sql = "select * from Review_view where member_id = ? order by write_time desc";
		List<Review_view> result = this.jdbcTemplate.query(sql, new Review_viewRowMapper(), obj.getMember_id());
		return result.isEmpty() ? null : result;
	}

	// 리뷰 테이블에 데이터 입력
	public boolean insert(Review_view obj) {
		boolean result = false;
		String sql = "insert into Review_article values (0,?,?,?,?,?,?,now(),0,0)";
		result = this.jdbcTemplate.update(sql, obj.getMember_id(), obj.getCountry(), obj.getCity(),
				obj.getContent().replaceAll("\n", "<br>"), obj.getImage_src(), obj.getReview_star()) == 0 ? false
						: true;

		return result;
	}


	
	// 게시판 수정
	public boolean update(Review_view obj) {
		return this.jdbcTemplate.update("update Review_article set country = ?, city = ?, content = ?, image_src = ?, review_star = ? where article_id = ?",
				obj.getCountry(),obj.getCity(),obj.getContent(),obj.getImage_src(),obj.getReview_star(),obj.getArticle_id()) == 1 ? true : false;
	}
	
	 //리뷰 테이블에서 데이터 삭제
	public boolean delete(Review_view obj) {
		boolean result = false;
		String sql = "delete from Review_article where article_id = ?";
		result = this.jdbcTemplate.update(sql,obj.getArticle_id()) == 0 ? false : true;
		
		return result;
	}
	
	

	// 게시글 상세 확인
	public Review_view selectAticleId(Review_view obj) {
		String sql = "select * from review_view where article_id = ?";
		Review_view result = this.jdbcTemplate.queryForObject(sql, new Review_viewRowMapper(), obj.getArticle_id());
		return result;
	}

	// 조회수
	public int AticleCount(Review_view obj) {
		String sql = "update Review_article set read_count = read_count + 1 where article_id = ?";
		return this.jdbcTemplate.update(sql, obj.getArticle_id());
	}

	// 현재 페이지에 해당되는 리뷰를 반환하는 메소드
	public List<Review_view> selectByMember(int page, Review_view obj) {
		List<Review_view> result = this.jdbcTemplate.query(
				"select * from Review_view where member_id = ? order by write_time desc limit ?, ?",
				new Review_viewRowMapper(), obj.getMember_id(), (page - 1) * this.pagingInfo.getPagingSize(),
				this.pagingInfo.getPagingSize());

		return result.isEmpty() ? null : result;
	}

	// 각 사용자 별, 받은 리뷰의 개수를 반환하는 메소드
	public Integer selectByMemberCount(Review_view obj) {
		return this.jdbcTemplate.queryForObject("select count(*) from Review_view where member_id = ?",
				Integer.class, obj.getMember_id());
	}
	

	// Count
	public int review_viewCount() {
		String sql = "select count(*) from review_view";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
	// 카테고리  검색 ( 국가 )
	public List<Review_view> selectSerachWhereCountry(String searchValue,int page) {
		String sql = "select * from review_view where country like ? limit ?,?";
		List<Review_view> result = this.jdbcTemplate.query(sql, new Review_viewRowMapper(),"%"+searchValue+"%", (page-1)*this.pagingInfo.getPagingSize(),this.pagingInfo.getPagingSize());
		
		return result.isEmpty() ? null : result;
	}
	
	// 카테고리  검색 ( 도시 )
	public List<Review_view> selectSerachWhereCity(String searchValue,int page) {
			String sql = "select * from review_view where city like ? limit ?,?";
			List<Review_view> result = this.jdbcTemplate.query(sql, new Review_viewRowMapper(),"%"+searchValue+"%", (page-1)*this.pagingInfo.getPagingSize(),this.pagingInfo.getPagingSize());
			return result.isEmpty() ? null : result;
		}
	
		// 카테고리  검색 ( 작성자 )
	public List<Review_view> selectSerachWhereMember_id(String searchValue,int page) {
			String sql = "select * from review_view where name like ? limit ?,?";
			List<Review_view> result = this.jdbcTemplate.query(sql, new Review_viewRowMapper(),"%"+searchValue+"%", (page-1)*this.pagingInfo.getPagingSize(),this.pagingInfo.getPagingSize());
			return result.isEmpty() ? null : result;
		}	
		
	// 카테고리 검색 카운트
	public Integer review_SerachCount(String searchItem, String searchValue) {
		String sql = String.format("select count(*) from Review_view where %s like ?", searchItem);
		return this.jdbcTemplate.queryForObject(sql, Integer.class,"%"+searchValue+"%");
	}
	
	// 좋아요
	public boolean plus_like_count(Review_view obj) {
		return this.jdbcTemplate.update("update review_article set like_count = like_count + 1 where article_id = ?",obj.getArticle_id()) == 1 ? true : false;

	}
	
	public boolean minus_like_count(Review_view obj) {
		return this.jdbcTemplate.update("update review_article set like_count = like_count - 1 where article_id = ?",obj.getArticle_id()) == 1 ? true : false;

	}
}
