package org.zerock.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public String exception(Exception ex , Model model) {
		
		log.error("exception......" + ex.getMessage());
		
		// jsp 로 ex 전달.
		model.addAttribute("exception", ex);
		
		log.error("model" + model);
		return "error_page";
		
	}
	
	// jsp 가 없는경우 처리 안함 - web.xml 에서 처리
	// 404 error  대한 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		
		return "custom404";
	}
	
}
