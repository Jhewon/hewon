package com.beetmarket.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beetmarket.member.vo.LoginVO;
import com.beetmarket.member.vo.MemberVO;
import com.webjjang.util.page.PageObject;

public interface MemberMapper {

	public List<MemberVO> list(@Param("pageObject") PageObject pageObject);
	
	public LoginVO login(LoginVO vo);

	public Long getTotalRow(@Param("pageObject") PageObject pageObject);
	
}
