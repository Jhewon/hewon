package org.zerock.member.service;

import java.util.List;

import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;
import com.webjjang.util.page.PageObject;

public interface MemberService {

	// 회원관리 리스트
	public List<MemberVO> list(PageObject pageObject);
	
	// 회원관리 글보기
	public MemberVO view(Long no, int inc);
	
	// 회원관리 글등록
	public Integer write(MemberVO vo);
	
	// 회원관리 글수정
	public Integer update(MemberVO vo);
	
	// 회원관리 글삭제
	public Integer delete(MemberVO vo);
	
	public LoginVO login(LoginVO vo);
	
}
