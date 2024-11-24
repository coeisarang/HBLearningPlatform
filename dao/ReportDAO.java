package net.hb.dao;

import java.util.ArrayList;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.CourseDTO;
import net.hb.dto.ReportDTO;
import net.hb.dto.TeacherDTO;
import net.hb.utils.CommonDateUtil;

public class ReportDAO extends DBConnPool {

	public boolean exists(String memberId, int courseIdx) { // 성적 있으면 true 없으면 false
		String sql = "SELECT count(idx) FROM tbl_report WHERE memberId=? AND courseIdx=?";
		boolean result = false;

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);

			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					result = true;
				}
			}
		} catch (Exception e) {
			System.out.println(">> ReportDAO > exists : " + e.getMessage());
		}

		return result;
	}

	public int regist(String memberId, int courseIdx, String score) {
		String sql = "INSERT INTO tbl_report (memberId, courseIdx, score) VALUES (?,?,?)";
		int result = 0;

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			psmt.setString(3, score);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> ReportDAO > regist : " + e.getMessage());
		}

		return result;
	}

	public int update(String memberId, int courseIdx, String score) {
		String sql = "UPDATE tbl_report SET score = ? WHERE memberId=? AND courseIdx=?";
		int result = 0;

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, score);
			psmt.setString(2, memberId);
			psmt.setInt(3, courseIdx);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> ReportDAO > regist : " + e.getMessage());
		}

		return result;
	}

	public List<ReportDTO> listByMemberId(String memberId) {
		List<ReportDTO> list = null;
		StringBuilder sb = new StringBuilder();

		sb.append("SELECT re.idx, re.memberId, re.courseIdx, re.score ");
		sb.append(", co.idx, co.title, co.teacherId, co.price, co.detail, co.regDate, co.school, co.grade, co.subject");
		sb.append(", te.teacherId, te.profileIdx, te.bannerIdx, te.subject, te.description, te.name");
		sb.append(" FROM tbl_report AS re LEFT OUTER JOIN tbl_course AS co ON re.courseIdx = co.idx");
		sb.append(" INNER JOIN tbl_teacher AS te ON co.teacherId = te.teacherId");
		sb.append(" WHERE re.memberId = ?");

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);

			rs = psmt.executeQuery();

			list = new ArrayList<ReportDTO>();
			while (rs.next()) {
				ReportDTO dto = new ReportDTO();

				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setCourseIdx(rs.getInt(3));
				dto.setScore(rs.getString(4));

				CourseDTO courseInfo = new CourseDTO();
				courseInfo.setIdx(rs.getInt(5));
				courseInfo.setTitle(rs.getString(6));
				courseInfo.setTeacherId(rs.getString(7));
				courseInfo.setPrice(rs.getInt(8));
				courseInfo.setDetail(rs.getString(9));
				courseInfo.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(10)));
				courseInfo.setSchool(rs.getString(11));
				courseInfo.setGrade(rs.getInt(12));
				courseInfo.setSubject(rs.getString(13));

				dto.setClassInfo(courseInfo);

				TeacherDTO teacherInfo = new TeacherDTO();
				teacherInfo.setTeacherId(rs.getString(14));
				teacherInfo.setProfileIdx(rs.getInt(15));
				teacherInfo.setBannerIdx(rs.getInt(16));
				teacherInfo.setSubject(rs.getString(17));
				teacherInfo.setDescription(rs.getString(18));
				teacherInfo.setName(rs.getString(19));

				dto.setTeacherInfo(teacherInfo);
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> ReportDAO > listByMemberId : " + e.getMessage());
		}

		return list;

	}
}
