/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.merchant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.ChannelArea;
import com.ibaixiong.merchant.dao.ChannelAreaDao;
import com.ibaixiong.merchant.service.ChannelAreaService;

/**
 * 
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年8月30日
 * @since  1.0.0
 */
@Service
public class ChannelAreaServiceImpl implements ChannelAreaService {

	@Resource
	ChannelAreaDao channelAreaDao;
	/* (non-Javadoc)
	 * @see com.ibaixiong.merchant.service.ChannelAreaService#queryChannelAreas(java.lang.Long)
	 */
	@Override
	public List<ChannelArea> queryChannelAreas(Long merchantId) {
		// TODO Auto-generated method stub
		return channelAreaDao.queryChannelAreas(merchantId);
	}

}
