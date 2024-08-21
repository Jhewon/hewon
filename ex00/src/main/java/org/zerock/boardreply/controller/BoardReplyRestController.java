package org.zerock.boardreply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.boardreply.service.BoardReplyService;
import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

//자동 생성 - @Controller, @RestController, @Service, @Repository, @Component, @~Advice
@RestController
@RequestMapping("/boardreply")
@Log4j
public class BoardReplyRestController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	@Autowired
	@Qualifier("boardReplyServiceImpl")
	private BoardReplyService service;
	
	// 1. list - get
	@GetMapping(value = "/list.do",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Map<String, Object>>
		list(PageObject pageObject, Long no) {
		log.info("list - page : " + pageObject.getPage() + ", no : " + no);
		// DB에서 데이터를 가져와서 넘겨 준다.
		List<BoardReplyVO> list = service.list(pageObject, no);
		// list와 PageObject를 넘겨야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageObject", pageObject);
		
		// list와 pageObject의 데이터 확인
		log.info("After - map : " + map);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	// 2. write - post
	@PostMapping(value =  "/write.do" , consumes = "application/json" , produces = "text/plain; charset=UTF-8")
	// BoardReplyVO - 글번호(no),내용(content) + 아이디(id) : JSON 데이터로 한개로 넘어온다.
	// JSON 데이터 처리를 하려면 @RequestBody
	public ResponseEntity<String> write(@RequestBody BoardReplyVO vo , HttpSession session) {
		// 로그인이 되어 있어야 사용 가능
		vo.setId(getId(session)); // 현제는 test 만 나온다. 로그인을 하지 않아도 된다.
		
		// 등록 처리 
		service.write(vo);
		return new ResponseEntity<String>("댓글 등록이 되었습니다!",HttpStatus.OK);
	}
	
	// 3. update - post
	@PostMapping(value =  "/update.do" , consumes = "application/json" , produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> update(@RequestBody BoardReplyVO vo , HttpSession session) {
		// 로그인이 되어 있어야 사용 가능
		vo.setId(getId(session));
		// 수정 처리 
		Integer result =  service.update(vo);
		if(result == 1)
			return new ResponseEntity<String>("댓글 수정이 되었습니다!",HttpStatus.OK);
		else 
			return new ResponseEntity<String>("댓글 수정이 되지않음 --- 확인좀 잘해라",HttpStatus.BAD_REQUEST);
			
	}
	
	// 4. delete - get
	@GetMapping(value =  "/delete.do", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> delete(BoardReplyVO vo , HttpSession session) {
		
		// 로그인이 되어 있어야 사용 가능
		vo.setId(getId(session));
		Integer result = service.delete(vo);
		if(result == 1)
			return new ResponseEntity<String>("댓글 삭제 되었습니다!",HttpStatus.OK);
		else 
			return new ResponseEntity<String>("댓글 삭제가 되지않음 --- 확인좀 잘해라",HttpStatus.BAD_REQUEST);
	}
	
	private String getId(HttpSession session) {
//		LoginVO vo = session.getAttribute("login");
//		String id = vo.getId();
		return "test"; // 강제 로그인 처리해서 test 로 하드코딩 했다.
	}

}
