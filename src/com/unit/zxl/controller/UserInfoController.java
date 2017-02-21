package com.unit.zxl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/user")
public class UserInfoController {
	@RequestMapping(value="/info",method=RequestMethod.POST)
	public ModelAndView userInfo(HttpServletRequest request,HttpServletResponse response,ModelAndView mv){
		mv.setViewName("userinfo");
		return mv;
		
	}
	

}
