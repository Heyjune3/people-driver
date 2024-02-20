package com.project.project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gls.ppldv.entity.Member;
import com.gls.ppldv.mapper.MemberMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations= {"classpath:/spring/root-context.xml"}
)
public class MapperTest {

	@Autowired
	MemberMapper mapper;
	
	@Test
	public void test() {
		try {
			List<Member> list = mapper.memberList(1);
			System.out.println("=========================");
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // end test
	
}
