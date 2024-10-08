package com.interyard.usedgoods.service;

import com.interyard.main.dao.DAO;
import com.interyard.main.service.Service;
import com.interyard.usedgoods.dao.UsedGoodsDAO;
import com.interyard.usedgoods.vo.UsedGoodsVO;

public class UsedGoodsWriteService implements Service {

	private UsedGoodsDAO dao;
	
	@Override
	public Integer service(Object obj) throws Exception {
		return dao.write((UsedGoodsVO) obj);
	}

	@Override
	public void setDAO(DAO dao) {
		this.dao = (UsedGoodsDAO) dao;
	}

}
