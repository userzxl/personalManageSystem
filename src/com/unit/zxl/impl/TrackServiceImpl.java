/**
 * 
 */
package com.unit.zxl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.unit.zxl.dao.TrackMapper;
import com.unit.zxl.entity.Track;
import com.unit.zxl.service.ITrackService;

/**
 * @author 34848
 *
 */
@Service("trackService")
public class TrackServiceImpl implements ITrackService {
	@Resource
	private TrackMapper trackMapper;

	/* (non-Javadoc)
	 * @see com.unit.zxl.service.ITrackService#getTrack()
	 */
	@Override
	public Track getTrack() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.unit.zxl.service.ITrackService#getTrackList()
	 */
	@Override
	public List<Track> getTrackList() {
		// TODO Auto-generated method stub
		
		return trackMapper.getTrackList();
	}

}
