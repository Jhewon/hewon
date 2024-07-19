package com.webjjang.member.service;

import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.member.dao.MemberDAO;
import com.webjjang.member.vo.LoginVO;

public class MemberNewMsgCntService implements Service {

	private MemberDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (MemberDAO) dao;
	}

	@Override
	public Long service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - MemberDAO.getNewMsgCnt()
		// AjaxController - (Execute)
		// - [MemberLoginService] - MemberDAO.getNewMsgCnt()
		return dao.getNewMsgCnt((String) obj);
	}

}
