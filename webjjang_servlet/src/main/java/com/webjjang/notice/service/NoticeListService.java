package com.webjjang.notice.service;

import java.util.List;

import com.webjjang.notice.dao.NoticeDAO;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.util.page.PageObject;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class NoticeListService implements Service {
	NoticeDAO dao;
	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao=(NoticeDAO) dao;
	}

	@Override
	public List<NoticeVO> service(Object obj) throws Exception {
		// DB notice 에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// DB 처리는 DAO에서 처리 - NoticeDAO.list()
		PageObject pageObject = (PageObject) obj;
		// 전체 데이터의 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));	
		// NoticeController - (Execute) - [NoticeListService] - NoticeDAO.list()
		return  dao.list(pageObject);
	}
	
}

