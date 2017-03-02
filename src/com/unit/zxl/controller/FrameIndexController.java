/**
 * 
 */
package com.unit.zxl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 34848
 * 子页面首页
 */
@Controller
@RequestMapping("/frameIndex")
public class FrameIndexController {
	@RequestMapping
	public ModelAndView toFrameIndex(ModelAndView mv){
		mv.setViewName("frameIndex/frameIndex");
		mv.addObject("menuName", "首页");
		return mv;
	}
}
