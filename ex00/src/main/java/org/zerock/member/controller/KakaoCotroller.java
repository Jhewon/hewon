package org.zerock.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.member.service.KakaoSevice;
import org.zerock.member.vo.KakaoVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/kakao")
public class KakaoCotroller {

	@Autowired
	@Qualifier("KakaoServiceImpl")
	private KakaoSevice service;
	
	//카카오 로그인 토큰받기
	@RequestMapping(value="/kakao.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpSession session ) throws Exception {
		System.out.println("#########" + code);
		String access_Token = service.getAccessToken(code);
		KakaoVO authUser = service.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
		
		
		// 아래 코드가 추가되는 내용
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("authUser", authUser);
		//session.setAttribute("kakaoN", userInfo);
		//session.setAttribute("kakaoE", userInfo.getK_email());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.

		return "kakao/kakao";
	}
	
	
}
