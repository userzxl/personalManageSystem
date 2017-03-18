package com.unit.zxl.dao;

import java.util.List;

import com.unit.zxl.entity.Track;

public interface TrackMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Track record);

    int insertSelective(Track record);

    Track selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Track record);

    int updateByPrimaryKey(Track record);
    List<Track> getTrackList();
}