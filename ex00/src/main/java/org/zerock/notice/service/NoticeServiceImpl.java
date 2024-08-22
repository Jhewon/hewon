package org.zerock.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.notice.mapper.NoticeMapper;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
@Qualifier("noticServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> list(PageObject pageObject) {
		log.info("notice-list 실행");
		// TODO Auto-generated method stub
		return mapper.list(pageObject);
	}

}
