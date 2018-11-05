package com.service;

        import com.bean.Car;
        import com.github.pagehelper.PageInfo;

public interface CarService {
    int deleteByPrimaryKey(Integer id);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

    //分页查询
    PageInfo<Car> servletAll(int pageindex,int pagesize);

    //通过车牌查询
    Car servletByCarid(String carid);

}
