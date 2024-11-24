package net.hb.dao;

import java.util.ArrayList;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.CourseDTO;
import net.hb.dto.LessonDTO;
import net.hb.dto.TeacherDTO;
import net.hb.utils.CommonDateUtil;

public class LessonDAO extends DBConnPool {

	public LessonDAO() {
		super();
	}
	
	public int lessonModify(String title, String content, String videoPath, int idx) {
		StringBuilder query = new StringBuilder();
		query.append("UPDATE tbl_lesson SET");
		query.append(" title=?, content=?, videoPath=?");
		query.append(" WHERE idx=?");
		
		int result = 0;
		try {
			psmt = con.prepareStatement(query.toString());
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, videoPath);
			psmt.setInt(4, idx);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int lessonDelete(int idx) {
		String query = "DELETE FROM tbl_lesson WHERE idx=?";
		int result = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<LessonDTO> getLesson(int courseIdx) {
		List<LessonDTO> list = new ArrayList<>();
		StringBuilder query = new StringBuilder();
		query.append("SELECT");
		query.append(" le.title, le.lessonOrder, le.idx, le.content, le.videoPath, le.courseIdx");
		query.append(" FROM tbl_lesson AS le ");
		query.append(" WHERE le.courseIdx = ?");
		query.append(" ORDER BY le.lessonOrder");
		
		try {
			psmt = con.prepareStatement(query.toString());
			psmt.setInt(1, courseIdx);
			rs = psmt.executeQuery();
			LessonDTO dto;
			while (rs.next()) {
				dto = new LessonDTO();
				dto.setTitle(rs.getString(1));
				dto.setOrder(rs.getInt(2));
				dto.setIdx(rs.getInt(3));
				dto.setContent(rs.getString(4));
				dto.setVideoPath(rs.getString(5));
				dto.setCourseIdx(rs.getInt(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int lessonRegist(int courseIdx, int lessonOrder, String title, String content, String videoPath) {
		String query = "INSERT INTO tbl_lesson ( courseIdx, lessonOrder, title, content, videoPath ) "
				+ " VALUES ( ?, ?, ?, ?, ? )";
		int result = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, courseIdx);
			psmt.setInt(2, lessonOrder);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setString(5, videoPath);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

	public LessonDTO lessonView(int lessonIdx) {
		LessonDTO dto = new LessonDTO();
		StringBuilder query = new StringBuilder();
		query.append(
				"SELECT le.courseIdx, le.lessonOrder, le.title, le.content, le.videoPath, me.name, te.`subject` FROM tbl_lesson AS le");
		query.append(" INNER JOIN tbl_course AS co ON le.courseIdx = co.idx");
		query.append(" INNER JOIN tbl_member AS me ON co.teacherId = me.memberId");
		query.append(" INNER JOIN tbl_teacher AS te ON co.teacherId = te.teacherId");
		query.append(" WHERE le.idx = ?");

		try {
			psmt = con.prepareStatement(query.toString());
			psmt.setInt(1, lessonIdx);

			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setCourseIdx(rs.getInt(1));
				dto.setOrder(rs.getInt(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setVideoPath(rs.getString(5));
				dto.setTeacherName(rs.getString(6));
				dto.setSubject(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public int count(int courseIdx) {
		int count = 0;

		String sql = "SELECT count(idx) FROM tbl_lesson WHERE courseIdx = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, courseIdx);
			rs = psmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(">> LessonDAO > count : " + e.getMessage());
		}
		return count;

	}
}
