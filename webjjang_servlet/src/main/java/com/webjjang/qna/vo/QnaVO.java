package com.webjjang.qna.vo;

import lombok.Data;

@Data
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
	@Override
	public String toString() {
		return "QnaVO [no=" + no + ", title=" + title + ", content=" + content + ", id=" + id + ", name=" + name
				+ ", writeDate=" + writeDate + ", refNo=" + refNo + ", ordNo=" + ordNo + ", levNo=" + levNo
				+ ", parentNo=" + parentNo + ", isQuestion=" + isQuestion + "]";
	}
}
