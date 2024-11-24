package net.hb.dto;

import java.time.LocalDateTime;

//회원
public class MemberDTO {
	// 필수
	private String memberId; // 회원 아이디
	private String pwd;// 비밀번호
	private String name; // 이름
	private String memType;// 회원유형(관리자, 학생, 선생님)

	// 추가 정보(수정가능)
	private String birthday;//생일
	private String gender;//성별
	private String phone;//전화번호
	private String email;//이메일
	private String school;//학교(초중고)
	private int grade;//학년
	private LocalDateTime regDate;//가입일
	private LocalDateTime leaveDate;//탈퇴일
	private LocalDateTime pwdChangeDate;//비번변경일
	private String status;//탈퇴상태
	
	// DB X, 만들면서 필요하면 추가
	private TeacherDTO teacherInfo; // (선생님일때)정보
	private PaymentDTO payments; // 결제정보

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDateTime getRegDate() {
		return regDate;
	}

	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}

	public LocalDateTime getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(LocalDateTime leaveDate) {
		this.leaveDate = leaveDate;
	}

	public LocalDateTime getPwdChangeDate() {
		return pwdChangeDate;
	}

	public void setPwdChangeDate(LocalDateTime pwdChangeDate) {
		this.pwdChangeDate = pwdChangeDate;
	}

	public TeacherDTO getTeacherInfo() {
		return teacherInfo;
	}

	public void setTeacherInfo(TeacherDTO teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public PaymentDTO getPayments() {
		return payments;
	}

	public void setPayments(PaymentDTO payments) {
		this.payments = payments;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
