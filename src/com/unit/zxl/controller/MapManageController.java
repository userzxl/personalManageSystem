/**
 * 
 */
package com.unit.zxl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.unit.zxl.entity.Track;
import com.unit.zxl.impl.TrackServiceImpl;
import com.unit.zxl.service.ITrackService;

/**
 * @author 34848
 *
 */
@Controller
@RequestMapping("selfUtils/mapUtils")
public class MapManageController {
	@Resource
	private ITrackService iTrackService;
	@RequestMapping("/getTrack")
	public ModelAndView getTrack(ModelAndView mv){
		List<Track> trackList = iTrackService.getTrackList();
		mv.addObject("track",trackList);
		mv.setViewName("selfUtils/mapUtils");
		return null;
		
	}
}
