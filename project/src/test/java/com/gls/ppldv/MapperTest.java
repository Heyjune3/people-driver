package com.gls.ppldv;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gls.ppldv.user.mapper.MemberMapper;

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
			int result = mapper.register("img");
			System.out.println("=========================");
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // end test
	
}
