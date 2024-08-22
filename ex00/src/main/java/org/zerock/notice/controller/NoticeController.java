package org.zerock.notice.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.notice.service.NoticeService;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService service;
	
	@GetMapping("/list.do")
	public String list(Model model , HttpServletRequest request) throws Exception{
		
		PageObject pageObject = PageObject.getInstance(request);
		
		model.addAttribute("list",service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "notice/list";
	}
}
