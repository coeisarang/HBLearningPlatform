package net.hb.dto;

import java.time.LocalDateTime;

//자유게시판
public class BoardDTO {
	private int idx; // 인덱스 PK
	private String memberId; // 작성자아이디 FK
	private String title; // 제목
	private String content; // 내용
	private LocalDateTime regDate; // 등록일
	private String category; //게시판코드
	private int readCnt; // 조회수
	private String fileStatus; // 파일 존재 여부
	private int refIdx;//참조글 인덱스(QNA)
	private int courseIdx;// 강좌인덱스번호(강좌 게시판) FK
	private int score;// 점수(강좌후기)
	private String status;//답변상태(QNA)
	private LocalDateTime modifyDate;//수정일
	
	//DB X
	private int replyCnt;//댓글 개수
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCourseIdx() {
		return courseIdx;
	}

	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	// DB X
	private MemberDTO memberInfo; //작성자 정보

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getRegDate() {
		return regDate;
	}

	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	public MemberDTO getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberDTO memberInfo) {
		this.memberInfo = memberInfo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public int getRefIdx() {
		return refIdx;
	}

	public void setRefIdx(int refIdx) {
		this.refIdx = refIdx;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public LocalDateTime getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	
}
