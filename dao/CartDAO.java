package net.hb.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.CartDTO;
import net.hb.dto.CourseDTO;
import net.hb.utils.CommonDateUtil;

public class CartDAO extends DBConnPool {
	public int count(String memberId) {
		//SELECT 회원아이디로 장바구니 개수 조회
		int count = -1;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT count(idx)");
		sb.append(" FROM tbl_cart");
		sb.append(" WHERE memberId=?");
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println(">> CartDAO > count : " + e.getMessage());
		}
		
		return count;
	}
	
	public List<CartDTO> list(String memberId, int limit, int pageNo) {
		List<CartDTO> list = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT ca.idx, ca.memberId, ca.courseIdx");
		sb.append(", co.idx, co.title, co.teacherId, co.price, co.detail, co.regDate, co.school, co.grade, co.subject");
		sb.append(", te.name");
		sb.append(" FROM tbl_cart AS ca");
		sb.append(" INNER JOIN tbl_course AS co ON ca.courseIdx = co.idx");
		sb.append(" LEFT OUTER JOIN tbl_teacher AS te ON co.teacherId = te.teacherId");
		sb.append(" WHERE ca.memberId=?");
		
		if(limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
		}
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			if(limit > 0 && pageNo > 0) {
				psmt.setInt(3, limit);
				psmt.setInt(2, (pageNo-1)*limit );
			}
			
			rs = psmt.executeQuery();
			list = new ArrayList<CartDTO>();
			CartDTO dto;
			CourseDTO courseInfo;
			while(rs.next()) {
				dto = new CartDTO();
				courseInfo = new CourseDTO();
				
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setCourseIdx(rs.getInt(3));
				
				courseInfo.setIdx(rs.getInt(4));
				courseInfo.setTitle(rs.getString(5));
				courseInfo.setTeacherId(rs.getString(6));
				courseInfo.setPrice(rs.getInt(7));
				courseInfo.setDetail(rs.getString(8));
				courseInfo.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(9)));
				courseInfo.setSchool(rs.getString(10));
				courseInfo.setGrade(rs.getInt(11));
				courseInfo.setSubject(rs.getString(12));
				courseInfo.setTeacherName(rs.getString(13));
				
				dto.setCourseInfo(courseInfo);
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println(">> CartDAO > list : " + e.getMessage());
		}
		
		return list;
	}
	
	
	public int regist(String memberId, int courseIdx) {
		int result = 0;
		
		String sql = "INSERT IGNORE INTO tbl_cart (memberId, courseIdx) VALUES (?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println(">> CartDAO > regist : " + e.getMessage());
		}
		
		return result;
	}
	
	public int delete(String memberId, String[] idx) {
		int result = 0;
		String placeholders = String.join(",", Collections.nCopies(idx.length, "?"));
		String query = "DELETE FROM tbl_cart WHERE memberId = ? AND courseIdx IN (" + placeholders + ")";
		
		try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, memberId);
	        // String 배열의 값을 int로 변환하여 PreparedStatement에 설정
	        for (int i = 0; i < idx.length; i++) {
	            psmt.setInt(i + 2, Integer.parseInt(idx[i].split("/")[0]));
	        }

	        result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String memberId, int idx) {
		int result = 0;
		String query = "DELETE FROM tbl_cart WHERE idx=?";
		
		try {
	        psmt = con.prepareStatement(query);
	        psmt.setInt(1, idx);
	        

	        result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> CartDAO > delete : " + e.getMessage());
		}
		return result;
	}
}
