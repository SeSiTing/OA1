package com.dao;

import com.bean.Trip;

public interface TripMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Trip record);

    int insertSelective(Trip record);

    Trip selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Trip record);

    int updateByPrimaryKey(Trip record);
}