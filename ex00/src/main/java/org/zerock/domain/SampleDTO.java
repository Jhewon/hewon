package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
// 생성자를 이용해서 parameter 로 값을 전달해서 저장 시킨다.
@AllArgsConstructor
public class SampleDTO {

	private String name;
	private int age;
	
}
