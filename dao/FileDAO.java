package net.hb.dao;

import java.util.ArrayList;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.FileDTO;

public class FileDAO extends DBConnPool {

	public FileDAO() {
		super();
	}
	
	public int insert(FileDTO dto) { //파일 테이블에 저장
		int result = 0;
		
		String sql = "INSERT INTO tbl_file (fileName, filePath, fileSize, fileExt, refIdx) VALUES (?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getFileName());
			psmt.setString(2, dto.getFilePath());
			psmt.setInt(3, dto.getFileSize());
			psmt.setString(4, dto.getFileExt());
			psmt.setObject(5, dto.getRefIdx() == 0 ? null : dto.getRefIdx() );
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> FileDAO > insert : " + e.getMessage());
		}
		return result;
	}
	
	public FileDTO view(int idx) { //아이디로 파일 검색해오기
		FileDTO dto = null;
		
		String sql = "SELECT fileName, filePath, fileSize, fileExt, category, refIdx FROM tbl_file WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new FileDTO();
				dto.setIdx(idx);
				dto.setFileName(rs.getString(1));
				dto.setFilePath(rs.getString(2));
				dto.setFileSize(rs.getInt(3));
				dto.setFileExt(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setRefIdx(rs.getInt(6));
			}
		} catch (Exception e) {
			System.out.println(">> FileDAO > view : " + e.getMessage());
		}
		return dto;
	}
	
	public List<FileDTO> listByRefIdx(int refIdx) { //글 번호로 파일 목록 가져오기
		List<FileDTO> list = null;
		
		String sql = "SELECT idx, fileName, filePath, fileSize, fileExt, category FROM tbl_file WHERE refIdx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, refIdx);
			
			rs = psmt.executeQuery();
			
			list = new ArrayList<FileDTO>();
			FileDTO dto;
			while(rs.next()) {
				dto = new FileDTO();
				dto.setIdx(rs.getInt(1));
				dto.setFileName(rs.getString(2));
				dto.setFilePath(rs.getString(3));
				dto.setFileSize(rs.getInt(4));
				dto.setFileExt(rs.getString(5));
				dto.setCategory(rs.getString(6));
				dto.setRefIdx(refIdx);
				
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println(">> FileDAO > listByRefIdx : " + e.getMessage());
		}
		return list;
	}
	
	public int countByRefIdx(int refIdx) {
		int count = 0;
		String sql = "SELECT count(idx) FROM tbl_file WHERE refIdx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, refIdx);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println(">> FileDAO > countByRefIdx : " + e.getMessage());
		}
		return count;
	}
	
	public int deleteByIdx(int idx) { //파일 번호로 파일 삭제
		int result = -1;
		
		String sql = "DELETE FROM tbl_file WHERE idx=?";		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> FileDAO > deleteByIdx : " + e.getMessage());
		}
		return result;
	}
	
	
	public int deleteByRefIdx(int refIdx) { //참조글 번호로 파일 삭제
		int result = -1;
		
		String sql = "DELETE FROM tbl_file WHERE refIdx=?";		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, refIdx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> FileDAO > deleteByRefIdx : " + e.getMessage());
		}
		return result;
	}
	
}
