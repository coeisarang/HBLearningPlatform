package net.hb.dto;

import java.time.LocalDateTime;

//강좌정보
public class CourseDTO {
	private int idx; //인덱스 pk
	private String title; // 제목
	private String teacherId; //작성자 아이디 FK
	private int price; //강좌금액(정가)
	private String detail; // 강좌 설명
	private LocalDateTime regDate; //등록일
	private String school; //학교(초중고)
	private int grade;//학년
	private String subject; //과목
	
	//DB X
	private TeacherDTO teacherInfo; // 강사정보 //TeacherDTO 설정해야함
	
	// (1024 9:53 미경 추가)
	private String teacherName;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public TeacherDTO getTeacherInfo() {
		return teacherInfo;
	}
	public void setTeacherInfo(TeacherDTO teacherInfo) {
		this.teacherInfo = teacherInfo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

}
