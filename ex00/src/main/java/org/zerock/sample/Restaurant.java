package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;

//자동 생성을 위한 어노테이션
//- @Controller - url : HTML, @Service - 처리, @Repository - 데이터 저장, 
//@Component - 구성체, @RestController - url : data : ajax, @~Advice - 예외 처리
@Component
@Data
// 자동 DI - private 변수가 많을 때 - 한꺼번에 생성자를 이용해서 데이터를 세팅할 수 있다.
// @AllArgsConstructor
public class Restaurant {

	// 자동 DI
	// lombok : @Setter(onMethod_ = @Autowired), Spring - @Autowired
	// jAVA : @Inject
	@Setter(onMethod_ = @Autowired)
	private Chef chef;
	
}
