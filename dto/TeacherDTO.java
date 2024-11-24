package net.hb.dto;

//선생님 정보
public class TeacherDTO {
	private String teacherId; //회원아이디 PK
	private int profileIdx;//프로필사진인덱스 FK
	private int bannerIdx; //배너사진 FK
	private String subject; //과목
	private String description;//한줄소개
	private String name;

	private MemberDTO memberInfo;
	
	public MemberDTO getMemberInfo() {
		return memberInfo;
	}
	public void setMemberInfo(MemberDTO memberInfo) {
		this.memberInfo = memberInfo;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getProfileIdx() {
		return profileIdx;
	}
	public void setProfileIdx(int profileIdx) {
		this.profileIdx = profileIdx;
	}
	public int getBannerIdx() {
		return bannerIdx;
	}
	public void setBannerIdx(int bannerIdx) {
		this.bannerIdx = bannerIdx;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
