package com.dao;

import com.bean.OrgDeptKey;

public interface OrgDeptMapper {
    int deleteByPrimaryKey(OrgDeptKey key);

    int insert(OrgDeptKey record);

    int insertSelective(OrgDeptKey record);
}