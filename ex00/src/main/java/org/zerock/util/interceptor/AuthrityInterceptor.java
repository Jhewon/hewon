package org.zerock.util.interceptor;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthrityInterceptor extends HandlerInterceptorAdapter  {

	// 권한 정보가 들어 있는 map<uri , 등급>
	private Map<String , Integer>  authMap = new HashMap<>();
	
	// 권한 정보를 등록 하는 초기화 블럭
	{
		// 등급이 1이면 로그인 필요 , 등급이 9면 로그인 & 관리자
		authMap.put("/boardreply/write.do", 1);
		
		// 상품 관리
		authMap.put("/goods/writeForm.do", 9);
		authMap.put("/goods/write.do", 9);
		authMap.put("/goods/updateForm.do", 9);
		authMap.put("/goods/update.do", 9);
		authMap.put("/goods/delete.do", 9);
		authMap.put("/goods/changeImage.do", 9);
		
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {

		// 권한 처리
		log.info("권한처리 interceptor ----------------------");
		
		// 요청한 내용을 계속 진행
		return super.preHandle(request, response, handler);
		} // end of preHandle
		
	
}
