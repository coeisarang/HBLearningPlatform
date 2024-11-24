package net.hb.dto;

import java.time.LocalDateTime;

//수강정보
public class AttendDTO {
	private int idx; //인덱스 pk
	private String memberId; //수강자 아이디 FK
	private int courseIdx; //강좌번호 FK
	private String status; //진행상태(수강중, 수강완료, 미수강)
	private LocalDateTime startDate; // 수강 시작 날짜
	
	private CourseDTO courseInfo;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getCourseIdx() {
		return courseIdx;
	}
	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDateTime getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}
	public CourseDTO getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(CourseDTO courseInfo) {
		this.courseInfo = courseInfo;
	}
	
	
}
