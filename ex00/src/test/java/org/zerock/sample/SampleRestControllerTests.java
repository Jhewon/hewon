package org.zerock.sample;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.domain.SampleDTO;

import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// test에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
// 설정 파일 지정 -> 서버와 상관이 있음. : root-context.xml, servlet-context.xml
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
// log 객체 생성 -> lombok : log 이름으로  처리
@Log4j
public class SampleRestControllerTests {

	// WebApplicationContext의 자동 생성과 DI를 확인을 위해 객체 전달 : 자동 DI
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; // Spring의 WebMVC 테스팅을 위한 가짜 MVC 객체
	
	@Before // Test 전에 실행하는 메서드
	public void setup() { // mockMvc 세팅하는 메서드
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	// 테스트할 메서드 작성 -> 여러개 가능 : 한꺼번에 다 테스트 한다.
	@Test
	public void testConvert() throws Exception{
		
		// 전달하는 개체 SampleDTO
		SampleDTO dto = new SampleDTO("홍길동", 10);
		
		// json 데이터 String으로 만들어서 전달
		String jsonStr = new Gson().toJson(dto);
		
		log.info(jsonStr);
		
		ResultActions ra = mockMvc.perform(
				post("/sampleRest/sample") // 요청 uri
				.contentType(MediaType.APPLICATION_JSON) // 넘겨 주는 data type : json
				.content(jsonStr)) // 넘겨 주는 data
				.andExpect(status().is(200));
		
	}
	
}
