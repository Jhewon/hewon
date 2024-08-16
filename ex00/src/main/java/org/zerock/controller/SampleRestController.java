package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleDTO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;


// @Controller , @RestController  - uri 와 관련. 
// @RestController 에는 기본이 @ResponseBody이므로 생략 한다. - 전달되는 데이터가 순수한 데이터 이다.
@RestController
@RequestMapping("/sampleRest")
@Log4j
public class SampleRestController {

	@GetMapping(value =  "/getText" , produces = "text/plain; charset=UTF-8")
	public String getText() {
		
		log.info("MINE TYPE : " + MediaType.TEXT_PLAIN_VALUE);
		
		return "안녕하세요";
	}
	
	// DTO 객체를  json 과 xml 데이터로 처리 (제공)
	@GetMapping(value = "/getSample" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE , MediaType.APPLICATION_XML_VALUE})
	public SampleDTO getSample() {
		
		return new SampleDTO("홍길동", 10);
	}
	
	// List 객체를 제공
	@GetMapping(value =  "/getList")
	public List<SampleDTO> getList(){
		List<SampleDTO> list = new ArrayList<>();
		list.add(new SampleDTO("홍길동", 12));
		list.add(new SampleDTO("홍길", 12));
		
		return list;
	}
	
	//Map 객체를 xml , json 데이터 제공
	@GetMapping(value =  "/getMap")
	public Map<String , Object> getMap(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<SampleDTO> list = new ArrayList<>();
		list.add(new SampleDTO("홍길동", 12));
		list.add(new SampleDTO("홍길", 12));
		
		// map.put("dto", new SampleDTO("홍길동", 12));
		
		// 특성이 서로 툴란 여러개의 데이터를 담아서 넘길때
		 map.put("list",list);
		 map.put("pageObject", new PageObject());
		return map;
	}
	
}
