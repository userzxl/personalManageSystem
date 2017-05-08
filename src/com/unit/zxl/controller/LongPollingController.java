/**
 * 
 */
package com.unit.zxl.controller;


import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("/ajax")
public class LongPollingController {
	
	@RequestMapping
	public void returnModel(HttpServletRequest request,HttpServletResponse response){
		Date nowDate = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = format.format(nowDate);
		response.setContentType("text/json;charset=utf-8");
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        try {
			response.getWriter().print(dateString);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
}
