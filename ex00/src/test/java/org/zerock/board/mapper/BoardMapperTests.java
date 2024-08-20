package org.zerock.board.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// Mapper 메서드 동작 테스트(단위테스트)
//test에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
//설정 파일 지정 -> 서버와 상관이 없음. : root-context.xml
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//log 객체 생성 -> lombok : log 이름으로  처리
@Log4j
public class BoardMapperTests {

	// lombok의 setter를 이용해서 Spring의 Autowired를 이용한 자동 DI 적용.
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	// list() test
	@Test
	public void testList() {
		
		log.info("[일반 게시판 리스트(list()) Test]------------------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드 코딩한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.list(pageObject));
	}
	
	// getTotalRow() test
	@Test
	public void testGetTotalRow() {
		
		log.info("[일반 게시판 리스트 글의 개수(getTotalRow()) Test]------------------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드 코딩한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.getTotalRow(pageObject));
	}
	
	
	// increase() test
	@Test
	public void testIncrease() {
		
		log.info("[일반 게시판 글보기 조회수 1 증가(increase()) Test]------------------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드 코딩한다.
		// no 생성
		Long no = 175L;
		log.info(mapper.increase(no));
	}
	
	// view() test
	@Test
	public void testView() {
		
		log.info("[일반 게시판 글보기 (view()) Test]------------------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드 코딩한다.
		// no 생성
		Long no = 175L;
		log.info(mapper.view(no));
	}
	
}
