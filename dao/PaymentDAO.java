package net.hb.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hb.common.DBConnPool;
import net.hb.dto.PaymentDTO;
import net.hb.utils.CommonDateUtil;

public class PaymentDAO extends DBConnPool {

	private Map<String, String> code;

	public PaymentDAO() {
		super();
		this.code = new HashMap<String, String>();

		code.put("px", "결제 전");
		code.put("po", "결제 완료(환불 가능)");
		code.put("rx", "환불 불가");
		code.put("rr", "환불 신청");
		code.put("ro", "환불 완료");
	}
	
	public int updateStatusRx(String memberId, int courseIdx) {
		String sql = "UPDATE tbl_payment SET status='rx' WHERE memberId=? AND courseIdx=? AND status='po'";
		int result = -1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> PaymentDAO > updateStatusRx : " + e.getMessage());
		}

		return result;
	}
	
	public int getCourseIdx(int idx) {
		int courseIdx = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT courseIdx");
		sb.append(" FROM tbl_payment");
		sb.append(" WHERE idx =");
		sb.append(idx);
		
		try {
			psmt = con.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			if (rs.next()) {
				courseIdx = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(">> PaymentDAO > count : " + e.getMessage());
		}

		return courseIdx;
	}
	
	public String exists(String memberId, int courseIdx) {
		String result = null;
		
		String sql = "SELECT co.title FROM tbl_payment AS pa LEFT OUTER JOIN tbl_course AS co ON co.idx = pa.courseIdx WHERE pa.memberId=? AND pa.courseIdx=? AND pa.status IN ('po', 'rx')";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setInt(2, courseIdx);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1) == null) {
					result = "폐강";
				}
				else result = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println(">> PaymentDAO > exists : " + e.getMessage());
		}
		
		return result;
	}

	public List<PaymentDTO> list(String memberId, int limit, int pageNo) {
		// SELECT 해당 회원 결제 정보 limit 개수만큼 order by payDate
		// 마이페이지에
		List<PaymentDTO> list = null;

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT pa.idx, pa.memberId, pa.courseIdx, pa.price, pa.amount");
		sb.append(", pa.status, pa.payDate, pa.refundDate");
		sb.append(", co.title, co.school, co.grade, co.subject");
		sb.append(", te.name");
		sb.append(" FROM tbl_payment AS pa");
		sb.append(" LEFT OUTER JOIN tbl_course AS co");
		sb.append(" ON pa.courseIdx = co.idx AND pa.memberId=?");
		sb.append(" INNER JOIN tbl_teacher AS te");
		sb.append(" ON co.teacherId = te.teacherId");
		sb.append(" ORDER BY pa.payDate DESC");
		if (limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
		}
		int startIdx = (pageNo - 1) * limit;

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			if (limit > 0 && pageNo > 0) {
				psmt.setInt(2, startIdx);
				psmt.setInt(3, limit);
			}

			rs = psmt.executeQuery();

			list = new ArrayList<PaymentDTO>();
			PaymentDTO dto;
			while (rs.next()) {
				dto = new PaymentDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setCourseIdx(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setAmount(rs.getInt(5));
				dto.setStatus(code.get(rs.getString(6)));
				dto.setPayDate(CommonDateUtil.toLocalDateTime(rs.getDate(7)));
				dto.setRefundDate(rs.getDate(8) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(8)) : null);
				dto.setCourseName(rs.getString(9));
				dto.setSchool(rs.getString(10));
				dto.setGrade(rs.getInt(11));
				dto.setSubject(rs.getString(12));
				dto.setTeacherName(rs.getString(13));

				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println(">> PaymentDAO > list : " + e.getMessage());
		}

		return list;
	}

	public int count(String memberId, String status) {
		// SELECT count(idx) where 회원,상태; (결제 정보 개수 반환)
		int count = -1;

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT count(idx) FROM tbl_payment WHERE memberId=?");
		if (status != null)
			sb.append(" AND status=?");

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			if (status != null)
				psmt.setString(2, status);

			rs = psmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(">> PaymentDAO > count : " + e.getMessage());
		}

		return count;
	}

	public String getStatus(int idx) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT status, refundDate");
		sb.append(" FROM tbl_payment");
		sb.append(" WHERE idx =");
		sb.append(idx);

		String status = "";

		try {
			psmt = con.prepareStatement(sb.toString());

			rs = psmt.executeQuery();

			if (rs.next()) {
				status = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println(">> PaymentDAO > getStatus : " + e.getMessage());
		}

		return status;
	}

	public int refund(int idx) {
		int result = -1;

		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_payment");
		sb.append(" SET status='ro', refundDate = NOW()");
		sb.append(" WHERE idx =");
		sb.append(idx);

		try {
			psmt = con.prepareStatement(sb.toString());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> PaymentDAO > refund : " + e.getMessage());
		}

		return result;
	}

	public int paymentRegist(String[] data, String memberId) {
		int resultA = 0;
		int resultP = 0;
		StringBuilder a = new StringBuilder();
		a.append("INSERT IGNORE INTO tbl_attend ( memberId, courseIdx, status ) VALUES ");
		for (int i = 0; i < data.length; i++) {
			if (i > 0) {
				a.append(", "); // 첫 번째가 아니면 콤마를 추가
			}
			a.append("( ?, ?, 'a' )");
		}

		StringBuilder p = new StringBuilder();
		p.append("INSERT IGNORE INTO tbl_payment ( memberId, courseIdx, price, amount, status, payDate ) VALUES ");
		for (int i = 0; i < data.length; i++) {
			if (i > 0) {
				p.append(", "); // 첫 번째가 아니면 콤마를 추가
			}
			p.append("( ?, ?, ?, ?, 'po', NOW() )");
		}

		try {
			PreparedStatement psmtA = con.prepareStatement(a.toString());
			int parameterIndex = 1;
			for (int i = 0; i < data.length; i++) {
				psmtA.setString(parameterIndex++, memberId); // 첫 번째 ?에 memberId 바인딩
				psmtA.setInt(parameterIndex++, Integer.parseInt(data[i].split("/")[0])); // 두 번째 ?에 courseIdx 바인딩
			}

			PreparedStatement psmtP = con.prepareStatement(p.toString());
			parameterIndex = 1;
			for (int i = 0; i < data.length; i++) {
				psmtP.setString(parameterIndex++, memberId);
				psmtP.setInt(parameterIndex++, Integer.parseInt(data[i].split("/")[0]));
				psmtP.setInt(parameterIndex++, Integer.parseInt(data[i].split("/")[1]));
				psmtP.setInt(parameterIndex++, Integer.parseInt(data[i].split("/")[1]));
			}

			resultA = psmtA.executeUpdate();
			resultP = psmtP.executeUpdate();

			psmtA.close();
			psmtP.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultA * resultP;
	}
}
