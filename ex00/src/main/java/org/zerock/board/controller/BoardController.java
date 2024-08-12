package org.zerock.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.board.service.BoardService;
import org.zerock.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


//자동 생성을 위한 어노테이션
//-@Controller - url : HTML, @Service - 처리 ,@Repository - 데이터 저장,
//@Component - 구성체 ,@RestController - url : data : ajax, @~Advice - 예외 처리
@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	//자동 DI
	@Setter(onMethod_ = @Autowired)
	@Qualifier("boardService")
	private BoardService service;
	
	@GetMapping("/list.do")
	public String list(HttpServletRequest request) {
		log.info("list()");
		request.setAttribute("list", service.list());		
		return "board/list";
	}
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do()");
		return "board/writeForm";
	}
	
	@PostMapping("/write.do")
	public String write(BoardVO vo) {
		log.info("write.do()");
		log.info(vo);
		service.write(vo);
		return "redirect:list.do";
	}
}
