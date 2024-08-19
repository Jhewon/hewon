package org.zerock.boardreply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface BoardReplyMapper {

	// 1-2.  전체 데이터 갯수
	public Long getTotalRow(PageObject pageObject);
	// 1-2. list
	// 메소드에 처리 되는 데이터는 기본이 1개이다. 2개 이상일 경우 @Param 을 사용. map 으로 만들어서 1개를 넘긴다.
	public List<BoardReplyVO> list(@Param("pageObject") PageObject pageObject , @Param("no") Long no);
	// 2. write
	public Integer write(BoardReplyVO vo);
	// 3. update
	public Integer update(BoardReplyVO vo);
	// 4. delete
	public Integer delete(BoardReplyVO vo);
	
}
