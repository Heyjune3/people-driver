package com.gls.ppldv.user.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Aspect // AOPAdvice 클래스임을 명시
@Slf4j
@Component // component 등록
@NoArgsConstructor
public class AOPAdvice {
	
	@Around("execution(* com.gls.ppldv.user.service.MemberServiceImpl.*(..))")
	public Object serviceLog(ProceedingJoinPoint pjp) throws Throwable{
		log.info("========================================");
		log.info("------------ AROUND START --------------");
		log.info("target : {}", pjp.getTarget()); // 패턴으로 지정한 클래스
		log.info("name : {}", pjp.getSignature().getName()); // 타겟이 되는 joinpoint 메소드 이름
		log.info("parameter : {}", Arrays.toString(pjp.getArgs())); // 받아오는 파라미터
		// Before
		Object o = pjp.proceed();		// target 실체 객체의 pointcut method 호출
		// AFTER
		log.info("around AFTER : {}", o); // 실제 메서드가 반환한 결과
		log.info("-------------- AROUND END --------------");
		log.info("========================================");
		return o;
	}
}
