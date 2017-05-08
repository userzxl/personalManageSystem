/**
 * 
 */
package com.unit.zxl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.unit.zxl.entity.Track;
import com.unit.zxl.service.ITrackService;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("/selfUtils")
public class PersonalUtilsController {
	@Resource
	private ITrackService iTrackService;
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
