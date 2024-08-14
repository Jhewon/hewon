package org.zerock.board.service;

import java.util.List;

import org.zerock.board.vo.BoardVO;
import com.webjjang.util.page.PageObject;


public interface BoardService {
	
	// 일반 게시판 리스트
	public List<BoardVO> list(PageObject pageObject);
	// 일반 게시판 글등록
	public Integer write(BoardVO vo);
	// 일반 게시판 상세보기
	public BoardVO view(Long no, Long inc);
	// 일반 게시판 수정
	public Integer update(BoardVO vo);
	// 일반 게시판 글 삭제
	public Integer delete(BoardVO vo);
}
