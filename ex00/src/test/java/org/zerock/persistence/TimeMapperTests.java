package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//test에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
//설정 파일 지정 -> 서버와 상관이 없음. : root-context.xml
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//log 객체 생성 -> lombok : log 이름으로  처리
@Log4j
public class TimeMapperTests {

	// 자동 DI - root-context.xml에 bean 태그로 설정
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		log.info("-------------[Mapper 어노테이션 테스트]----------------------");
		
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
		
	}
	
	@Test
	public void testGetTime2() {
		log.info("-------------[Mapper Mapper.xml 테스트]----------------------");
		
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime2());
		
	}
	
	
}
