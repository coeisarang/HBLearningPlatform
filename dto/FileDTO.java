package net.hb.dto;

//파일
public class FileDTO {
	private int idx; // 인덱스 PK
	private String fileName; // 파일 이름
	private String filePath; // 파일 경로
	private int fileSize; // 파일 크기
	private String fileExt; // 파일 확장자
	private String category; // 게시판(자료실, 자유게시판, 프로필사진)
	private int refIdx; // 게시글 번호 FK

	public FileDTO() {
	}

	public FileDTO(String fileName, String filePath, int fileSize, String fileExt, int refIdx) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileExt = fileExt;
		this.refIdx = refIdx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRefIdx() {
		return refIdx;
	}

	public void setRefIdx(int refIdx) {
		this.refIdx = refIdx;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

}
