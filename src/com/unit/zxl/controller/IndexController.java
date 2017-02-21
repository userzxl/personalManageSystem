package com.unit.zxl.controller;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.scripting.xmltags.VarDeclSqlNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.unit.zxl.entity.Menu;
import com.unit.zxl.service.IMenuService;

@Controller
@RequestMapping("/index")
public class IndexController{
	
	@Resource
	private IMenuService menuService;
	@RequestMapping("")
	public String toIndex(HttpServletRequest request,Model model){
		List<Menu> menu = menuService.getMenuList();
		model.addAttribute("menu", menu);
		return "index";
		
	}
}
