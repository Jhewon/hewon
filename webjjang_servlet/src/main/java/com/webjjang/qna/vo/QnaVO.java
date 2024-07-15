package com.webjjang.qna.vo;

public class QnaVO {

	// private 변수
	private Long no;
	private String title;
	private String content;
	private String id;
	private String name;
	private String writeDate;
	private Long refNo; // 관련글 번호
	private Long ordNo; // 순서번호
	private Long levNo; // 들여쓰기 번호
	private Long parentNo; // 자동삭제 를 위한 부모글번호
	private boolean isQuestion; // 등록시 질문과 답변 구분
	
	// getter & setter
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public Long getRefNo() {
		return refNo;
	}
	public void setRefNo(Long refNo) {
		this.refNo = refNo;
	}
	public Long getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(Long ordNo) {
		this.ordNo = ordNo;
	}
	public Long getLevNo() {
		return levNo;
	}
	public void setLevNo(Long levNo) {
		this.levNo = levNo;
	}
	public Long getParentNo() {
		return parentNo;
	}
	public void setParentNo(Long parentNo) {
		this.parentNo = parentNo;
	}
	public boolean isQuestion() { // boolean type 의 getter 는 앞에 get 대신 is 가 붙는다.
		return isQuestion;
	}
	public void setQuestion(boolean isQuestion) {
		this.isQuestion = isQuestion;
	}
	
	@Override
	public String toString() {
		return "QnaVO [no=" + no + ", title=" + title + ", content=" + content + ", id=" + id + ", name=" + name
				+ ", writeDate=" + writeDate + ", refNo=" + refNo + ", ordNo=" + ordNo + ", levNo=" + levNo
				+ ", parentNo=" + parentNo + ", isQuestion=" + isQuestion + "]";
	}
	
}
