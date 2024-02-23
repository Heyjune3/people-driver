package com.gls.ppldv;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gls.ppldv.user.entity.Gender;
import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.entity.Role;
import com.gls.ppldv.user.mapper.MemberMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations= {"classpath:/spring/root-context.xml"}
)
public class MapperTest {

	@Autowired
	MemberMapper mapper;
	
	@Test
	public void test1() {
		try {
			Member member = new Member();
			member.setName("김규민");
			member.setEmail("ool9898@naver.com");
			member.setPassword("a11111111");
			member.setBirth(new Date());
			member.setPhoneNo("01000000000");
			member.setPc5(55555);
			member.setAddress("부산");
			member.setDetail("test");
			member.setRole(Role.DEVELOPER);
			member.setGender(Gender.MALE);
			int result = mapper.register(member);
			System.out.println("=========================");
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // end test
	
	@Test
	public void test2() {
		try {
			Member result = mapper.idCheck("ool9898@naver.com");
			System.out.println("=========================");
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // end test
}
