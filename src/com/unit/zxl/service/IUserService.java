package com.unit.zxl.service;

import com.unit.zxl.entity.User;

public interface IUserService {
	public User getUserById(int userId);
	public User getUserIdByUser(User user);
}
