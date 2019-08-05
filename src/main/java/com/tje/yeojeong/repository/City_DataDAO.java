package com.tje.yeojeong.repository;

import java.sql.*;
import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.tje.yeojeong.model.*;

@Repository
public class City_DataDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public City_DataDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	class City_DataRowMapper implements RowMapper<City_Data> {
		public City_Data mapRow(ResultSet rs, int rowNum) throws SQLException {
			City_Data city_data = new City_Data(
				rs.getInt(1), 			// city_code
				rs.getString(2),		// country
				rs.getString(3), 		// city
				rs.getString(4),	 	// local_time
				rs.getString(5), 		// flight_time
				rs.getString(6),		// local_voltage
				rs.getString(7),		// visa
				rs.getString(8),		// latitude
				rs.getString(9),		// longitude
				rs.getInt(10),			// danger_level
				rs.getString(11),		// image_src (썸네일용)
				rs.getString(12),		// image_src2 (내부 사진용)
				rs.getString(13));		// image_src3 (국기 사진용)
				
			return city_data;
		}
	}


	public City_Data selectOneWhereCity(City_Data model){
		String sql = "select * from city_data where city = ?";
		City_Data result = null;
		try {
		result = this.jdbcTemplate.queryForObject(sql, new City_DataRowMapper(),model.getCity());
		} catch (EmptyResultDataAccessException e){
			;			
		}
		return result;
	}
	
	public List<City_Data> selectAll() {

		List<City_Data> result = this.jdbcTemplate.query("select * from city_data", new City_DataRowMapper());

		return result.isEmpty() ? null : result;
	}
	
	// 여행지 데이터 입력
	public int insert(City_Data model) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		this.jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement(
						"insert into city_data values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", new String[] { "city_code" });
				pstmt.setString(1, model.getCountry());
				pstmt.setString(2, model.getCity());
				pstmt.setString(3, model.getLocal_time());
				pstmt.setString(4, model.getFlight_time());
				pstmt.setString(5, model.getLocal_voltage());
				pstmt.setString(6, model.getVisa());
				pstmt.setString(7, model.getLatitude());
				pstmt.setString(8, model.getLongitude());
				pstmt.setInt(9, model.getDanger_level());
				pstmt.setString(10, model.getImage_src());
				pstmt.setString(11, model.getImage_src2());
				pstmt.setString(12, model.getImage_src3());
				return pstmt;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	// 여행지 데이터 수정
	public int updatetemp(City_Data model) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		this.jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement(
						"update city_data set country = ?, city = ?, flight_time = ?, local_voltage = ?,"
						+ "visa = ?, latitude = ?, longitude = ?, danger_level = ?, image_src = ? , image_src2 = ? , image_src3 = ? where city_code = ?");
				pstmt.setString(1, model.getCountry());
				pstmt.setString(2, model.getCity());
				pstmt.setString(3, model.getFlight_time());
				pstmt.setString(4, model.getLocal_voltage());
				pstmt.setString(5, model.getVisa());
				pstmt.setString(6, model.getLatitude());
				pstmt.setString(7, model.getLongitude());
				pstmt.setInt(8, model.getDanger_level());
				pstmt.setString(9, model.getImage_src());
				pstmt.setString(10, model.getImage_src2());
				pstmt.setString(11, model.getImage_src3());
				pstmt.setInt(12, model.getCity_code());
				return pstmt;
			}
		}, keyHolder);

		return keyHolder.getKey().intValue();
	}
	
	
	// 정보수정
	public boolean update(City_Data model) {
		boolean result = false;
		int city_data_flag = this.jdbcTemplate.update(new PreparedStatementCreator() {

			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("update city_data set country = ? , city = ? , flight_time = ? , local_voltage = ? , visa = ? , latitude = ? , longitude = ? , danger_level = ? , image_src = ? , image_src2 = ? , image_src3 = ? where city_code = ?");
				pstmt.setString(1, model.getCountry());
				pstmt.setString(2, model.getCity());
				pstmt.setString(3, model.getFlight_time());
				pstmt.setString(4, model.getLocal_voltage());
				pstmt.setString(5, model.getVisa());
				pstmt.setString(6, model.getLatitude());
				pstmt.setString(7, model.getLongitude());
				pstmt.setInt(8, model.getDanger_level());
				pstmt.setString(9, model.getImage_src());
				pstmt.setString(10, model.getImage_src2());
				pstmt.setString(11, model.getImage_src3());
				pstmt.setInt(12, model.getCity_code());
				return pstmt;
			}
		});

		result = city_data_flag == 1 ? true : false;

		return result;
	}
	
	// 여행 데이터 삭제
	public boolean delete(City_Data model) {
		boolean result = false;
		String sql = "delete from city_data where city_code = ?";
		result = this.jdbcTemplate.update(sql,model.getCity_code()) == 0 ? false : true;
		return result;
	}
	

	
	// 여행지 국가 리스트 반환
	public List<String> selectCountryList() {
		String sql = "select country from city_data group by country";
		List<String> result = this.jdbcTemplate.query(sql,new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int arg1) throws SQLException {
				String str = rs.getString(1);
				return str;
			}
		});

		return result;
	}
	
	// 여행지 국가별 도시 리스트 반환
	public List<String> selectCityListWhereCountry(City_Data model) {
		String sql = "select city from city_data where country = ?";
		List<String> result = this.jdbcTemplate.query(sql,new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int arg1) throws SQLException {
				String str = rs.getString(1);
				return str;
			}
		},model.getCountry());

		return result;
	}
	
	// Count
	public int City_DataCount() {
		String sql = "select count(*) from city_data";
		return this.jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
