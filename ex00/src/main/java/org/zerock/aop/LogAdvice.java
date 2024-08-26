package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect // APO 프로그램 지정
@Log4j
@Component
public class LogAdvice {

	@Around("execution(* org.zerock.*.service.*ServiceImpl.*(..))")
	// ProceedingJoinPoint - 실행해야할 객체(~ServiceImpl) + parameter
	public Object logTime(ProceedingJoinPoint pjp) throws Throwable{
		
		// 결과를 저장하는 변수
		Object result = null;
		
		// 시작 시간
		long start = System.currentTimeMillis();
		log.info("================================ [AOP 실행] ====================================");
		// 실행 되는 객체 실행
		log.info(" + 실행 객체 : " + pjp.getTarget());
		log.info(" + 실행 매소드 : " + pjp.getSignature());
		// 전달되는 파라메터 데이터 출력
		log.info(" + 전달 데이터 : " + Arrays.toString(pjp.getArgs()));
		
		// 실행하는 부분 - 다른 AOP가 있으면 그쪽으로 가서 진행처리 하세요.
		result = pjp.proceed();
		// 실행한 결과 데이터 출력
		log.info(" + 전달 데이터 : " + result);
		
		// 끝나는 시간 저장
		long end = System.currentTimeMillis();
		
		// 실행한 시간 출력
		log.info(" + 소요시간: " + (end - start));
		
		return result;
	}
	
}
