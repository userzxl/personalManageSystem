package com.unit.zxl.utils;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.unit.zxl.entity.User;
import com.unit.zxl.service.IUserService;

@RunWith(JUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
@Transactional  
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)  
public class Test {
	private static Logger logger = Logger.getLogger(Test.class);
	@Resource
	private IUserService userService = null;
	
	@org.junit.Test
	public void test1(){
		User user = userService.getUserById(1);  
        System.out.println(user.getUserName()+"success");  
//        logger.info("值："+user.getUserName());  
	}
}
