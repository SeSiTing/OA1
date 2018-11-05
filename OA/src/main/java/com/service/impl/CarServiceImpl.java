package com.service.impl;

import com.bean.Car;
import com.dao.CarMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return carMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Car record) {
        return 0;
    }

    @Override
    public int insertSelective(Car record) {
        return carMapper.insertSelective(record);
    }

    @Override
    public Car selectByPrimaryKey(Integer id) {
        return carMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Car record) {
        return carMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Car record) {
        return 0;
    }

    //查询所有   封装分页
    @Override
    public PageInfo<Car> servletAll(int pageindex,int pagesize) {
        //封装模糊查条件
        Map map = new HashMap();

        PageHelper.startPage(pageindex, pagesize);
        List<Car> cars = carMapper.servletAll();//   SQL 语句
        PageInfo pageInfo = new PageInfo(cars);


        return pageInfo;
    }

    //通过车牌查询
    @Override
    public Car servletByCarid(String carid) {
        return carMapper.servletByCarid(carid);
    }
}
