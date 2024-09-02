package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.category.service.CategoryService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	@Qualifier("categoryServiceImpl")
	private CategoryService CategoryService;
	
	
	
	//--- 상품 중분류 가져옿기 ------------------------------------
	@GetMapping("/getMidList.do")
	public String getMidList(Model model, Integer cate_code1) {
		log.info("getMidList.do");
		// 중분류 를 가져와서 JSP 로 넘기기
		model.addAttribute("midList",CategoryService.list(cate_code1));
		// midList.jsp 에 select tag 작성
		return "goods/midList";
	}
	
}
