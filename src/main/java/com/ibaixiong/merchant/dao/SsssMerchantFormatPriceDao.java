package com.ibaixiong.merchant.dao;

import com.ibaixiong.entity.SsssMerchantFormatPrice;

public interface SsssMerchantFormatPriceDao {
    int deleteByPrimaryKey(Long id);

    int insert(SsssMerchantFormatPrice record);

    int insertSelective(SsssMerchantFormatPrice record);

    SsssMerchantFormatPrice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SsssMerchantFormatPrice record);

    int updateByPrimaryKey(SsssMerchantFormatPrice record);
}