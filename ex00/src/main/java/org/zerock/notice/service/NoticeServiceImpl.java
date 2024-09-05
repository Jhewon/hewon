package org.zerock.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.notice.mapper.NoticeMapper;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

//자동 생성을 위한 어노테이션
//- @Controller - url : HTML, @Service - 처리, @Repository - 데이터 저장, 
//@Component - 구성체, @RestController - url : data : ajax, @~Advice - 예외 처리
@Service
@Log4j
// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
@Qualifier("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{

	// 자동 DI 적용 - @Setter, @Autowired, @Inject
	@Inject
	private NoticeMapper mapper;
	
	// 공지사항 리스트
	@Override
	public List<NoticeVO> list(PageObject pageObject) {
		log.info("list() 실행");
		// 전체 데이터 개수 구하기
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	// 공지사항 글보기
	@Override
	public NoticeVO view(Long no, int inc) {
		log.info("view() 실행");
		if(inc == 1) mapper.increase(no);
		return mapper.view(no);
	}
	
	// 공지사항 글등록
	// @Transactional - insert 2번이 성공을 해야 commit 한다. 한개라도 오류가 나면 rollback.
	// @Transactional
	@Override
	public Integer write(NoticeVO vo) {
		Integer result = mapper.write(vo); // 글번호를 시퀀스에서 새로운 번호 사용
		// log.info(vo);
		// vo.setNo(10000L);
		// mapper.writeTx(vo); // 위에서 사용한 글번호 재사용 - PK 예외 발생
		return result;
	}
	
	// 공지사항 글수정
	@Override
	public Integer update(NoticeVO vo) {
		log.info(vo);
		return mapper.update(vo);
	}
	
	// 공지사항 글삭제
	@Override
	public Integer delete(NoticeVO vo) {
		log.info(vo);
		return mapper.delete(vo);
	}
	
}
