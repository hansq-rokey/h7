package com.ibaixiong.merchant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.MerchantProduct;

public interface MerchantProductDao {
    int deleteByPrimaryKey(Integer id);

    int insert(MerchantProduct record);

    int insertSelective(MerchantProduct record);

    MerchantProduct selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MerchantProduct record);

    int updateByPrimaryKey(MerchantProduct record);
    
    int deleteByMerchantId(Long merchantId);
    
    List<MerchantProduct> queryList(Long merchantId);
    
    MerchantProduct getMerchantProduct(@Param("merchantId")Long merchantId,@Param("productId")Long productId);
}