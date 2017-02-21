package com.unit.zxl.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.unit.zxl.entity.Menu;
import com.unit.zxl.service.IMenuService;

@Controller
@RequestMapping("/Menu")
public class MenuController {
	@Resource
	private IMenuService MenuService;
	
	@RequestMapping("/showMenu")
	public String toIndex(HttpServletRequest request,Model model){
		int MenuId = Integer.parseInt(request.getParameter("id"));
		Menu Menu = this.MenuService.getMenuById(MenuId);
		model.addAttribute("Menu", Menu);
		return "showMenu";		
	}
}
