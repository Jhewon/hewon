package org.zerock.board.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


//Mapper 메소드 동작 테스트(단위테스트)
//test에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
//설정 파일 지정 -> 서버와 상관이 없음. : root-context.xml으로 직접 지정
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//로그 객체 생성 -> lombok : log 이름으로 처리
@Log4j
public class BoardMapperTests {
	
	// lombok setter 를 이용해서 Spring 의 @Autowired 를 자동 DI 적용
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	// list() test
	@Test
	public void testList() {
		
		log.info("--------------------------[Board.List() testing]--------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드코딩 한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.list(pageObject));
	}
	
	// getTotalRow() test
	@Test
	public void testTotalRow() {
		
		log.info("--------------------------[Board.TotalRow() testing]--------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드코딩 한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.getTotalRow(pageObject));
	}
	// inc() test
	@Test
	public void testinc() {
		
		log.info("--------------------------[Board.inc() testing]--------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드코딩 한다.
		Long no = 81L;
		log.info(mapper.inc(no));
	}
	// view() test
	@Test
	public void testview() {
		
		log.info("--------------------------[Board.view() testing]--------------------------");
		
		// 필요한 데이터(파라메터로 넘겨지는 데이터)는 하드코딩 한다.
		Long no = 81L;
		log.info(mapper.inc(no));
	}
	
}
