package com.dao;

import com.bean.Vcard;

public interface VcardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Vcard record);

    int insertSelective(Vcard record);

    Vcard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Vcard record);

    int updateByPrimaryKey(Vcard record);
}