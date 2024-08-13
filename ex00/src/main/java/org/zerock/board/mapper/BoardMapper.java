package org.zerock.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface BoardMapper {
	// 게시판 리스트
	public List<BoardVO> list(PageObject pageObject);
	// 게시판 조회수 증가
	public int inc(Long no);
	// 게시판 상세보기
	public BoardVO view(Long no);
	// 게시판 글등록
	public Integer write(BoardVO vo);
}
