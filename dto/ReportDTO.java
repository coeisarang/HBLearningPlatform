package net.hb.dto;

//성적표
public class ReportDTO {
	private int idx;// 인덱스 PK
	private String memberId; // 학생아이디 FK
	private int courseIdx;// 강좌인덱스 FK
	private String score; // 점수 (등급 ABC...)
	private String description; // 간단한 설명 (빼도 됨)
	
	
	//DB X
	private CourseDTO classInfo; // 강좌정보
	private TeacherDTO teacherInfo; // 선생님 정보
	
	public TeacherDTO getTeacherInfo() {
		return teacherInfo;
	}
	public void setTeacherInfo(TeacherDTO teacherInfo) {
		this.teacherInfo = teacherInfo;
	}
	public CourseDTO getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(CourseDTO classInfo) {
		this.classInfo = classInfo;
	}
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

	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCourseIdx() {
		return courseIdx;
	}
	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}
	
	
}
