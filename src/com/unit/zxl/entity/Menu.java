package com.unit.zxl.entity;

import javax.annotation.Resource;

public class Menu {
    private Integer menuId;

    private String menuName;
    
    private String menuAddr;
    private String menuParent;
    
    private String menuNum;

    public String getMenuNum() {
		return menuNum;
	}

	public void setMenuNum(String menuNum) {
		this.menuNum = menuNum;
	}

	public Integer getMenuId() {
        return menuId;
    }

    public String getMenuParent() {
		return menuParent;
	}

	public void setMenuParent(String menuParent) {
		this.menuParent = menuParent;
	}

	public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuAddr() {
		return menuAddr;
	}

	public void setMenuAddr(String menuAddr) {
		this.menuAddr = menuAddr;
	}

	public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }
}