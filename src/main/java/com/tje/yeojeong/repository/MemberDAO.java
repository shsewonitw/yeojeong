package com.tje.yeojeong.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import com.tje.yeojeong.setting.PagingInfo;

@Repository
public class MemberDAO {
	@Autowired
	private PagingInfo pagingInfo;
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public MemberDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	class MemberRowMapper implements RowMapper<Member> {
		@Override
		public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
			Member member = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),

					rs.getDate(5), rs.getString(6), rs.getString(7), rs.getTimestamp(8), rs.getInt(9));
			return member;
		}

	}

	// 로그인
	public Member selectLogin(Member obj) {
		try {
			return this.jdbcTemplate.queryForObject("select * from member where member_id = ? and password = ?",
					new MemberRowMapper(), obj.getMember_id(), obj.getPassword());
		} catch (Exception e) {
			return null;
		}
	}

	// 아이디 체크
	public Member selectOne_ID(Member obj) {
		try {
			return this.jdbcTemplate.queryForObject("select * from member where member_id = ?", new MemberRowMapper(),
					obj.getMember_id());
		} catch (Exception e) {
			return null;

		}
	}

	public boolean changeTel(Member obj) {
		int member_flag = this.jdbcTemplate.update("update member set tel = ? where member_id = ?", obj.getTel(),
				obj.getMember_id());
		boolean result = member_flag == 1 ? true : false;

		return result;
	}

	public List<Member> selectOne_Email(Member obj) {
		try {
			return this.jdbcTemplate.query("select * from member where email = ?", new MemberRowMapper(),
					obj.getEmail());
		} catch (Exception e) {
			return null;

		}
	}

	public List<Member> selectAll() {
		List<Member> result = this.jdbcTemplate.query("select * from member", new MemberRowMapper());
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

	// 회원가입
	public boolean insert(Member obj) {
		boolean result = false;
		int member_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement("insert into member values(?,?,?,?,?,?,?,now(),1)");
				pstmt.setString(1, obj.getMember_id());
				pstmt.setString(2, obj.getPassword());
				pstmt.setString(3, obj.getName());
				pstmt.setInt(4, obj.getGender());
				pstmt.setTimestamp(5, new java.sql.Timestamp(obj.getBirth().getTime()));
				pstmt.setString(6, obj.getTel());
				setPreparedStatement(7, obj.getEmail(), pstmt);

				return pstmt;
			}
		});

		result = member_flag == 1 ? true : false;
		return result;

	}
	public boolean insert_Kakao(Member obj) {
		boolean result = false;
		int member_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				
				PreparedStatement pstmt = con.prepareStatement("insert into member values(?,null,?,?,?,?,?,now(),1)");
				pstmt.setString(1, obj.getMember_id());
				pstmt.setString(2, obj.getName());
				pstmt.setInt(3, obj.getGender());
				pstmt.setTimestamp(4, new java.sql.Timestamp(obj.getBirth().getTime()));
				pstmt.setString(5, obj.getTel());
				setPreparedStatement(6, obj.getEmail(), pstmt);
				
				return pstmt;
			}
		});
		
		result = member_flag == 1 ? true : false;
		return result;
		
	}

	// 정보수정
	public boolean update(Member obj) {
		boolean result = false;
		int member_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {

			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("upbdate member set password = ?,email = ? where member_id = ?  ");
				pstmt.setString(1, obj.getPassword());
				pstmt.setString(2, obj.getEmail());
				pstmt.setString(3, obj.getMember_id());
				return pstmt;
			}
		});

		result = member_flag == 1 ? true : false;

		return result;
	}
	
	// 멤버전체 조회(페이징)
	public List<Member> selectAllWithPaging(int page) {
		String sql = "select * from member where level = 1 order by regist_date desc limit ?,?";
		List<Member> result = this.jdbcTemplate.query(sql,new MemberRowMapper(),
				(page-1)*this.pagingInfo.getPagingSize(), this.pagingInfo.getPagingSize());
		return result.isEmpty() ? null : result;
	}

	public Integer selectMemberCount() {
		String sql = "select count(*) from member";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	// 검색된 멤버들 조회(페이징)
	public List<Member> selectSearchedMemberWithPaging(int page, String searchValue) {
		String sql = "select * from member where level = 1 and member_id like ? or name like ? order by regist_date desc limit ?,?";
		List<Member> result = this.jdbcTemplate.query(sql,new MemberRowMapper(),
				"%"+searchValue+"%",
				"%"+searchValue+"%",
				(page-1)*this.pagingInfo.getPagingSize(),
				this.pagingInfo.getPagingSize());
		return result.isEmpty() ? null : result;
	}
	
	public Integer selectSearchedMemberCount(String searchValue) {
		String sql = "select count(*) from member where level = 1 and member_id like ? or name like ? ";
		return this.jdbcTemplate.queryForObject(sql, Integer.class,
				"%"+searchValue+"%",
				"%"+searchValue+"%");
	}
	
	public boolean updateTelBirthEmail(Member obj) {
		String sql = "update member set tel = ?, birth = ?, email = ? where member_id = ?";
		return this.jdbcTemplate.update(sql, obj.getTel(), obj.getBirth(), obj.getEmail(), obj.getMember_id()) == 1 ? true : false;
	}
}
