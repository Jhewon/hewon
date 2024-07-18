package com.webjjang.message.service;

import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.message.dao.MessageDAO;
import com.webjjang.message.vo.MessageVO;

public class MessageWriteService implements Service {

	private MessageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (MessageDAO) dao;
	}

	@Override
	public Integer service(Object obj) throws Exception {
		MessageVO vo = (MessageVO) obj;
		// DB Message에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// DB 처리는 DAO에서 처리 - MessageDAO.write()
		// MessageController - (Execute) - [MessageWriteService] - MessageDAO.write()
		Integer result =  dao.write(vo);
		
		// 받는  사람의 아이디에 새로운 메세지 1증가 처리
		dao.increaseNewMsgCnt(vo.getAccepterId());
		
		return result;
	}

}
