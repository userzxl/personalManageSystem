package com.unit.zxl.service;

import java.util.List;


import com.unit.zxl.entity.Track;

public interface ITrackService {
	public Track getTrack();

	public List<Track> getTrackList();
	
	public List<Track> getTransTrackList();
	
	public void updatePoints(List<Track> list);
}
