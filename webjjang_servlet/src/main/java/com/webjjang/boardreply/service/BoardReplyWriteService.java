package com.webjjang.boardreply.service;

import com.webjjang.board_reply.dao.BoardReplyDAO;
import com.webjjang.board_reply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class BoardReplyWriteService implements Service {
	
	private BoardReplyDAO dao;
	
	// dao setter 
	public void setDAO(DAO dao) {
		this.dao=(BoardReplyDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// DB 처리는 DAO에서 처리 - BoardDAO.write()
		// BoardReplyController - (Execute) - [BoardreplyListService] - BoardreplyDAO.write()
		return dao.write((BoardReplyVO)obj);
	}
}
