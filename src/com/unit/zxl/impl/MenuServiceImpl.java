package com.unit.zxl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.unit.zxl.dao.MenuMapper;
import com.unit.zxl.entity.Menu;
import com.unit.zxl.service.IMenuService;

@Service("menuService")

public class MenuServiceImpl implements IMenuService {
	
	@Resource
	private MenuMapper menuMapper;
	@Override
	public Menu getMenuById(int menuId) {		
		return this.menuMapper.selectByPrimaryKey(menuId);
	}
	@Override
	public List<Menu> getMenuList() {		
		return this.menuMapper.selectMenuList();
	}

}
