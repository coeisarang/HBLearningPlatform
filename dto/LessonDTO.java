package net.hb.dto;

//강의 회차
public class LessonDTO {
	private int idx; // 인덱스
	private int courseIdx; // 강좌번호
	private int order; // 회차번호
	private String title; // 제목
	private String content; // 회차설명
	private String videoPath; // 동영상 주소

	// (DB X)
	private CourseDTO classInfo; // 강좌 정보
	
	// (DB X)(10250953인규추가)
	private String teacherName;
	private String subject;
	
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
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

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public CourseDTO getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(CourseDTO classInfo) {
		this.classInfo = classInfo;
	}

	public int getCourseIdx() {
		return courseIdx;
	}

	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}

}
