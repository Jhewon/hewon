package org.zerock.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.service.MemberService;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService service;
	
	//--- 회원관리 리스트 ------------------------------------
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
		return "member/list";
		
		// ModelAndView
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", service.list());
//		mav.setViewName("member/list");
//		
//		return mav;
		
	}
	
	//--- 회원관리 글보기 ------------------------------------
	@GetMapping("/view.do")
	public String view(Model model, Long no, int inc) {
		log.info("view.do");
		
		model.addAttribute("vo", service.view(no, inc));
		
		return "member/view";
	}
	
	//--- 회원관리 글등록 폼 ------------------------------------
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do");
		return "member/writeForm";
	}
	
	//--- 회원관리 글등록 처리 ------------------------------------
	@PostMapping("/write.do")
	public String write(MemberVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "회원관리 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	//--- 회원관리 글수정 폼 ------------------------------------
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Model model) {
		log.info("updateForm.do");
		
		model.addAttribute("vo", service.view(no, 0));
		
		return "member/updateForm";
	}
	
	//--- 회원관리 글수정 처리 ------------------------------------
	@PostMapping("/update.do")
	public String update(MemberVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if(service.update(vo) == 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "회원관리 글수정이 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"회원관리 글수정이 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
		
		return "redirect:view.do?id=" + vo.getId();
	}
	
	
	//--- 회원관리 글삭제 처리 ------------------------------------
	@PostMapping("/delete.do")
	public String delete(MemberVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		log.info(vo);
		// 처리 결과에 대한 메시지 처리
		if(service.delete(vo) == 1) {
			rttr.addFlashAttribute("msg", "회원관리 글삭제가 되었습니다.");
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg",
					"회원관리 탈퇴가 되지 않았습니다. "
							+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
			return "redirect:view.do?id=" + vo.getId();
		}
	}
	
	
	
	//--- 회원관리 로그인 폼 ------------------------------------
	@GetMapping("/loginForm.do")
	public String loginForm() {
		log.info("loginForm.do");
		return "member/loginForm";
	}
	
	//--- 회원관리 로그인 처리 ------------------------------------
	@PostMapping("/login.do")
	public String login(LoginVO vo , HttpSession session , RedirectAttributes rttr) {
		log.info("login.do ==============================");
		
		// 데이터가 없으면 null이 넘어온다.
		LoginVO loginVO =  service.login(vo);
		// 로그인 실패시 오류 메세지 출력
		if(loginVO == null){
			rttr.addFlashAttribute("msg","정보가 틀립니다. 다시 확인해주세요");
			return "redirect:/member/loginForm.do";
		}
		session.setAttribute("login", loginVO);
		rttr.addFlashAttribute("msg",
				loginVO.getName() + "님은 " + loginVO.getGradeName() + "(으)로 로그인 되었습니다.");
		
		return "redirect:/main/main.do";
	}
	
	@GetMapping("/logout.do")
	public String logout(LoginVO vo , HttpSession session , RedirectAttributes rttr) {
	
		log.info("logout.do ====================== ");
		
		session.removeAttribute("login");
		
		rttr.addFlashAttribute("msg"," 로그아웃 완료되었습니다. ");
		
		return "redirect:/main/main.do";
		
	}
	
}
