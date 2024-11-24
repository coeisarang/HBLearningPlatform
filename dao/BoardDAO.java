package net.hb.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hb.common.DBConnPool;
import net.hb.dto.BoardDTO;
import net.hb.utils.CommonDateUtil;

public class BoardDAO extends DBConnPool {
	public BoardDAO() {
		super();
	}
	
	public int delete(int idx) {
		int result = -1;
		
		String sql = "DELETE FROM tbl_board WHERE idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> BoardDAO > delete : " + e.getMessage());
		}
		return result;

	}

	public List<BoardDTO> list(String memberId, String category, int limit, int pageNo) {
		// 안할거면 null or 0, limit=페이지당 개수, pageNo=페이지 번호
		// SELECT 해당 (회원, 게시판) 글 목록 limit 개수만큼 order by regdate
		List<BoardDTO> list = null;

		int cnt = 1;

		boolean and = false;
		int startIdx = (pageNo - 1) * limit;
		Map<Integer, Object> param = new HashMap<>();

		StringBuilder sb = new StringBuilder();
		sb.append(
				"SELECT bo.idx, bo.memberId, bo.title, bo.content, bo.regDate, bo.category, bo.readCnt, bo.fileStatus, bo.refIdx, bo.courseIdx, bo.score, bo.status, bo.modifyDate");
		if (category != null && category.equals("04"))
			sb.append(", count(re.idx)");
		sb.append(" FROM tbl_board AS bo");
		if (category != null && category.equals("04"))
			sb.append(" LEFT OUTER JOIN tbl_reply AS re ON bo.idx = re.boardIdx");

		sb.append(" WHERE (refIdx IS NULL OR refIdx = 0)");
		
		if (memberId != null) {
			sb.append(" AND bo.memberId=?");
			param.put(cnt++, memberId);
		}

		if (category != null) {
			sb.append(" AND");
			sb.append(" bo.category=?");
			param.put(cnt++, category);
		}

		if (category != null && category.equals("04"))
			sb.append(" GROUP BY bo.idx");

		sb.append(" ORDER BY regDate DESC");
		if (limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
			param.put(cnt++, startIdx);
			param.put(cnt++, limit);
		}

		try {
			psmt = con.prepareStatement(sb.toString());

			for (int i = 1; i <= param.size(); i++) {
				psmt.setObject(i, param.get(i));
			}

			rs = psmt.executeQuery();

			list = new ArrayList<>();
			BoardDTO dto;
			while (rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(5)));
				dto.setCategory(rs.getString(6));
				dto.setReadCnt(rs.getInt(7));
				dto.setFileStatus(rs.getString(8));
				dto.setRefIdx(rs.getInt(9));
				dto.setCourseIdx(rs.getInt(10));
				dto.setScore(rs.getInt(11));
				dto.setStatus(rs.getString(12));
				dto.setModifyDate(rs.getDate(13) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(13)) : null);

				if (category != null && category.equals("04"))
					dto.setReplyCnt(rs.getInt(14));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println(">> BoardDAO > list : " + e.getMessage());
		}

		return list;
	}

	public List<BoardDTO> courseBoardList(int courseIdx, String category, int limit, int pageNo) {
		// 강좌 게시판 글 목록
		List<BoardDTO> list = null;

		int cnt = 1;
		int startIdx = (pageNo - 1) * limit;
		boolean and = false;
		Map<Integer, Object> param = new HashMap<>();

		StringBuilder sb = new StringBuilder();
		sb.append(
				"SELECT idx, memberId, title, content, regDate, category, readCnt, fileStatus, refIdx, courseIdx, score, status, modifyDate");
		sb.append(" FROM tbl_board");

		sb.append(" WHERE");
		sb.append(" (refIdx IS NULL OR refIdx = 0)");

		if (courseIdx > 0) {
			sb.append(" AND courseIdx=?");
			and = true;
			param.put(cnt++, courseIdx);
		}

		if (category != null) {
			sb.append(" AND category=?");
			and = true;
			param.put(cnt++, category);
		}

		sb.append(" ORDER BY regDate DESC");

		if (limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
			param.put(cnt++, startIdx);
			param.put(cnt++, limit);
		}

		try {
			psmt = con.prepareStatement(sb.toString());

			for (int i = 1; i <= param.size(); i++) {
				psmt.setObject(i, param.get(i));
			}

			rs = psmt.executeQuery();

			list = new ArrayList<>();
			BoardDTO dto;
			while (rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(5)));
				dto.setCategory(rs.getString(6));
				dto.setReadCnt(rs.getInt(7));
				dto.setFileStatus(rs.getString(8));
				dto.setRefIdx(rs.getInt(9));
				dto.setCourseIdx(rs.getInt(10));
				dto.setScore(rs.getInt(11));
				dto.setStatus(rs.getString(12));
				dto.setModifyDate(rs.getDate(13) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(13)) : null);
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println(">> BoardDAO > courseBoardList : " + e.getMessage());
		}

		return list;
	}
	
	public List<BoardDTO> getAnswer(int courseIdx) {
		List<BoardDTO> list = null;

		StringBuilder sb = new StringBuilder();
		sb.append(
				"SELECT idx, memberId, title, content, regDate, category, readCnt, fileStatus, refIdx, courseIdx, score, status, modifyDate");
		sb.append(" FROM tbl_board");

		sb.append(" WHERE");
		sb.append(" refIdx=?");

		try {
			psmt = con.prepareStatement(sb.toString());

			psmt.setInt(1, courseIdx);

			rs = psmt.executeQuery();

			list = new ArrayList<>();
			BoardDTO dto;
			while (rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(5)));
				dto.setCategory(rs.getString(6));
				dto.setReadCnt(rs.getInt(7));
				dto.setFileStatus(rs.getString(8));
				dto.setRefIdx(rs.getInt(9));
				dto.setCourseIdx(rs.getInt(10));
				dto.setScore(rs.getInt(11));
				dto.setStatus(rs.getString(12));
				dto.setModifyDate(rs.getDate(13) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(13)) : null);
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println(">> BoardDAO > getAnswer : " + e.getMessage());
		}

		return list;
	}

	public List<BoardDTO> teacherBoardList(String teacherId, String category, int limit, int pageNo, String sort) {
		List<BoardDTO> list = null;

		int cnt = 1;
		Map<Integer, Object> param = new HashMap<Integer, Object>();

		StringBuilder sb = new StringBuilder();
		sb.append(
				"SELECT bo.idx, bo.memberId, bo.title, bo.content, bo.regDate, bo.category, bo.readCnt, bo.fileStatus, bo.refIdx, bo.courseIdx, bo.score, bo.status, bo.modifyDate");
		sb.append(" FROM tbl_board AS bo");
		sb.append(" INNER JOIN tbl_course AS co ON bo.courseIdx = co.idx AND co.teacherId=?");
		param.put(cnt++, teacherId);

		if (category != null) {
			sb.append(" AND");
			sb.append(" bo.category=?");
			param.put(cnt++, category);
		}

		sb.append(" WHERE refIdx IS NULL OR refIdx = 0");

		if (sort != null) {
			sb.append(" ORDER BY ");
			sb.append(sort);
		}

		if (limit > 0 && pageNo > 0) {
			sb.append(" LIMIT ?,?");
			param.put(cnt++, (pageNo - 1) * limit);
			param.put(cnt++, limit);
		}

		try {
			psmt = con.prepareStatement(sb.toString());

			for (int i = 1; i <= param.size(); i++) {
				psmt.setObject(i, param.get(i));
			}

			rs = psmt.executeQuery();

			list = new ArrayList<BoardDTO>();
			BoardDTO dto;
			while (rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(5)));
				dto.setCategory(rs.getString(6));
				dto.setReadCnt(rs.getInt(7));
				dto.setFileStatus(rs.getString(8));
				dto.setRefIdx(rs.getInt(9));
				dto.setCourseIdx(rs.getInt(10));
				dto.setScore(rs.getInt(11));
				dto.setStatus(rs.getString(12));
				dto.setModifyDate(rs.getDate(13) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(13)) : null);
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> BoardDAO > teacherBoardList : " + e.getMessage());
		}

		return list;
	}

	public int count(String memberId, String category, String status, int courseIdx) {
		// SELECT count(idx) where 회원,게시판번호; (글 작성 정보 개수 반환)
		int count = -1;

		StringBuilder sb = new StringBuilder();

		int paramCnt = 1;
		Map<Integer, Object> param = new HashMap<>();

		sb.append("SELECT count(idx) FROM tbl_board");

		
		sb.append(" WHERE (refIdx is null OR refIdx=0)");
		

		if (memberId != null) {
			sb.append(" AND");
			sb.append(" memberId=?");
			param.put(paramCnt++, memberId);
		}

		if (category != null) {
			sb.append(" AND");
			sb.append(" category=?");
			param.put(paramCnt++, category);
		}
		if (status != null) {
			sb.append(" AND");
			sb.append(" status=?");
			param.put(paramCnt++, status);
		}
		if (courseIdx > 0) {
			sb.append(" AND");
			sb.append(" courseIdx=?");
			param.put(paramCnt, courseIdx);
		}

		try {
			psmt = con.prepareStatement(sb.toString());

			for (int i = 1; i <= paramCnt; i++) {
				psmt.setObject(i, param.get(i));
			}

			rs = psmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(">> BoardDAO > count : " + e.getMessage());
		}
		return count;
	}

	public BoardDTO view(int idx) { // 게시글 하나 찾아오는 친구
		BoardDTO dto = null;
		String query = "SELECT idx, memberId, title, content, regDate, category, readCnt, fileStatus, refIdx, courseIdx, score, status, modifyDate FROM tbl_board WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);

			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setMemberId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(5)));
				dto.setCategory(rs.getString(6));
				dto.setReadCnt(rs.getInt(7));
				dto.setFileStatus(rs.getString(8));
				dto.setRefIdx(rs.getInt(9));
				dto.setCourseIdx(rs.getInt(10));
				dto.setScore(rs.getInt(11));
				dto.setStatus(rs.getString(12));
				dto.setModifyDate(rs.getDate(13) != null ? CommonDateUtil.toLocalDateTime(rs.getDate(13)) : null);
			}
		} catch (Exception e) {
			System.out.println(">> BoardDAO > view : " + e.getMessage());
		}
		return dto;
	}

	public List<BoardDTO> qnaReply(int idx) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		// SELECT memberId(작성자) content(답변내용) regDate(답변작성일시) FROM tbl_board WHERE
		// refIdx = ? ORDER BY regDate DESC

		String query = "SELECT memberId, content, regDate, idx FROM tbl_board WHERE refIdx = ? ORDER BY regDate ASC";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);

			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setMemberId(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(3)));
				dto.setIdx(rs.getInt(4));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(">> BoardDAO > qnaReply : " + e.getMessage());
		}
		return list;
	}

	public int regist(BoardDTO dto) {
		int result = 0;
		int idx = -1;

		String sql = "INSERT INTO tbl_board(memberId, title, content, category, fileStatus, refIdx, courseIdx, score, status)"
				+ " VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5, dto.getFileStatus());
			psmt.setInt(6, dto.getRefIdx());
			psmt.setInt(7, dto.getCourseIdx());
			psmt.setInt(8, dto.getScore());
			psmt.setString(9, dto.getStatus());

			result = psmt.executeUpdate();

			if (result > 0) {
				rs = psmt.getGeneratedKeys();
				if (rs.next())
					idx = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(">> BoardDAO > regist : " + e.getMessage());
		}
		return idx;
	}

	public int qnaReplyRegist(String memberId, String content, int idx) {
		int result = 0;
		String query = "INSERT INTO tbl_board ( memberId, content, regDate, refIdx ) VALUES ( ?, ?, NOW(), ? )";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberId);
			psmt.setString(2, content);
			psmt.setInt(3, idx);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int qnaRegist(String memberId, String title, String content) { // 게시판에 등록하는 건 한번에 만들어도 되지 않나? 일단 이건 문의게시판 등록용
		int result = 0;
		String query = "INSERT INTO tbl_board (memberId, title, content, category ) VALUES (?, ?, ?, '03')";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberId);
			psmt.setString(2, title);
			psmt.setString(3, content);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateStatus(int idx, String status) {
		int result = -1;
		String query = "UPDATE tbl_board SET status = ? WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, status);
			psmt.setInt(2, idx);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateFileStatus(int idx, String fileStatus) {
		int result = -1;
		String query = "UPDATE tbl_board SET fileStatus = ? WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, fileStatus);
			psmt.setInt(2, idx);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(">> BoardDAO > updateFileStatus : " + e.getMessage());
		}
		return result;
	}

	public BoardDTO getQnaView(int courseIdx, int idx) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT memberId, title, content, regDate, readCnt  FROM tbl_board WHERE category = '07' AND courseIdx = ? AND idx = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, courseIdx);
			psmt.setInt(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			dto.setMemberId(rs.getString(1));
			dto.setTitle(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(4)));
			dto.setReadCnt(rs.getInt(5));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public int deleteByIdx(int idx) {
		String sql = "DELETE FROM tbl_board WHERE idx=?";

		int result = -1;

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> BoardDAO > deleteByIdx : " + e.getMessage());
		}
		return result;
	}

	public int updateByIdx(int idx, String title, String content) {
		int result = -1;
		String query = "UPDATE tbl_board SET title=?, content=?, modifyDate=NOW() WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, idx);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(">> BoardDAO > updateByIdx : " + e.getMessage());
		}
		return result;
	}

	public int replyCount(int idx) { // 1026인규추가
		String query = "SELECT COUNT(*) FROM tbl_board WHERE refIdx = ?";
		int count = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);

			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updateReply(int idx, String content) {
		String query = "UPDATE tbl_board SET content = ? WHERE idx = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, content);
			psmt.setInt(2, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int addReadCnt(int idx) {
		String query = "UPDATE tbl_board SET readCnt = readCnt+1 WHERE idx = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> BoardDAO > addReadCnt : " + e.getMessage());
		}
		return result;
	}
}
