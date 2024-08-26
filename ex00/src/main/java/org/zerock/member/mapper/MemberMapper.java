package org.zerock.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface MemberMapper {

	// 회원관리 리스트
	public List<MemberVO> list(PageObject pageObject);
	
	// 회원관리 리스트 페이지 처리를 위한 전체 데이터 개수
	public Long getTotalRow(PageObject pageObject);
	
	// 글보기 조회수 1 증가
	public Integer increase(Long no);
	
	// 글보기
	public MemberVO view(Long no);

	// 회원 가입
	public Integer write(MemberVO vo);
	// 글등록 트랜젝션 처리 테스트
	// public Integer writeTx(MemberVO vo);
	
	// 글수정
	public Integer update(MemberVO vo);
	
	// 글삭제
	public Integer delete(MemberVO vo);
	
	// 회원 탈퇴
	public LoginVO login(LoginVO vo);
	
}
