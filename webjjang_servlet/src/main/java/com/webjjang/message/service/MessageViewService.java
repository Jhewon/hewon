package com.webjjang.message.service;

import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.message.dao.MessageDAO;
import com.webjjang.message.vo.MessageVO;

public class MessageViewService implements Service {

	private MessageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (MessageDAO) dao;
	}

	@Override
	public MessageVO service(Object obj) throws Exception {
		// 받은 메시지인 경우 (vo.accepterId != null) 처리 - 받은 날짜, 새로운 메세지
		MessageVO vo = (MessageVO) obj;
		Long no = vo.getNo();
		String id = vo.getAccepterId();
		
		// 받은 메세지인 (vo.accepterId != null) 경우 처리
		if(vo.getAccepterId() != null) {
			int readed = dao.setReaded(no);
			if(readed == 1) dao.descreaseNewMsgCnt(id);
			
		}
		// 읽음 표시 처리 - readed : 1 - null -> sysdate , readed : 0 - acceptDate 유지
		// DB 처리는 DAO에서 처리 - MessageDAO.view()
		// MessageController - (Execute) - [MessageViewService] - MessageDAO.view()
		return dao.view(no);
	}

}
