package org.zerock.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	public String id,pw,name,photo,gradeName,tel,gender,email,status;
	public Date birth,regDate,conDate; // regDate 회원 가입일 , conDate 최근 접속일
	public Integer gradeNo;
	
}
