package net.hb.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hb.common.DBConnPool;
import net.hb.dto.CourseDTO;
import net.hb.dto.TeacherDTO;
import net.hb.utils.CommonDateUtil;

public class CourseDAO extends DBConnPool {

	public CourseDAO() {
		super();
	}
	public int courseModify(int courseIdx, String title, String teacherId, int price, String detail, String school, String grade, String subject) {
		int result = 0;
		StringBuilder query = new StringBuilder();
		query.append("UPDATE tbl_course SET");
		query.append(" title=?, teacherId=?, price=?, detail=?, school=?,");
		query.append(" grade=?, subject=? ");
		query.append(" WHERE idx = ?");
		
		try {
			psmt = con.prepareStatement(query.toString());
			psmt.setString(1, title);
			psmt.setString(2, teacherId);
			psmt.setInt(3, price);
			psmt.setString(4, detail);
			psmt.setString(5, school);
			psmt.setString(6, grade);
			psmt.setString(7, subject);
			psmt.setInt(8, courseIdx);
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteCourse(int courseIdx) {
		String query = "DELETE FROM tbl_course WHERE idx = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, courseIdx);
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	public int courseRegist(String title, String teacherId, int price, String detail, String school, String grade, String subject) {
		int result = 0;
		String query = "INSERT INTO tbl_course ( "
				+ "title, teacherId, price, detail, regDate, school, grade, subject "
				+ " ) VALUES ( "
				+ " ?, ?, ?, ?, NOW(), ?, ?, ? )";
		
		try {
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, title);
			 psmt.setString(2, teacherId);
			 psmt.setInt(3, price);
			 psmt.setString(4, detail);
			 psmt.setString(5, school);
			 psmt.setString(6, grade);
			 psmt.setString(7, subject);
			
			 result = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<CourseDTO> list(String school, int grade, String subject, String keyword, int limit, int pageNo, String teacherId, String sort) {
		List<CourseDTO> list = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT co.idx, co.title, co.teacherId, co.price, co.detail, co.regDate, co.school, co.grade, co.subject");
		sb.append(", te.teacherId, te.profileIdx, te.bannerIdx, te.subject, te.description, te.name");
		sb.append(" FROM tbl_course AS co");
		sb.append(" INNER JOIN tbl_teacher AS te ON co.teacherId = te.teacherId");
	
		Map<Integer, Object> param = new HashMap<>();
		
		int count = 1;
		
		if(teacherId != null) {
			sb.append(" AND co.teacherId = ?");
			param.put(count++, teacherId);
		}
		
		boolean addand = false;
		if(school != null || grade != 0 || subject != null || keyword != null)
			sb.append(" WHERE");
		if(school != null) {
			sb.append(" co.school=?");
			addand = true;
			param.put(count++, school);
		}
		if(grade != 0) {
			if(addand) sb.append(" AND");
			sb.append(" co.grade=?");
			addand = true;
			param.put(count++, grade);
		}
		if(subject != null) {
			if(addand) sb.append(" AND");
			sb.append(" co.subject=?");
			addand = true;
			param.put(count++, subject);
		}
		if(keyword != null) {
			if(addand) sb.append(" AND");
			sb.append(" co.title LIKE ?");
			param.put(count++, "%"+keyword+"%");
		}
		
		if(sort != null) {
			sb.append(" ORDER BY ");
			sb.append(sort);
		}
		
		if(limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
			param.put(count++, (pageNo-1)*limit);
			param.put(count++, limit);
		}
		
		try {
			psmt = con.prepareStatement(sb.toString());
			
			for(int i = 1; i <= param.size(); i++) {
				psmt.setObject(i, param.get(i));
			}
			
			rs = psmt.executeQuery();
			
			list = new ArrayList<CourseDTO>();
			CourseDTO dto;
			TeacherDTO teacherInfo;
			while(rs.next()) {
				dto = new CourseDTO();
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setTeacherId(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setDetail(rs.getString(5));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(6)));
				dto.setSchool(rs.getString(7));
				dto.setGrade(rs.getInt(8));
				dto.setSubject(rs.getString(9));
				
				teacherInfo = new TeacherDTO();
				teacherInfo.setTeacherId(rs.getString(10));
				teacherInfo.setProfileIdx(rs.getInt(11));
				teacherInfo.setBannerIdx(rs.getInt(12));
				teacherInfo.setSubject(rs.getString(13));
				teacherInfo.setDescription(rs.getString(14));
				teacherInfo.setName(rs.getString(15));
				
				dto.setTeacherInfo(teacherInfo);
				list.add(dto);
			}
			
		} catch(Exception e) {
			System.out.println(">> CourseDAO > list : " + e.getMessage());
		}
		
		return list;
	}
	
	public int count(String school, int grade, String subject, String keyword, String teacherId) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT count(co.idx)");
		sb.append(" FROM tbl_course AS co");
		sb.append(" INNER JOIN tbl_teacher AS te ON co.teacherId = te.teacherId");
	
		Map<Integer, Object> param = new HashMap<>();
		
		int count = 1;
		
		if(teacherId != null) {
			sb.append(" AND co.teacherId = ?");
			param.put(count++, teacherId);
		}
		
		boolean addand = false;
		if(school != null || grade != 0 || subject != null || keyword != null)
			sb.append(" WHERE");
		if(school != null) {
			sb.append(" co.school=?");
			addand = true;
			param.put(count++, school);
		}
		if(grade != 0) {
			if(addand) sb.append(" AND");
			sb.append(" co.grade=?");
			addand = true;
			param.put(count++, grade);
		}
		if(subject != null) {
			if(addand) sb.append(" AND");
			sb.append(" co.subject=?");
			addand = true;
			param.put(count++, subject);
		}
		if(keyword != null) {
			if(addand) sb.append(" AND");
			sb.append(" co.title LIKE ?");
			param.put(count++, "%"+keyword+"%");
		}
		
		try {
			psmt = con.prepareStatement(sb.toString());
			
			for(int i = 1; i <= param.size(); i++) {
				psmt.setObject(i, param.get(i));
			}
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch(Exception e) {
			System.out.println(">> CourseDAO > list : " + e.getMessage());
		}
		return result;
	}

	public List<CourseDTO> getCourseList(int idx){
		List<CourseDTO> list = new ArrayList<CourseDTO>();
		String query = "SELECT title, price, idx FROM tbl_course WHERE idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CourseDTO dto = new CourseDTO();
				dto.setTitle(rs.getString(1));
				dto.setPrice(rs.getInt(2));
				dto.setIdx(rs.getInt(3));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<CourseDTO> getCourseList(String[] idx) {
	    List<CourseDTO> list = new ArrayList<CourseDTO>();

	    // idx 배열의 크기만큼 ?를 동적으로 추가
	    String placeholders = String.join(",", Collections.nCopies(idx.length, "?"));
	    String query = "SELECT title, price, idx FROM tbl_course WHERE idx IN (" + placeholders + ")";

	    try {
	        psmt = con.prepareStatement(query);

	        // String 배열의 값을 int로 변환하여 PreparedStatement에 설정
	        for (int i = 0; i < idx.length; i++) {
	            psmt.setInt(i + 1, Integer.parseInt(idx[i]));
	        }

	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            CourseDTO dto = new CourseDTO();
	            dto.setTitle(rs.getString(1));
	            dto.setPrice(rs.getInt(2));
	            dto.setIdx(rs.getInt(3));
	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public boolean exists(int idx) {
		boolean result = false;
		
		String sql = "SELECT count(idx) FROM tbl_course WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) >= 1) result = true;
			}
		} catch(Exception e) {
			System.out.println(">> CourseDAO > exists : " + e.getMessage());
		}
		return result;
	}
	public CourseDTO view(int idx) { // 강좌 인덱스번호로 강좌 정보 + 선생님 정보 가져오기
		CourseDTO dto = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT co.idx, co.title, co.teacherId, co.price, co.detail, co.regDate, co.school, co.grade, co.subject");
		sb.append(", te.teacherId, te.profileIdx, te.bannerIdx, te.subject, te.description, te.name");
		sb.append(" FROM tbl_course AS co");
		sb.append(" INNER JOIN tbl_teacher AS te ON co.idx=? AND co.teacherId = te.teacherId");
	
		
		try {
			psmt = con.prepareStatement(sb.toString());
			
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			
			TeacherDTO teacherInfo;
			if(rs.next()) {
				dto = new CourseDTO();
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setTeacherId(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setDetail(rs.getString(5));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(6)));
				dto.setSchool(rs.getString(7));
				dto.setGrade(rs.getInt(8));
				dto.setSubject(rs.getString(9));
				
				teacherInfo = new TeacherDTO();
				teacherInfo.setTeacherId(rs.getString(10));
				teacherInfo.setProfileIdx(rs.getInt(11));
				teacherInfo.setBannerIdx(rs.getInt(12));
				teacherInfo.setSubject(rs.getString(13));
				teacherInfo.setDescription(rs.getString(14));
				teacherInfo.setName(rs.getString(15));
				
				dto.setTeacherInfo(teacherInfo);
			}
			
		} catch(Exception e) {
			System.out.println(">> CourseDAO > list : " + e.getMessage());
		}
		
		return dto;
	}
}
