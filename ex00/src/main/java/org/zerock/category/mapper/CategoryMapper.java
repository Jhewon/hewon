package org.zerock.category.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.category.vo.CategoryVO;


@Repository
public interface CategoryMapper {

	// 카테고리 리스트
	public List<CategoryVO> list(@Param("cate_code1") Integer cate_code1);
	
	// 대분류 카테고리 등록
	public Integer writeBig(CategoryVO vo);
	// 중분류 카테고리 등록
	public Integer writeMid(CategoryVO vo);
	// 글등록 트랜젝션 처리 테스트
	// public Integer writeTx(CategoryVO vo);
	
	// 카테고리 수정
	public Integer update(CategoryVO vo);
	
	// 카테고리 삭제
	public Integer delete(CategoryVO vo);
	
}
