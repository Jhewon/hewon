package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

//  자동 생성 어노테이션
// @Controller , @RestController - uri , @Service - 처리 , @Repository - 데이터 저장
// @~ Advice - 예외처리
@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@RequestMapping("") // /sample/ 
	// return이 없으면(void)이면 uri 정보를 jsp  정보로 사용.
	// return 이 String 이면 redirect: -> redirect 시킨다. 없으면 jsp 로 forward 시킨다.
	public void basic() {
		log.info("basic...........");
	}
	
	//uri 매핑이 get과 post 방식만 허용
	@RequestMapping(value = "/basic" , method = {RequestMethod.GET,RequestMethod.POST})
	public void basicGet() {
		log.info("gasic Get / post -------------------------------------------");
	}
	
	// get 만 사용 value 속성 하나만 남으면 기본으로 데이터가 들어가는 속성이 된다. 생략 가능
	@GetMapping(value = "/basicOnlyGet")
	public void basicGet2() {
		log.info("gasic Only Get  -------------------------------------------");
	}
}
