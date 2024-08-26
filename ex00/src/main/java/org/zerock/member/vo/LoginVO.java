package org.zerock.member.vo;

import lombok.Data;

@Data
public class LoginVO {

	public String id,pw,name,photo,gradeName;
	public Integer gradeNo , newMsgCnt;
}
