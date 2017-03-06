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
@RequestMapping("/selfUtils")
public class PersonalUtilsController {
	@RequestMapping("/mhxyUtils")
	public ModelAndView toMhxyUtils(ModelAndView mv){
		mv.setViewName("selfUtils/mhxyUtils");
		return mv;
		
	}
	@RequestMapping("/mapUtils")
	public ModelAndView toMapUtils(ModelAndView mv){
		mv.setViewName("selfUtils/mapUtils");
		return mv;
		
	}
}
