package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.board.mapper.BoardMapper;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

//자동 생성을 위한 어노테이션
//-@Controller - url : HTML, @Service - 처리 ,@Repository - 데이터 저장,
//@Component - 구성체 ,@RestController - url : data : ajax, @~Advice - 예외 처리
@Service
@Log4j
//타입이 같으면 식별할 수 있는 문자열 지정 - id를 지정
@Qualifier("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	//자동 DI 적용
	@Inject
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> list(PageObject pageObject) {
		log.info("list() 실행");
		// 전체 데이터 개수 구하기
		pageObject.setTotalRow(boardMapper.getTotalRow(pageObject));
		return boardMapper.list(pageObject);		
	}
	// 일반 게시판 글 상세보기
	@Override
	public BoardVO view(Long no, Long inc) {
		log.info("view()");
		if(inc == 1)
			boardMapper.inc(no);
		return boardMapper.view(no);
	}
	// 일반 게시판 글 작성
	@Override
	public Integer write(BoardVO vo) {
		log.info("vo = " + vo);
		return boardMapper.write(vo);		
	}
	// 일반 게시판 글 수정
	@Override
	public Integer update(BoardVO vo) {
		log.info("update()");
		return boardMapper.update(vo);
	}
	// 일반 게시판 글 삭제
	@Override
	public Integer delete(BoardVO vo) {
		log.info("delete()");
		return boardMapper.delete(vo);
	}
}
