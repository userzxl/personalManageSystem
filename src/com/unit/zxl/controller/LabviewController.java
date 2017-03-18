/**
 * 
 */
package com.unit.zxl.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("/labview")
public class LabviewController {
	@RequestMapping("")
	public ModelAndView getInfo(HttpServletRequest request,ModelAndView mv){
		 BufferedReader in = null;
		try {
			in = new BufferedReader(new InputStreamReader(request.getInputStream()));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		  StringBuilder sb = new StringBuilder();   
		       String xmlHead = "";
		        String xmlContent="";
		        String line = null;  
		        try {
					while ((line = in.readLine()) != null) {  
						System.out.println(line);
						sb.append(line);   

					   }
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
		return mv;
	}
}
