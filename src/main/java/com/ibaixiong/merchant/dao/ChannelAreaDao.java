package com.ibaixiong.merchant.dao;

import java.util.List;

import com.ibaixiong.entity.ChannelArea;

public interface ChannelAreaDao {
    int deleteByPrimaryKey(Long id);

    int insert(ChannelArea record);

    int insertSelective(ChannelArea record);

    ChannelArea selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ChannelArea record);

    int updateByPrimaryKey(ChannelArea record);
    
    List<ChannelArea> queryChannelAreas(Long merchantId);
}