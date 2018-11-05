package com.service;

import com.bean.CarReserve;

import java.util.List;

public interface CarReserveService {
    int deleteByPrimaryKey(Integer id);

    int insert(CarReserve record);

    int insertSelective(CarReserve record);

    CarReserve selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CarReserve record);

    int updateByPrimaryKey(CarReserve record);

    //根据车牌查询时间
    List<CarReserve> servlettimebycarid(String  carid);
}
