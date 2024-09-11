package org.zerock.member.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.KakaoVO;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

public interface KakaoMapper {

	// 카카오 정보 저장
		public void kakaoinsert(HashMap<String, Object> userInfo);

		// 카카오 정보 확인
		public KakaoVO findkakao(HashMap<String, Object> userInfo);
}
