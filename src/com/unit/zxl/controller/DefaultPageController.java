/**
 * 
 */
package com.unit.zxl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 34848
 * 默认页面
 */
@Controller
@RequestMapping("/defaultPage")
public class DefaultPageController {
	@RequestMapping
	public String toDefault(){
		return "defaultPage";
	}
}
