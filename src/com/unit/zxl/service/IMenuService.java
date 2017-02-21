package com.unit.zxl.service;

import java.util.List;

import com.unit.zxl.entity.Menu;

public interface IMenuService {
	public Menu getMenuById(int menuId);

	public List<Menu> getMenuList();
}
