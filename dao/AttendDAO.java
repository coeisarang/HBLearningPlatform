package net.hb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hb.common.DBConnPool;
import net.hb.dto.AttendDTO;
import net.hb.dto.CourseDTO;
import net.hb.dto.ReportDTO;
import net.hb.dto.TeacherDTO;
import net.hb.utils.CommonDateUtil;

public class AttendDAO extends DBConnPool {
	private Map<String, String> code;
	
	

	public AttendDAO() {
		super();
		code = new HashMap<>();
		code.put("a", "수강 전");
		code.put("b", "수강 중");
		code.put("c", "수강 완료");
	}

	public List<AttendDTO> list(String memberId, String status, int limit, int pageNo) {
		//SELECT 해당 회원 수강 목록 limit 개수만큼 JOIN courseIdx order by startDate
		
		List<AttendDTO> list = null;
		
		
		CourseDTO courseInfo = null;
		TeacherDTO teacherInfo = null;
		AttendDTO dto = null;
		
		
		StringBuilder sb = new StringBuilder();
		//컬럼
		sb.append("SELECT at.idx, at.memberId, at.courseIdx, at.status, at.startDate");
		sb.append(" , co.idx, co.title, co.teacherId, co.price, co.detail, co.regDate, co.school, co.grade, co.subject");
		sb.append(" , te.teacherId, te.profileIdx, te.bannerIdx, te.subject, te.description, te.name");
		//테이블
		sb.append(" FROM tbl_attend AS at");
		sb.append(" INNER JOIN tbl_course AS co ON at.courseIdx = co.idx AND at.memberId = ?");
		if(status != null) sb.append(" AND at.status = ?");
		sb.append(" LEFT OUTER JOIN tbl_teacher AS te ON co.teacherId = te.teacherId");
		//정렬
		sb.append(" ORDER BY at.startDate");
		//개수
		if(limit > 0 && pageNo > 0)
			sb.append(" LIMIT ?,?");
		
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			
			int idx = 2;
			if(status != null) {
				psmt.setString(2, status);
				idx = 3;
			}
			
			if(limit > 0 && pageNo > 0) {
				psmt.setInt(idx++, (pageNo-1)*limit);
				psmt.setInt(idx, limit);
			}
			
			rs = psmt.executeQuery();
			
			list = new ArrayList<AttendDTO>();
			while(rs.next()) {
				dto = new AttendDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setCourseIdx(rs.getInt(3));
				dto.setStatus(code.get(rs.getString(4)));
				dto.setStartDate(rs.getDate(5) != null ?  CommonDateUtil.toLocalDateTime(rs.getDate(5)) : null);
				
				courseInfo = new CourseDTO();
				
				courseInfo.setIdx(rs.getInt(6));
				courseInfo.setTitle(rs.getString(7));
				courseInfo.setTeacherId(rs.getString(8));
				courseInfo.setPrice(rs.getInt(9));
				courseInfo.setDetail(rs.getString(10));
				courseInfo.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(11)));
				courseInfo.setSchool(rs.getString(12));
				courseInfo.setGrade(rs.getInt(13));
				courseInfo.setSubject(rs.getString(14));
				
				teacherInfo = new TeacherDTO();
				teacherInfo.setTeacherId(rs.getString(15));
				teacherInfo.setProfileIdx(rs.getInt(16));
				teacherInfo.setBannerIdx(rs.getInt(17));
				teacherInfo.setSubject(rs.getString(18));
				teacherInfo.setDescription(rs.getString(19));
				teacherInfo.setName(rs.getString(20));
				
				courseInfo.setTeacherInfo(teacherInfo);
				
				dto.setCourseInfo(courseInfo);
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> AttendDAO > list : " + e.getMessage());
		}

		return list;
	}
	
	
	public int count(String memberId, String status) {
		//SELECT count(idx) where 회원,상태; (수강 정보 개수 반환)
		int count = -1;
		
		StringBuilder sb = new StringBuilder();
		//컬럼
		sb.append("SELECT count(idx)");
		//테이블
		sb.append(" FROM tbl_attend");
		//조건
		sb.append(" WHERE memberId=?");
		if(status != null)
			sb.append(" AND status=?");
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			if(status != null) psmt.setString(2, status);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch(Exception e) {
			System.out.println(">> AttendDAO > count : " + e.getMessage());
		}
		
		return count;
	}
	
	
	public int delete(String memberId, int courseIdx) {
		int result = 0;
		
		String sql = "DELETE FROM tbl_attend WHERE memberId=? AND courseIdx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> AttendDAO > delete : " + e.getMessage());
		}
		
		return result;
	}
	
	public int exists(String memberId, int courseIdx) {
		int result = 0;
		
		String sql = "SELECT count(idx) FROM tbl_attend WHERE memberId=? AND courseIdx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(">> AttendDAO > exists : " + e.getMessage());
		}
		
		return result;
	}
	
	public List<ReportDTO> getStudentList(int courseIdx) {
		List<ReportDTO> studentIdList = null;
		
		String sql = "SELECT at.memberId, re.score FROM tbl_attend AS at LEFT OUTER JOIN tbl_report AS re ON at.memberId = re.memberId WHERE at.courseIdx = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, courseIdx);
			
			rs = psmt.executeQuery();
			
			studentIdList = new ArrayList<ReportDTO>();
			while(rs.next()) {
				ReportDTO dto = new ReportDTO();
				
				dto.setMemberId(rs.getString(1));
				dto.setScore(rs.getString(2));
				studentIdList.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> AttendDAO > getStudentList : " + e.getMessage());
		}
		
		return studentIdList;
	}
	
	public int updateStatus(String memberId, int courseIdx) {
		String sql = "UPDATE tbl_attend SET status='b', startDate=NOW() WHERE memberId=? AND courseIdx=?";
		int result = -1;
		
		try {
			psmt =con.prepareStatement(sql);
			
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> AttendDAO > updateStatus : " + e.getMessage());
		}
		return result;
	}
}
