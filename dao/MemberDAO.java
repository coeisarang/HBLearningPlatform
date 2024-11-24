package net.hb.dao;

import java.util.ArrayList;
import java.util.List;

import net.hb.common.DBConnPool;
import net.hb.dto.MemberDTO;
import net.hb.utils.CommonDateUtil;

public class MemberDAO extends DBConnPool {
	public MemberDAO() {
		super();
	}
	
	public int modifyAdmin(String memberId, String pwd, String name, String birthday, String gender, String phone, String email, String school, int grade) {
	    int result = 0;
	    String query = "UPDATE tbl_member SET pwd = ?, name = ?, birthday = ?, gender = ?, phone = ?, email = ?, school = ?, grade = ? WHERE memberId = ?";
	    try  {
	    	psmt = con.prepareStatement(query);
	        psmt.setString(1, pwd);
	        psmt.setString(2, name);
	        psmt.setString(3, birthday);
	        psmt.setString(4, gender);
	        psmt.setString(5, phone);
	        psmt.setString(6, email);
	        psmt.setString(7, school);
	        psmt.setInt(8, grade);
	        psmt.setString(9, memberId);
	        result = psmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	public boolean exists(String memberId) {
		boolean result = false;
		StringBuilder sb = new StringBuilder();

		sb.append("SELECT memberId");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId=?");

		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);

			rs = psmt.executeQuery();

			if (rs.next()) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(">> MemberDAO > exists : " + e.getMessage());
		}
		return result;
	}
	
	public MemberDTO login(String memberId, String pwd) {
		// SELECT 시 가져올 컬럼 : memberId, password, name
		MemberDTO dto = null;
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT memberId, pwd, name, status, memType");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId=? AND pwd=?");
		
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			psmt.setString(2, pwd);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setMemberId(memberId);
				dto.setPwd(pwd);
				dto.setName(rs.getString(3));
				dto.setStatus(rs.getString(4));
				dto.setMemType(rs.getString(5));
			}
			
		} catch(Exception e) {
			System.out.println(">> MemberDAO > login : "+e.getMessage());
		}
		
		return dto;
	}

	public int regist(MemberDTO dto) {
		// INSERT INTO 멤버테이블 values ( .... ) (회원가입)
		int result = 0;
	
		StringBuilder sb = new StringBuilder();
		
		sb.append("INSERT INTO tbl_member (memberId, pwd, name, birthday, gender, phone, email, school, grade)");
		sb.append(" VALUES (?,?,?,?,?,?,?,?,?)");
		
		try {
			psmt = con.prepareStatement(sb.toString());
			
			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirthday());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getSchool());
			psmt.setInt(9, dto.getGrade());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> MemberDAO > regist : "+e.getMessage());
		}
			
		return result;
	}

	public MemberDTO view(String memberId) {
		// SELECT * FROM 멤버테이블 WHERE memberId=?
		MemberDTO dto = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT memberId, pwd, name, memType, birthday, gender, phone, email");
		sb.append(", school, grade, regDate, leaveDate, pwdChangeDate, status");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId=?");
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setMemberId(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setMemType(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setGender(rs.getString(6));
				dto.setPhone(rs.getString(7));
				dto.setEmail(rs.getString(8));
				
				dto.setSchool(rs.getString(9));
				dto.setGrade(rs.getInt(10));
				if(rs.getDate(11) != null) {					
					dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate(11)));
				}
				if(rs.getDate(12) != null) {					
					dto.setLeaveDate(CommonDateUtil.toLocalDateTime(rs.getDate(12)));
				}
				if(rs.getDate(13) != null) {					
					dto.setPwdChangeDate(CommonDateUtil.toLocalDateTime(rs.getDate(13)));
				}
				dto.setStatus(rs.getString(14));
			}
		} catch(Exception e) {
			System.out.println(">> MemberDAO > view : "+e.getMessage());
		}

		return dto;
	}

	public int update(MemberDTO dto) {
		// UPDATE password, email, phone, ... (회원정보수정)
		int result = -1;
		//
		
		int param = 5;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_member");
		sb.append(" SET phone=?, email=?, school=?, grade=?");
		if(dto.getPwd() != null) {
			sb.append(", pwd=?");
			param = 6;
		}
		sb.append(" WHERE memberId=?");
		
		try {
			psmt = con.prepareStatement(sb.toString());
			psmt.setString(1, dto.getPhone());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getSchool());
			psmt.setInt(4, dto.getGrade());
			if(dto.getPwd() != null) {
				psmt.setString(5, dto.getPwd());
			}
			psmt.setString(param, dto.getMemberId());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println(">> MemberDAO > update : "+e.getMessage());
		}
		
		return result;
	}
	
	public int delete(String memberId) {
		// UPDATE 멤버테이블 SET regDate = NOW(), <탈퇴여부컬럼명> = "Y" WHERE memberId = ? 
		int result = 0;
		//
		
		String sql = "UPDATE tbl_member SET leaveDate=NOW(), status='Y' WHERE memberId=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberId);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> MemberDAO > delete : "+e.getMessage());
		}
		
		return result;
	}
	
	public int count(String memType) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_member");
		sb.append(" WHERE memType IN ( ? )");
		
		try {
	    	psmt = con.prepareStatement(sb.toString());
	    	psmt.setString(1, memType);
	    	rs = psmt.executeQuery();
	    	
	    	rs.next();
	    	result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public List<MemberDTO> list(String memType, int pageNo){
		List<MemberDTO> list = new ArrayList<MemberDTO>();
	    StringBuilder sb = new StringBuilder();
	    sb.append("SELECT me.memberId, me.pwd, me.name, me.memType,");
	    sb.append(" me.birthday, me.gender, me.phone, me.email, me.school, me.grade,");
	    sb.append(" me.regDate, me.leaveDate, me.pwdChangeDate, me.status FROM tbl_member AS me");
	    sb.append(" WHERE memType IN ( ? ) AND status IN ( 'N' )");
	    sb.append(" ORDER BY regDate DESC");
	    sb.append(" LIMIT ?, 10");
	   
	  
	   
	    try {
	    	psmt = con.prepareStatement(sb.toString());
	    	psmt.setString(1, memType);
	    	psmt.setInt(2, (pageNo-1)*10);
	    	rs = psmt.executeQuery();
	    	
	    	MemberDTO dto;
    	 while (rs.next()) {
    	        dto = new MemberDTO();
    	        dto.setMemberId(rs.getString("memberId"));
    	        dto.setPwd(rs.getString("pwd"));
    	        dto.setName(rs.getString("name"));
    	        dto.setMemType(rs.getString("memType"));
    	        dto.setBirthday(rs.getString("birthday"));
    	        dto.setGender(rs.getString("gender"));
    	        dto.setPhone(rs.getString("phone"));
    	        dto.setEmail(rs.getString("email"));
    	        dto.setSchool(rs.getString("school"));
    	        dto.setGrade(rs.getInt("grade"));
    	     // regDate 처리
                if (rs.getDate("regDate") != null) {
                    dto.setRegDate(CommonDateUtil.toLocalDateTime(rs.getDate("regDate")));
                } else {
                    dto.setRegDate(null);
                }
                // leaveDate 처리
                if (rs.getDate("leaveDate") != null) {
                    dto.setLeaveDate(CommonDateUtil.toLocalDateTime(rs.getDate("leaveDate")));
                } else {
                    dto.setLeaveDate(null);
                }
                // pwdChangeDate 처리
                if (rs.getDate("pwdChangeDate") != null) {
                    dto.setPwdChangeDate(CommonDateUtil.toLocalDateTime(rs.getDate("pwdChangeDate")));
                } else {
                    dto.setPwdChangeDate(null);
                }
    	        dto.setStatus(rs.getString("status"));
    	        list.add(dto);  // 리스트에 DTO 추가
    	    }
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return list;
	   
	}
	
	public int registT(MemberDTO dto) {
		// INSERT INTO 멤버테이블 values ( .... ) (회원가입)
		int result = 0;
	
		StringBuilder sb = new StringBuilder();
		
		sb.append("INSERT INTO tbl_member (memberId, pwd, name, birthday, gender, phone, email, school, grade, memType)");
		sb.append(" VALUES (?,?,?,?,?,?,?,?,?, 't' )");
		
		try {
			psmt = con.prepareStatement(sb.toString());
			
			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirthday());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getSchool());
			psmt.setInt(9, dto.getGrade());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(">> MemberDAO > regist : "+e.getMessage());
		}
			
		return result;
	}


}
