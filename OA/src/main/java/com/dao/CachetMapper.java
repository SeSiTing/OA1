package com.dao;

import com.bean.Cachet;

public interface CachetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cachet record);

    int insertSelective(Cachet record);

    Cachet selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cachet record);

    int updateByPrimaryKey(Cachet record);
}