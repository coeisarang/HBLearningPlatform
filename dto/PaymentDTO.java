package net.hb.dto;

import java.time.LocalDateTime;

//결제정보
public class PaymentDTO {
	private int idx; // 인덱스 PK
	private String memberId; // 결제자 아이디 FK
	private int courseIdx; // 강좌 인덱스 FK
	private int price; // 정가
	private int amount; // 실제 결제 금액
	private String status; // 상태(결제 전/결제완료(환불가능)/환불불가/환불완료)
	private LocalDateTime payDate; // 결제날짜
	private LocalDateTime refundDate; // 환불날짜
	
	// DB X
	private MemberDTO memberInfo; // 결제 회원 정보
	private CourseDTO courseInfo; // 결제 강좌 정보

	// DB X 10.22.19:12인규추가
	private String courseName;
	private String teacherName;
	private String school;
	private int grade;
	private String subject;

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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDateTime getPayDate() {
		return payDate;
	}

	public void setPayDate(LocalDateTime payDate) {
		this.payDate = payDate;
	}

	public LocalDateTime getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(LocalDateTime refundDate) {
		this.refundDate = refundDate;
	}

	public MemberDTO getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberDTO memberInfo) {
		this.memberInfo = memberInfo;
	}

	public int getCourseIdx() {
		return courseIdx;
	}

	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}

	public CourseDTO getCourseInfo() {
		return courseInfo;
	}

	public void setCourseInfo(CourseDTO courseInfo) {
		this.courseInfo = courseInfo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

}
