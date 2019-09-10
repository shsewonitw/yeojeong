package com.tje.yeojeong.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;

@Repository
public class Withme_requestDupleDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public Withme_requestDupleDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 등록
	public boolean insert(Withme_requestDuple obj) {
		boolean result = false;
		String sql = "insert into withme_requestduple values (?,?,?)";
		result = this.jdbcTemplate.update(sql, obj.getMember_id(), obj.getArticle_id(), obj.getRequest_id()) == 0 ? false : true;
		return result;
	}


	public boolean delete(Withme_requestDuple obj) {
		boolean result = false;
		String sql = "delete from withme_requestduple where member_id = ? and article_id = ?";
		result = this.jdbcTemplate.update(sql, obj.getMember_id(), obj.getArticle_id()) == 0 ? false : true;
		return result;
	}

	// Member_id에 해당하는 여행지등록 정보 조회 - 시작 날짜 기준으로 오름차순

	public List<Withme_requestDuple> selectWhereMember_id(Withme_requestDuple obj) {
		String sql = "select * from withme_requestduple where member_id = ? ";
		List<Withme_requestDuple> withme_requestDuple = this.jdbcTemplate.query(sql, new RowMapper<Withme_requestDuple>() {
			@Override
			public Withme_requestDuple mapRow(ResultSet rs, int arg1) throws SQLException {
				Withme_requestDuple withme_requestDuple = new Withme_requestDuple(rs.getString(1), rs.getInt(2), rs.getInt(3));
				return withme_requestDuple;
			}
		}, obj.getMember_id());

		return withme_requestDuple.isEmpty() ? null : withme_requestDuple;
	}

}