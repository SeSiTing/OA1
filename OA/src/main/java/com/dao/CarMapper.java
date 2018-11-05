package com.dao;

import com.bean.Car;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

    //查询所有车
    List<Car> servletAll();

    //通过车牌查询
    Car servletByCarid(String carid);
}