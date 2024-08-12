package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class todoDTO {

	// yyyy-mm-dd -> 사용자 입력 날짜를 java로 가져올때 패턴 지정을 안하면 오류
	// pattern -> @DateTimeFormat 참조
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate ;
}
