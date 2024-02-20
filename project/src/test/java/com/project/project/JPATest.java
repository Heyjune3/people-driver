package com.project.project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gls.ppldv.entity.Gender;
import com.gls.ppldv.entity.Member;
import com.gls.ppldv.entity.Role;
import com.gls.ppldv.repository.MemberRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations= {"classpath:/spring/root-context.xml"}
)
public class JPATest {
	
	@Autowired
	MemberRepository memberRepo;
	
	
	// @Test
	public void test2() {
		Member member = new Member();
		member.setEmail("email");
		member.setPassword("pass");
		member.setPhoneNo("010-5555-5555");
		member.setAddress("address");
		member.setRole(Role.DEVELOPER);
		member.setGender(Gender.MALE);
		memberRepo.save(member);
		System.out.println("삽입 완료");
	}
	
	@Test
	public void test() {
		List<Member> list = memberRepo.findAll();
		System.out.println("멤버확인============================================");
		System.out.println(list);
	} // end test
}
