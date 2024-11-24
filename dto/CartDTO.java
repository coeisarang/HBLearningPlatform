package net.hb.dto;

//장바구니
public class CartDTO {
	private int idx; //인덱스 pk
	private String memberId; //장바구니 주인 아이디 FK
	private int courseIdx; //강좌번호 FK
	
	
	//DB X
	private CourseDTO courseInfo;
	
	
	public CourseDTO getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(CourseDTO courseInfo) {
		this.courseInfo = courseInfo;
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
	public int getCourseIdx() {
		return courseIdx;
	}
	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}

	
}
