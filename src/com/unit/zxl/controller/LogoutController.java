/**
 * 
 */
package com.unit.zxl.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView logout(HttpServletRequest request,ModelAndView mv,HttpServletResponse response){
		request.getSession().invalidate();
		try {
			response.sendRedirect(request.getContextPath() +"/welcome");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
		
	}

}
