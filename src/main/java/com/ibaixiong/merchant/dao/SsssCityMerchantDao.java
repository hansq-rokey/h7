package com.ibaixiong.merchant.dao;

import java.util.List;
import java.util.Map;

import com.ibaixiong.entity.SsssCityMerchant;

public interface SsssCityMerchantDao {
    int deleteByPrimaryKey(Long id);

    int insert(SsssCityMerchant record);

    int insertSelective(SsssCityMerchant record);

    SsssCityMerchant selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SsssCityMerchant record);

    int updateByPrimaryKey(SsssCityMerchant record);
    
    SsssCityMerchant getByUserId(Long userId);
    
    List<SsssCityMerchant> getListByPidSearsh(Map<String, Object> map);
    
    List<SsssCityMerchant> getListByPid(Long pid);
    
    SsssCityMerchant getById(Long id);
    
    List<SsssCityMerchant> queryMerchantByParentId(Long parentId);
}