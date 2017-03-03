/**
 * 
 */
package com.unit.zxl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("/sysManage/menuManage")
public class MenuManageController {
	@RequestMapping("")
	public ModelAndView toMenuManage(ModelAndView mv){
		mv.setViewName("sysManage/menuManage");
		return mv;
	}
}
