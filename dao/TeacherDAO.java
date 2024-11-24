package net.hb.dao;

import java.util.ArrayList;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.MemberDTO;
import net.hb.dto.TeacherDTO;

public class TeacherDAO extends DBConnPool {
	public int regist() {
		return 0;
	}
	
	public int count() {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(te.teacherId) FROM tbl_teacher AS te");
		sb.append(" INNER JOIN tbl_member AS me ON te.teacherId = me.memberId");
		sb.append(" WHERE me.status = 'N' ");
		
		try {
	    	psmt = con.prepareStatement(sb.toString());
	    	rs = psmt.executeQuery();
	    	
	    	rs.next();
	    	result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int regist(String teacherId, String subject, String description, String name) {
		String query = "INSERT INTO tbl_teacher (teacherId, subject, description, name) VALUES ( ?, ?, ?, ? )";
		int result = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, teacherId);
			psmt.setString(2, subject);
			psmt.setString(3, description);
			psmt.setString(4, name);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int teacherModify(String teacherId, String name, String subject, String description, String email,
			String phone) {
		StringBuilder query = new StringBuilder();
		int result = 0;
		query.append("UPDATE tbl_teacher as te");
		query.append(" INNER JOIN tbl_member AS me ON te.teacherId = me.memberId");
		query.append(" SET");
		query.append(" te.teacherId=?, te.name=?, te.subject=?, te.description=?,");
		query.append(" me.email=?, me.phone=?");
		query.append(" WHERE te.teacherId = ?");

		try {
			psmt = con.prepareStatement(query.toString());
			psmt.setString(1, teacherId);
			psmt.setString(2, name);
			psmt.setString(3, subject);
			psmt.setString(4, description);
			psmt.setString(5, email);
			psmt.setString(6, phone);
			psmt.setString(7, teacherId);

			result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String name(String memberId) {
		String name = null;

		String sql = "SELECT name FROM tbl_teacher WHERE teacherId=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);

			rs = psmt.executeQuery();

			if (rs.next()) {
				name = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println(">> TeacherDAO > name : " + e.getMessage());
		}
		return name;
	}

	public List<TeacherDTO> list(String subject, int limit, int pageNo) {
		List<TeacherDTO> list = null;

		StringBuilder sb = new StringBuilder();

		int count = 1;

		sb.append("SELECT te.teacherId, te.profileIdx, te.bannerIdx, te.subject, te.description, te.name");
		sb.append(" FROM tbl_teacher AS te");
		sb.append(" INNER JOIN tbl_member AS me ON te.teacherId = me.memberId");
		sb.append(" WHERE me.status='N'");
		if (subject != null) {
			sb.append(" AND te.subject=?");
			count++;
		}
		if (limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
		}

		try {
			psmt = con.prepareStatement(sb.toString());
			if (subject != null)
				psmt.setString(1, subject);
			if (limit > 0 && pageNo > 0) {
				psmt.setInt(count++, (pageNo - 1) * limit);
				psmt.setInt(count, limit);
			}

			rs = psmt.executeQuery();

			list = new ArrayList<>();
			TeacherDTO dto;
			while (rs.next()) {
				dto = new TeacherDTO();
				dto.setTeacherId(rs.getString(1));
				dto.setProfileIdx(rs.getInt(2));
				dto.setBannerIdx(rs.getInt(3));
				dto.setSubject(rs.getString(4));
				dto.setDescription(rs.getString(5));
				dto.setName(rs.getString(6));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> TeacherDAO > list : " + e.getMessage());
		}
		return list;
	}

	public TeacherDTO view(String teacherId) { // 1027 17시 15분 인규 수정
		TeacherDTO dto = null;
		StringBuilder sb = new StringBuilder();

		sb.append("SELECT te.teacherId, te.profileIdx, te.bannerIdx, te.subject, te.description, te.name,");
		sb.append(" me.email, me.phone");
		sb.append(" FROM tbl_teacher as te");
		sb.append(" INNER JOIN tbl_member as me ON te.teacherId = me.memberId");
		sb.append(" WHERE teacherId=?");

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, teacherId);

			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new TeacherDTO();
				dto.setTeacherId(rs.getString(1));
				dto.setProfileIdx(rs.getInt(2));
				dto.setBannerIdx(rs.getInt(3));
				dto.setSubject(rs.getString(4));
				dto.setDescription(rs.getString(5));
				dto.setName(rs.getString(6));

				MemberDTO memberInfo = new MemberDTO();
				memberInfo.setEmail(rs.getString(7));
				memberInfo.setPhone(rs.getString(8));

				dto.setMemberInfo(memberInfo);
			}
		} catch (Exception e) {
			System.out.println(">> TeacherDAO > view : " + e.getMessage());
		}
		return dto;
	}
}
