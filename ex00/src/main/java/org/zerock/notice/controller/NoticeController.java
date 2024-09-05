package org.zerock.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.notice.service.NoticeService;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService service;
	
	//--- 공지사항 리스트 ------------------------------------
	@GetMapping("/list.do")
	// public ModelAndView list(Model model) {
	public String list(Model model, HttpServletRequest request)
			throws Exception {
	//	public String list(HttpServletRequest request) {
		log.info("list.do");
		// request.setAttribute("list", service.list());
		
		// 페이지 처리를 위한 객체 생겅
		PageObject pageObject = PageObject.getInstance(request);
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("list", service.list(pageObject));
		log.info(pageObject);
		model.addAttribute("pageObject", pageObject);
		return "notice/list";
		
		// ModelAndView
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", service.list());
//		mav.setViewName("notice/list");
//		
//		return mav;
		
	}
	
	//--- 공지사항 글보기 ------------------------------------
	@GetMapping("/view.do")
	public String view(Model model, Long no, int inc) {
		log.info("view.do");
		
		model.addAttribute("vo", service.view(no, inc));
		
		return "notice/view";
	}
	
	//--- 공지사항 글등록 폼 ------------------------------------
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do");
		return "notice/writeForm";
	}
	
	//--- 공지사항 글등록 처리 ------------------------------------
	@PostMapping("/write.do")
	public String write(NoticeVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "공지사항 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	//--- 공지사항 글수정 폼 ------------------------------------
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Model model) {
		log.info("updateForm.do");
		
		model.addAttribute("vo", service.view(no, 0));
		
		return "notice/updateForm";
	}
	
	//--- 공지사항 글수정 처리 ------------------------------------
	@PostMapping("/update.do")
	public String update(NoticeVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if(service.update(vo) == 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "공지사항 글수정이 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"공지사항 글수정이 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
		
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
	}
	
	
	//--- 공지사항 글삭제 처리 ------------------------------------
	@PostMapping("/delete.do")
	public String delete(NoticeVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		log.info(vo);
		// 처리 결과에 대한 메시지 처리
		if(service.delete(vo) == 1) {
			rttr.addFlashAttribute("msg", "공지사항 글삭제가 되었습니다.");
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg",
					"공지사항 글삭제가 되지 않았습니다. "
							+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
			return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
		}
	}
	
}
