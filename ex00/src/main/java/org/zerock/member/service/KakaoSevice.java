package org.zerock.member.service;

import org.springframework.stereotype.Service;
import org.zerock.member.vo.KakaoVO;


@Service
public interface KakaoSevice {

	// 카카오토큰받기
	public String getAccessToken(String authorize_code);

	// 카카오회원정보조회
	public KakaoVO getUserInfo(String access_Token);
	
}
