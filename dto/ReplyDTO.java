package net.hb.dto;

import java.time.LocalDateTime;

//댓글(자유게시판)
public class ReplyDTO {
	private int idx; // 인덱스 PK
	private String memberId; // 작성자 ID FK
	private int boardIdx; // 글 번호
	private String content; // 내용
	private LocalDateTime regDate; // 등록일
	private LocalDateTime modifyDate;//수정일
	
	// DB X
	private MemberDTO memberInfo; //작성자 정보 (DB X)

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
	
	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
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

	public MemberDTO getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberDTO memberInfo) {
		this.memberInfo = memberInfo;
	}

	public LocalDateTime getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	
	
}
