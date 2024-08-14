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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.service.BoardService;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;

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
	
	// 일반 게시판 리스트
	// ModelAndView 사용
	@GetMapping("/list.do")
	public ModelAndView list(Model model , HttpServletRequest request) throws Exception {
		log.info("list()");
		// 페이지 처리를 위한 페이지 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		// ModelAndView 사용
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.list(pageObject));
		mav.addObject("pageObject", pageObject);
		mav.setViewName("board/list");
		return mav;
	}
	// 일반 게시판 상세 보기
	 //Model 사용
	@GetMapping("/view.do")
	public String view(Model model , Long no , Long inc) {
		log.info("view()");
		model.addAttribute("vo", service.view(no,inc));		
		return "board/view";
	}
	// 일반 게시판 글등록 폼
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do()");
		return "board/writeForm";
	}
	
	// 일반 게시판 글등록 처리
	@PostMapping("/write.do")
	public String write(BoardVO vo, RedirectAttributes rttr) {
		log.info("write.do()");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "일반 게시판 글등록 완료");
		
		return "redirect:list.do";
	}
	
	// 일반 게시판 글수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long no , Model model) {
		log.info("updateForm.do()");
		model.addAttribute("vo", service.view(no,0L));		
		return "board/updateForm";
	}
	
	// 일반 게시판 글수정 처리
	@PostMapping("/update.do")
	public String update(BoardVO vo, RedirectAttributes rttr) {
		log.info("update.do()");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "일반 게시판 글등록 완료");
		
		return "redirect:view.do?=" + vo.getNo();
	}
	
}
