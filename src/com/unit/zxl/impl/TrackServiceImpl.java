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

	/* (non-Javadoc)
	 * @see com.unit.zxl.service.ITrackService#transTracks()
	 */
	@Override
	public List<Track> getTransTrackList() {
		// TODO Auto-generated method stub
		return trackMapper.getTransTrackList();
	}

	/* (non-Javadoc)
	 * @see com.unit.zxl.service.ITrackService#updatePoins()
	 */
	@Override
	public void updatePoints(List<Track> list) {
		// TODO Auto-generated method stub
		trackMapper.updatePoints(list);
	}

}
