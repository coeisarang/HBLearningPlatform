package net.hb.dao;

import java.util.ArrayList;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.MemberDTO;
import net.hb.dto.ReplyDTO;
import net.hb.utils.CommonDateUtil;

public class ReplyDAO extends DBConnPool {

	public ReplyDAO() {
		super();
	}
	
	public List<ReplyDTO> listByMemberId(String memberId, int limit, int pageNo) {
		List<ReplyDTO> list = null;

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, boardIdx, content, regDate, modifyDate");
		sb.append(" FROM tbl_reply");
		sb.append(" WHERE memberId=?");
		sb.append(" ORDER BY regDate DESC");
		if(limit>0&&pageNo>0) {
			sb.append(" LIMIT ?,?");
		}

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			
			if(limit>0&&pageNo>0) {
				psmt.setInt(2, (pageNo-1)*limit);
				psmt.setInt(3, limit);
			}
			
			rs = psmt.executeQuery();

			list = new ArrayList<ReplyDTO>();
			ReplyDTO dto;
			while (rs.next()) {
				dto = new ReplyDTO();
				dto.setBoardIdx(rs.getInt(2));
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(memberId);
				dto.setContent(rs.getString(3));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(4)));
				dto.setModifyDate(rs.getDate(5) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(5)) : null);

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> ReplyDAO > listByBoardIdx : " + e.getMessage());
		}

		return list;
	}

	public List<ReplyDTO> listByBoardIdx(int boardIdx) { // 글 번호로 댓글 목록 가져오기
		List<ReplyDTO> list = null;

		StringBuilder sb = new StringBuilder(); // 인규 10월 28일 오전 1시 16분 수정
		sb.append("SELECT re.idx, re.memberId, re.content, re.regDate, re.modifyDate");
		sb.append(", me.memberId, me.name, me.school, me.grade");
		sb.append(" FROM tbl_reply AS re");
		sb.append(" LEFT OUTER JOIN tbl_member AS me ON re.memberId = me.memberId");
		sb.append(" WHERE re.boardIdx=?");

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setInt(1, boardIdx);
			rs = psmt.executeQuery();

			list = new ArrayList<ReplyDTO>();
			ReplyDTO dto;
			MemberDTO memberInfo;
			while (rs.next()) {
				dto = new ReplyDTO();
				dto.setBoardIdx(boardIdx);
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(4)));
				dto.setModifyDate(rs.getDate(5) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(5)) : null);

				if (rs.getString(6) != null) { // 회원정보 있으면 가져오기
					memberInfo = new MemberDTO();
					memberInfo.setMemberId(rs.getString(6));
					memberInfo.setName(rs.getString(7));
					memberInfo.setSchool(rs.getString(8));
					memberInfo.setGrade(rs.getInt(9));
					dto.setMemberInfo(memberInfo);
				}

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> ReplyDAO > listByBoardIdx : " + e.getMessage());
		}

		return list;
	}

	public int regist(ReplyDTO dto) {
		int result = 0;

		String sql = "INSERT INTO tbl_reply (memberId, boardIdx, content) VALUES(?,?,?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getMemberId());
			psmt.setInt(2, dto.getBoardIdx());
			psmt.setString(3, dto.getContent());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> ReplyDAO > regist : " + e.getMessage());
		}

		return result;
	}

	public int update(int idx, String content) {
		int result = 0;

		String sql = "UPDATE tbl_reply SET content=?, modifyDate=NOW() WHERE idx=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setInt(2, idx);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> ReplyDAO > update : " + e.getMessage());
		}

		return result;
	}

	public int deleteByIdx(int idx) {
		int result = 0;

		String sql = "DELETE FROM tbl_reply WHERE idx=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> ReplyDAO > deleteByIdx : " + e.getMessage());
		}

		return result;
	}

	public int deleteByBoardIdx(int idx) {
		int result = 0;

		String sql = "DELETE FROM tbl_reply WHERE boardIdx=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> ReplyDAO > deleteByBoardIdx : " + e.getMessage());
		}

		return result;
	}

}
