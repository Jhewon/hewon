package com.webjjang.boardreply.service;

import com.webjjang.board_reply.dao.BoardReplyDAO;
import com.webjjang.board_reply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class BoardReplyUpdateService implements Service {

	private BoardReplyDAO dao;
	
	//dao setter 
	public void setDAO(DAO dao) {
		this.dao=(BoardReplyDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board_reply 에서 수정 쿼리 실행해서 데이터 처리
		// BoardReplyController - (Execute) - [BoardReplyListService] - BoardReplyDAO.update()
		return dao.update((BoardReplyVO)obj);
	}

	

}
