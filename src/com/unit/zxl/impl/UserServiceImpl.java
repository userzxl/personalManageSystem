package com.unit.zxl.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.unit.zxl.dao.UserMapper;
import com.unit.zxl.entity.User;
import com.unit.zxl.service.IUserService;

@Service("userService")

public class UserServiceImpl implements IUserService {
	
	@Resource
	private UserMapper userMapper;
	@Override
	public User getUserById(int userId) {		
		return this.userMapper.selectByPrimaryKey(userId);
	}
	@Override
	public User getUserIdByUser(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserIdByUser(user);
	}

}
