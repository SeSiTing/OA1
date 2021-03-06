package com.dao;

import com.bean.RoomReserve;

public interface RoomReserveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoomReserve record);

    int insertSelective(RoomReserve record);

    RoomReserve selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoomReserve record);

    int updateByPrimaryKey(RoomReserve record);
}