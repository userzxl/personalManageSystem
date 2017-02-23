package com.unit.zxl.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<Map> map = new ArrayList<Map>();		
		for (Menu menu1 : menu) {
			if(menu1.getMenuParent().equals("0")){								
				Map map2 = new HashMap<>();	
				map2.put("parent", menu1);
				
				if(menu1.getMenuChild() != null && menu1.getMenuChild().equals("1")){
					System.out.println(menu1.getMenuChild());
					List<Menu> menuList = new ArrayList<Menu>();
					for (Menu menu2 : menu) {
						
						if(menu2.getMenuParent().equals(menu1.getMenuNum()) ){
							menuList.add(menu2);
						}
					}
					map2.put("children", menuList);
				}
				map.add(map2);
			}						
		}
		model.addAttribute("menu", map);
		return "index";
		
	}
}
