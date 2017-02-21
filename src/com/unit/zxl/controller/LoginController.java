package com.unit.zxl.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.operations.Mult;
import com.unit.zxl.entity.Menu;
import com.unit.zxl.entity.User;
import com.unit.zxl.service.IMenuService;
import com.unit.zxl.service.IUserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Resource
	private IMenuService menuService;
	@Resource
	private IUserService userService;
	@RequestMapping("")
	public String toLogin(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}
	@RequestMapping("/user")
	public ModelAndView userLogin(HttpServletRequest request,ModelAndView mv,User user,HttpServletResponse response){
		User user2 = userService.getUserIdByUser(user);
		if(user2 != null){
			request.getSession().setAttribute("userName", user2.getUserName());
			request.getSession().setAttribute("userId", user2.getId());
		}else{
			mv.setViewName("login");
			request.getSession().invalidate();
			try {
				response.sendRedirect(request.getContextPath() +"/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}
		try {
			response.sendRedirect(request.getContextPath() +"/index");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
}
