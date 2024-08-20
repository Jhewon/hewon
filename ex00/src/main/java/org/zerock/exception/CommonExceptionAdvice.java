package org.zerock.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

// 자동 생성
// @Controller, @RestController, @Service, @Repository, @~Advice
@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {

	// 500 번 예외 처리
	@ExceptionHandler(Exception.class)
	public String exeception(Exception ex, Model model) {
		
		log.error("Exception ........" + ex.getMessage());
		
		// jsp로 ex를 전다.
		model.addAttribute("exception", ex);
		
		log.error(model);
		
		return "error_page";
	}
	
	// 404 오류에 대한 처리 - jsp가 없는 경우는 처리 안함. web.xml에서 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "custom404";
	}
}
