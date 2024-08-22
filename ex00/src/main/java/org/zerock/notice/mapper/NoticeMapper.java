package org.zerock.notice.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface NoticeMapper {
	public List<NoticeVO> list(PageObject pageObject);
}
