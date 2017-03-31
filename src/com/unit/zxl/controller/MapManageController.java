/**
 * 
 */
package com.unit.zxl.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.unit.zxl.entity.Track;
import com.unit.zxl.impl.TrackServiceImpl;
import com.unit.zxl.service.ITrackService;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("/selfUtils/mapUtils")
public class MapManageController {
	@Resource
	private ITrackService iTrackService;
	@RequestMapping("/getTrack")
	@ResponseBody
	public String getTrack(HttpServletResponse response){
		List<Track> trackList = iTrackService.getTrackList();
		String array = JSON.toJSONString(trackList);
		return array;
		
	}
	@RequestMapping("/transPoint")
	@ResponseBody
	public String transPoint(HttpServletResponse response){
		List<Track> getTransTrackList = iTrackService.getTransTrackList();
		String array = JSON.toJSONString(getTransTrackList);
		return array;
		
	}
	@RequestMapping("/transPointSave")
	@ResponseBody
	public int transPointSave(HttpServletRequest request,HttpServletResponse response){
		String transPoints = request.getParameter("transPoints");
		List<Track> transList = (List<Track>) JSONArray.toCollection(JSONArray.fromObject(transPoints),Track.class);	
		iTrackService.updatePoints(transList);
		return 1;
		
	}
}
