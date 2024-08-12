package org.zerock.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
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
	
	// request 사용
//	@GetMapping("/list.do")
//	public String list(HttpServletRequest request) {
//		log.info("list()");
//		request.setAttribute("list", service.list());		
//		return "board/list";
//	}
	
	// Model 사용
//	@GetMapping("/list.do")
//	public String list(Model model) {
//		log.info("list()");
//		// model 에 담으면 request에 자동으로 담기게 된다. - 처리된 데이터를  model 에 저장
//		model.addAttribute("list", service.list());		
//		return "board/list";
//	}
	
	
	// ModelAndView 사용
	@GetMapping("/list.do")
	public ModelAndView list(Model model) {
		log.info("list()");
		// ModelAndView 사용
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.list());
		mav.setViewName("board/list");
		return mav;
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
