package com.ibaixiong.merchant.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.SsssOrder;

public interface SsssOrderDao {
    int deleteByPrimaryKey(Long id);

    int insert(SsssOrder record);

    int insertSelective(SsssOrder record);

    SsssOrder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SsssOrder record);

    int updateByPrimaryKey(SsssOrder record);
    
    /**
     * 查询某个4S店的订单情况
     * @param map
     * @return
     */
    SsssOrder getssSsssOrder(Map<String, Object> map);
    
    List<SsssOrder> getList(Map<String, Object> map);
    
    List<SsssOrder> getListBySearch(Map<String, Object> map);
    
    /**
     * 获取未将冻结金额转成可用余额的数据
     * @author zhaolei
     * @date 2016年1月4日
     * @param status
     * @param endDate
     * @return
     */
    List<SsssOrder> getOrderByFreezedMoney(@Param("status")Byte status,@Param("endDate")Date endDate);
    /**
     * 查询店铺订单或4S店订单
     * @param ssssId
     * @param orderType
     * @return
     */
    List<SsssOrder> querySsssOrder(@Param("ssssId")Long ssssId,@Param("orderType")Byte orderType);
    /**
     * 搜索4s店订单
     * @param map
     * @return
     */
    List<SsssOrder> querySsssOrders(Map<String, Object> map);

	List<SsssOrder> selectByInfoId(Long id);
	
	List<SsssOrder> getOrderByNumber(String number);
}