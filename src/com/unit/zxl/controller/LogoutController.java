/**
 * 
 */
package com.unit.zxl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("/logout")
public class LogoutController {
	@RequestMapping
	public ModelAndView logout(HttpServletRequest request,ModelAndView mv){
		request.getSession().invalidate();
		mv.setViewName("login");
		return mv;
		
	}

}
